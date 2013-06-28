require 'set'

module Cruft
  class Manifest
    def add(spec)
      gems[spec.name] << spec.version
    end

    def each
      gems.each do |name, versions|
        versions.each do |version|
          yield(name, version)
        end
      end
    end

    def include?(name, version)
      gems[name].include?(version)
    end

    private

    def gems
      @gems ||= Hash.new { |h,k| h[k] = Set.new }
    end
  end
end
