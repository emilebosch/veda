class Git
	class << self
		def authors(file=nil)
			log(file)
				.sort_by  { | x | x[:date] }
				.reverse
				.group_by { | x| x[:author] }
		end

		def log(file=nil)
			#OHAI! I'm unsafe! Please fix me or feel the wrath. People can execute ;rm -rf as filename.
			log = `git log #{'--follow'} --pretty='format:%h;%aN;%aE;%s;%cD' #{file}`
			log
				.split(/\n/)
			   	.collect { | a| a.split(/;/) }
			   	.collect { | a | { rev: a[0], author: a[1], email: a[2], comment: a[3], date: Time.parse(a[4]) } }
		end
	end
end