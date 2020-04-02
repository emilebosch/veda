module Veda
  class Cli < Thor
    default_task :start

    desc "start", "Start the veda webserver"

    def start
      start_server
    end

    desc "install [REPO]", "Install and view documentation from github, i.e. `veda install emilebosch/guides`"

    def install(repo)
      path = library_path(repo)
      unless File.exist? path
        `mkdir -p #{path}`
        `git clone git@github.com:#{repo}.git #{path}`
      end
      Dir.chdir(path)
      start_server
    end

    desc "list", "List locally installed vedas"

    def list
      puts "Installed vedas in #{library_path}"
      for path in Dir.glob "#{library_path}*/*"
        base, name = path.split(library_path)
        puts "- #{name}"
      end
    end

    desc "version", "Shows version information"

    def version
      puts Veda::VERSION
    end

    desc "update [REPO]", "Update a locally installed veda"

    def update(repo)
      puts `cd #{library_path(repo)} && git pull`
    end

    desc "library", "Run in veda library mode"

    def library
      start_library
    end

    desc "powify [NAME]", "Installs veda under Pow (defaults to veda.dev)"

    def powify(domain = "veda", force = false)
      abort("Hmm.. pow doesn't seem to be installed. Can't find the directory #{pow_dir}") unless File.exists? pow_dir

      dir = File.join(pow_dir, domain)
      abort("Link already exists #{dir} -> #{File.readlink(dir)}, use -force=true to relink!") if File.exists? dir unless force

      FileUtils.rm_f(dir) if force
      FileUtils.ln_s(gem_dir, dir)
    end

    private

    def gem_dir
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end

    def pow_dir
      File.join(Dir.home, ".pow")
    end

    def start_library
      Veda::Library.run!
    end

    def start_server
      Veda::Server.run!
    end

    def library_path(guide = nil)
      path = "#{Dir.home}/.veda/library/#{guide}"
    end
  end
end
