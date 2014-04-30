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

      expect(idea.total_votes).to be_zero
    end
  end

  describe '#upvote' do
    subject { FactoryGirl.create :idea }

    it "increase the number of votes" do
      votes { FactoryGirl.create_list :vote, 42, idea: subject }
      
      subject.upvote

      expect(subject.total_votes).to eq 43
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
