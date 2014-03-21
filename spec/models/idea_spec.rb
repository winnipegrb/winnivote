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

  describe "#project_name" do

    context "with a project" do
      subject { FactoryGirl.build :idea, :with_project }
      it "returns the project name" do
        expect(subject.project_name).to eq subject.project.name
      end
    end

    context "without a project" do
      it "returns a default project name" do
        expect(subject.project_name).to eq ""
      end
    end
  end
end
