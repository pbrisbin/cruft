require 'cruft/gem_list_parser'
require 'cruft/lockfile_parser'

module Cruft
  Spec = Struct.new(:name, :version) do
    def uninstall_cmd
      "gem uninstall #{name} --version #{version}"
    end
  end

  class Main
    class << self
      def run(gem_list, lockfiles)
        print_usage! if lockfiles.empty?

        specs = parsed(gem_list)

        lockfiles.each { |lockfile| specs -= required_by(lockfile) }

        specs.each { |spec| puts spec.uninstall_cmd }
      end

      private

      def print_usage!
        puts 'usage: cruft <lockfile> [, <lockfile>, ...]'
        exit 1
      end

      def parsed(gem_list)
        GemListParser.new(gem_list).specs
      end

      def required_by(lockfile)
        contents = File.read(lockfile)

        LockfileParser.new(contents).specs
      end
    end
  end
end
