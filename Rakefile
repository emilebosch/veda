 require 'rake/testtask'

Rake::TestTask.new do |t|
	t.libs << "lib/veda.rb"
	t.test_files = FileList['test/*_test.rb']
	t.verbose = true
end

task :link do
  `cd test/test-repo && ln -s .git-data .git`
end

task :unlink do
  `rm -f ./test/test-repo/.git`
end

task :default => :test