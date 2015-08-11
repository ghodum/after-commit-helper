module AfterCommitHelper
  extend ActiveSupport::Concern

  included do
    require 'after_commit_helper_logger'

    # define the after_commit callbacks
    after_commit :process_after_commit_callbacks, on: [:create, :update, :destroy]
  end

  # returns the after commit callbacks to be executed
  def after_commit_callbacks
    @after_commit_callbacks ||= []
  end

  # resets the after commit callbacks
  def reset_after_commit_callbacks
    @after_commit_callbacks = []
  end

  # Add a callback to be fired once this record commits
  def add_after_commit_callback(&callback)
    after_commit_callbacks << callback
    AfterCommitHelperLogger.logger.debug 'callback added for after_commit hook'
  end

  # Fires all of the procs one at a time, any exceptions
  # will be rescued and logged, but will not be rethrown
  def process_after_commit_callbacks
    AfterCommitHelperLogger.logger.debug "Processing #{after_commit_callbacks.length} callback for the after_commit hook" if after_commit_callbacks.length > 0

    @after_commit_callbacks.each do |callback|
      begin
        callback.call
      rescue Exception => e
        AfterCommitHelperLogger.logger.debug "Exception while processing AfterCommitHelper proc: #{e.message}"
      end
    end

    # remove all of the procs, we execute one time only
    reset_after_commit_callbacks
  end
end