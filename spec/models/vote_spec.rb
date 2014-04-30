require 'spec_helper'

describe Vote do
  
  context 'validations' do
    it { should validate_uniqueness_of :user }
  end
end
