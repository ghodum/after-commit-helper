# setup database
require 'active_record'
require 'after_commit_helper'

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => ':memory:'
)

ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define(:version => 1) do
  create_table 'tests', :force => true do |t|
    t.integer :value, :default => 0, :null => false
    t.timestamps :null => true
  end
end

class Test < ActiveRecord::Base
  include AfterCommitHelper

  def test_values
    @test_values ||= []
  end

  def called
    $called = true
  end
end