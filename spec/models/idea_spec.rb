require 'spec_helper'

describe Idea do
  
  subject { FactoryGirl.build :idea }
  
  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  describe '#initialize' do
    it "starts at zero votes" do
      idea = described_class.new

      expect(idea.votes).to be_zero
    end
  end

  describe '#upvote!' do
    subject { FactoryGirl.create :idea, votes: 42 }

    it "increase the number of votes" do
      subject.upvote!

      expect(subject.votes).to eq 43
    end
  end
end
