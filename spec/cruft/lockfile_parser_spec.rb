require 'spec_helper'

module Cruft
  describe LockfileParser do
    it "parses a lockfile for specs" do
      parser = LockfileParser.new(example_lockfile)

      specs = parser.specs

      expect(specs).to match_array([
        Spec.new('simple_form', '3.0.0.rc'),
        Spec.new('actionpack', '4.0.0.rc1'),
        Spec.new('activemodel', '4.0.0.rc1'),
        Spec.new('activesupport', '4.0.0.rc1'),
        Spec.new('atomic', '1.1.8'),
        Spec.new('builder', '3.1.4'),
        Spec.new('country_select', '1.1.3'),
        Spec.new('erubis', '2.7.0'),
        Spec.new('i18n', '0.6.4'),
        Spec.new('json', '1.7.7'),
        Spec.new('minitest', '4.7.4'),
        Spec.new('multi_json', '1.7.2'),
        Spec.new('rack', '1.5.2'),
        Spec.new('rack-test', '0.6.2'),
        Spec.new('railties', '4.0.0.rc1'),
        Spec.new('rake', '10.0.4'),
        Spec.new('rdoc', '4.0.1'),
        Spec.new('thor', '0.18.1'),
        Spec.new('thread_safe', '0.1.0'),
        Spec.new('tzinfo', '0.3.37'),
      ])
    end

    def example_lockfile
      <<-EOLOCKFILE
PATH
  remote: .
  specs:
    simple_form (3.0.0.rc)
      actionpack (>= 4.0.0.rc1, < 4.1)
      activemodel (>= 4.0.0.rc1, < 4.1)

GEM
  remote: https://rubygems.org/
  specs:
    actionpack (4.0.0.rc1)
      activesupport (= 4.0.0.rc1)
      builder (~> 3.1.0)
      erubis (~> 2.7.0)
      rack (~> 1.5.2)
      rack-test (~> 0.6.2)
    activemodel (4.0.0.rc1)
      activesupport (= 4.0.0.rc1)
      builder (~> 3.1.0)
    activesupport (4.0.0.rc1)
      i18n (~> 0.6, >= 0.6.4)
      minitest (~> 4.2)
      multi_json (~> 1.3)
      thread_safe (~> 0.1)
      tzinfo (~> 0.3.37)
    atomic (1.1.8)
    builder (3.1.4)
    country_select (1.1.3)
    erubis (2.7.0)
    i18n (0.6.4)
    json (1.7.7)
    minitest (4.7.4)
    multi_json (1.7.2)
    rack (1.5.2)
    rack-test (0.6.2)
      rack (>= 1.0)
    railties (4.0.0.rc1)
      actionpack (= 4.0.0.rc1)
      activesupport (= 4.0.0.rc1)
      rake (>= 0.8.7)
      thor (>= 0.18.1, < 2.0)
    rake (10.0.4)
    rdoc (4.0.1)
      json (~> 1.4)
    thor (0.18.1)
    thread_safe (0.1.0)
      atomic
    tzinfo (0.3.37)

PLATFORMS
  ruby

DEPENDENCIES
  actionpack (>= 4.0.0.rc1, < 4.1)
  activemodel (>= 4.0.0.rc1, < 4.1)
  country_select (~> 1.1.1)
  railties (>= 4.0.0.rc1, < 4.1)
  rake
  rdoc
  simple_form!
  tzinfo
      EOLOCKFILE
    end

  end
end
