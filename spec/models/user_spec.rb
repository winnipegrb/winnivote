require 'spec_helper'

describe User do

  subject { FactoryGirl.build :user }
  
  context 'validations' do
    it { should validate_presence_of :email }
  end

end