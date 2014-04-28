require 'spec_helper'
require 'acts_mostly_immutable'
require 'support/active_record'


shared_context 'whatever_class' do
  before do
    class Whatever < ActiveRecord::Base
      include ActsMostlyImmutable
    end
  end
  after do
    Object.send(:remove_const, :Whatever)
  end
end

describe 'ActsMostlyImmutable' do
  describe 'functions have a configurable prefix' do
    before do
      class Whatever < ActiveRecord::Base
        include ActsMostlyImmutable
        ami_prefix 'ami_'
      end
    end
    after do
      Object.send(:remove_const, :Whatever)
    end
    it 'can be mixed in?' do
      Whatever.new.ami_party.should == 'time'
      expect{Whatever.new.party}.to raise_error(NoMethodError)
    end
  end
  describe 'instance methods' do
    include_context 'whatever_class'
    it 'can be mixed in?' do
      Whatever.new.party.should == 'time'
    end
  end

  describe 'the immutability stuff' do
    include_context 'whatever_class'

    let!(:whatever) { Whatever.create(name: 'smashing pumpkins') }
    it 'does nothing when the model does not change' do
      count = Whatever.count
      whatever.save
      Whatever.count.should == count
    end

    it 'creates a new instance when stuff changes' do
      count = Whatever.count
      whatever.name = 'nirvana'
      new_whatever = whatever.save

      Whatever.count.should == (count + 1)
      new_whatever.name.should == 'nirvana'
      whatever.name.should == 'smashing pumpkins'
    end
  end
end
