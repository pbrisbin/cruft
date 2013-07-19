require 'spec_helper'

module Cruft
  describe Main do
    before { $stdout = StringIO.new }
    after  { $stdout = STDOUT }

    it "prints gem uninstall commands for crufty gems" do
      expect_new(GemListParser, 'gem list output') do |instance|
        instance.stub(:specs).and_return([
          Spec.new('foo', '1.0'),
          Spec.new('foo', '1.5'),
          Spec.new('bar', '1.0'),
          Spec.new('bar', '1.5')
        ])
      end
      File.should_receive(:read).with('lockfile1').and_return('contents1')
      File.should_receive(:read).with('lockfile2').and_return('contents2')
      expect_new(LockfileParser, 'contents1') do |instance|
        instance.stub(:specs).and_return([Spec.new('foo', '1.5')])
      end
      expect_new(LockfileParser, 'contents2') do |instance|
        instance.stub(:specs).and_return([Spec.new('bar', '1.0')])
      end

      Main.run 'gem list output', %w( lockfile1 lockfile2 )

      expect($stdout.string).to eq [
        'gem uninstall foo --version 1.0',
        'gem uninstall bar --version 1.5',
        ''
       ].join("\n")
    end

    def expect_new(klass, *args)
      double(klass.name).tap do |instance|
        klass.should_receive(:new).with(*args).and_return(instance)
        yield(instance) if block_given?
      end
    end
  end
end
