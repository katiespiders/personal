require 'rails_helper'

RSpec.describe Post, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:post)).to be_valid
  end

  it 'must have a title' do
    expect(FactoryGirl.build(:post, title: nil)).not_to be_valid
  end

  it 'must have content' do
    expect(FactoryGirl.build(:post, content: nil)).not_to be_valid
  end
end
