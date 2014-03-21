require 'spec_helper'

describe Project do

  context 'validations' do
    it { should validate_presence_of :name }
  end
end
