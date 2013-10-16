require 'veda/version'
require 'veda/server'
require 'veda/cli'
require 'veda/documentation'
require 'veda/scm'

eval(File.read "Vedafile") if File.exists? "Vedafile"