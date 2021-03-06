require 'rails_helper'

RSpec.describe Topic, type: :model do
 let(:name) { RandomData.random_sentence}
 let(:description) { RandomData.random_paragraph }
 let(:public) { true }
 let(:topic) { Topic.create!(name: name, description: description)}

 it { is_expected.to have_many(:posts)}

 describe "attributes" do
    it "has name, description, & public attributes" do
      expect(tpic).to have_attributes(name: name, description: description)

    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end  
end


