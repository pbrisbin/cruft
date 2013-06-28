module Cruft
  class GemListParser
    attr_reader :specs

    def initialize(contents)
      @specs = parse_specs(contents)
    end

    private

    def parse_specs(contents)
      contents.lines do |line|
        md = line.match(/^(?<name>.*) \((?<versions>.*)\)$/) or return

        md[:versions].split(', ').each do |version|
          @specs << Spec.new(md[:name], version)
        end
      end
    end
  end
end
