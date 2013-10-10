require 'simplecov'

SimpleCov.start
require 'minitest/autorun'
require 'veda'

`cd test/test-repo && ln -s .git-data .git` unless File.exist? "test/test-repo/.git"