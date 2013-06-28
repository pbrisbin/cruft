require 'spec_helper'

module Cruft
  describe GemListParser do
    it "parses `gem list` for specs" do
      parser = GemListParser.new(example_gem_list)

      specs = parser.specs

      expect(specs).to match_array([
        Spec.new('actionmailer', '3.2.13'),
        Spec.new('actionmailer', '3.2.9'),
        Spec.new('flutie', '2.0.0'),
        Spec.new('font-awesome-rails', '3.2.1.0'),
        Spec.new('font-awesome-sass-rails', '3.0.2.2'),
        Spec.new('safe_yaml', '0.9.3'),
        Spec.new('safe_yaml', '0.9.2'),
        Spec.new('tire', '0.6.0'),
        Spec.new('will_paginate', '3.0.4'),
        Spec.new('xpath', '2.0.0'),
        Spec.new('yajl-ruby', '1.1.0'),
      ])
    end

    def example_gem_list
      <<-EOGEMLIST
actionmailer (3.2.13, 3.2.9)
flutie (2.0.0)
font-awesome-rails (3.2.1.0)
font-awesome-sass-rails (3.0.2.2)
safe_yaml (0.9.3, 0.9.2)
tire (0.6.0)
will_paginate (3.0.4)
xpath (2.0.0)
yajl-ruby (1.1.0)
      EOGEMLIST
    end
  end

end
