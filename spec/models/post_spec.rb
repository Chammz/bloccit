require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:name) { RandomData.random_sentence}
  let(:description) { RandomData.random_paragraph }
  let(:title) { true }
  let(:body) { Topic.create!(name: name, description: description)}

  let(:topic) { Topic.create!(name: name, description: description)}
  let(:post) { topic.posts.create!(title: title, body: body)}

  describe "attributes" do
  it "has title and body attributes" do
    expect(post).to have_attributes(title: title, body: body)
    end
  end
end
