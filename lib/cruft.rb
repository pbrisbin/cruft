require 'cruft/gem_list_parser'
require 'cruft/lockfile_parser'

module Cruft
  Spec = Struct.new(:name, :version)

  class Main
    def self.run(lockfiles)
      print_usage! if lockfiles.empty?

      installed = GemListParser.new(gem_list).specs
      required = []

      lockfiles.map do |lockfile|
        required += LockfileParser.new(File.read(lockfile)).specs
      end

      (installed - required).each do |spec|
        puts "gem uninstall #{spec.name} --version #{spec.version}"
      end
    end

    def self.print_usage!
      puts 'usage: cruft <lockfile> [, <lockfile>, ...]'
      exit 1
    end

    def self.gem_list
      `gem list`
    end
  end
end
