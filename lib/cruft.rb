require 'cruft/gem_list_parser'
require 'cruft/lockfile_parser'
require 'cruft/manifest'

module Cruft
  Spec = Struct.new(:name, :version)

  class Main
    def self.run(lockfiles)
      if lockfiles.empty?
        $stderr.puts 'usage: cruft <lockfile> [, <lockfile>, ...]'
        exit 1
      end

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
          puts "--> #{name} #{version} not required by any projects"
        end
      end
    end
  end
end
