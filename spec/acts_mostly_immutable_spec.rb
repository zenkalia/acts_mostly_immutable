require 'spec_helper'
require 'acts_mostly_immutable'
require 'support/active_record'

describe 'ActsMostlyImmutable' do
  before do
    class Whatever < ActiveRecord::Base
      include ActsMostlyImmutable
    end
  end
  it 'can be mixed in?' do
    Whatever.new.party.should == 'time'
  end
end
