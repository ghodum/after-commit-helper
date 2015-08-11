Install
=======

    gem install after_commit_helper

Usage
=====

In your class, include the AfterCommitHelper concern:

    include AfterCommitHelper
    
Then call add_after_commit_callback with a block that 
should be executed when the object commits:
 
    self.add_after_commit_callback do
        # do something after self commits
    end
    
    
Testing
=======

To test with different rails versions:

    export BUNDLE_GEMFILE=./gemfiles/40.gemfile
    bundle install
    rake spec