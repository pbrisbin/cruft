require 'cruft/gem_list_parser'
require 'cruft/lockfile_parser'

module Cruft
  Spec = Struct.new(:name, :version)

  class Main
    def self.run(gem_list, lockfiles)
      specs = GemListParser.new(gem_list).specs

      lockfiles.each do |lockfile|
        specs -= LockfileParser.new(File.read(lockfile)).specs
      end

      specs.each do |spec|
        puts "gem uninstall #{spec.name} --version #{spec.version}"
      end
    end
  end
end
