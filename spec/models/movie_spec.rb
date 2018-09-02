require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:horror) { FactoryBot.build(:category) }

  subject {
    described_class.new(
      title: "Get Out",
      text: "Now that Chris and his girlfriend, Rose, have reached the meet-the-parents milestone of dating, she invites him for a weekend getaway upstate with Missy and Dean...",
      rating: 5,
      category: horror
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a text" do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a rating" do
    subject.rating = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a category" do
    subject.category = nil
    expect(subject).to_not be_valid
  end
end
