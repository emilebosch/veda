 require 'rake/testtask'

Rake::TestTask.new do |t|
	t.libs << "lib/veda.rb"
	t.test_files = FileList['test/*_test.rb']
	t.verbose = true
end

task :zip_repo do
  `cd test && rm test-repo.zip && zip -r test-repo.zip test-repo && rm -rf test-repo`
end

task :unzip_repo do
  `cd test && unzip test-repo.zip && rm test-repo.zip`
end

task :default => :test