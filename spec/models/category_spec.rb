require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new(name: 'Comedy') }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
