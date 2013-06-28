module Cruft
  class GemListParser
    attr_reader :specs

    def initialize(contents)
      @specs = parse_specs(contents)
    end

    private

    def parse_specs(contents)
      contents.lines.map do |line|
        md = line.match(/^(?<name>.*) \((?<versions>.*)\)$/)
        md[:versions].split(', ').map { |version| Spec.new(md[:name], version) }
      end.flatten
    end
  end
end
