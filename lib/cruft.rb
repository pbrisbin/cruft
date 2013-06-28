require 'cruft/gem_list_parser'
require 'cruft/lockfile_parser'
require 'cruft/manifest'

module Cruft
  Spec = Struct.new(:name, :version)

  class Main
    def self.run(lockfiles)
      print_usage! if lockfiles.empty?

      installed = Manifest.new

      parser = GemListParser.new(`gem list`)
      parser.specs.each { |spec| installed.add(spec) }

      required = Manifest.new

      lockfiles.each do |lockfile|
        parser = LockfileParser.new(File.read(lockfile))
        parser.specs.each { |spec| required.add(spec) }
      end

      installed.each do |name, version|
        unless required.include?(name, version)
          puts "gem uninstall #{name} --version #{version}"
        end
      end
    end

    def self.print_usage!
      puts 'usage: cruft <lockfile> [, <lockfile>, ...]'
      exit 1
    end
  end
end
