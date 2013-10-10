 require 'rake/testtask'

Rake::TestTask.new do |t|
	t.libs << "lib/veda.rb"
	t.test_files = FileList['test/*_test.rb']
	t.verbose = true
end

task :enable_test_repo do
  `cd test/test-repo && ln -s .git-data .git` unless File.exist? "test/test-repo/.git"
end

task :disable_test_repo do
  `rm -f ./test/test-repo/.git`
end

task :default => :test