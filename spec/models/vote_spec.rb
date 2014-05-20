require 'spec_helper'

describe Vote do
  
  context 'validations' do
    it { should validate_presence_of   :idea_id }
    it { should validate_presence_of   :user_id }
    it { should validate_uniqueness_of :user_id }
  end
end
