require 'spec_helper'
require 'acts_mostly_immutable'
require 'support/active_record'

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
    before do
      class Whatever < ActiveRecord::Base
        include ActsMostlyImmutable
      end
    end
    it 'can be mixed in?' do
      Whatever.new.party.should == 'time'
    end
  end
end
