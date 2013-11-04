require 'spec_helper'

describe Idea do
  
  subject { FactoryGirl.build :idea }
  
  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end
  
end