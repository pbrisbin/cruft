require 'bundler'

module Cruft
  class LockfileParser
    attr_reader :specs

    def initialize(contents)
      @specs = Dir.chdir('/tmp') { parse_specs(contents) }
    end

    private

    def parse_specs(contents)
      File.open('Gemfile', 'w') { |fh| fh.write("silly bundler") }

      parser = Bundler::LockfileParser.new(contents)
      parser.specs.map { |spec| Spec.new(spec.name, spec.version.to_s) }

    ensure
      File.delete('Gemfile') if File.exists?('Gemfile')
    end
  end
end
