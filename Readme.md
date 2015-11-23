Install
=======

    gem install after_commit_helper

Usage
=====

In your class, include the AfterCommitHelper concern:

    include AfterCommitHelper::Concern
    
Then call add_after_commit_callback with a block that 
should be executed when the object commits:
 
    self.add_after_commit_callback do
        # do something after self commits
    end

For a Rails application, you can set the logger that will be
used by adding an initializer with the following setting:

    # sets the AfterCommitHelper::Logger to use the Rails logger
    AfterCommitHelper::Logger.logger = Rails.logger
    
Testing
=======

To test with different rails versions:

    export BUNDLE_GEMFILE=./gemfiles/40.gemfile
    bundle install
    rake spec