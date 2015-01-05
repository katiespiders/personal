require 'rails_helper'

RSpec.describe Post, :type => :model do
  let (:post) { FactoryGirl.create(:post) }

  it 'has a valid factory' do
    expect(post).to be_valid
  end

  it 'must have a title' do
    expect(FactoryGirl.build(:post, title: nil)).not_to be_valid
  end

  it 'must have content' do
    expect(FactoryGirl.build(:post, content: nil)).not_to be_valid
  end

  context 'Published post' do
    let (:published_post) { FactoryGirl.create(:post, :published) }

    it 'has published status and published_at timestamp' do
      expect(published_post.published?).to eq true
      expect(published_post.published_at).not_to eq nil
    end

    it 'uses published_at, not ActiveRecord timestamps, as timestamp' do
      ts = published_post.timestamp

      expect(ts).to eq published_post.published_at
      expect(ts).not_to eq published_post.updated_at
      expect(ts).not_to eq published_post.created_at
    end
  end

  context 'Draft post' do
    let (:draft) { FactoryGirl.create(:post) }

    it 'is created with unpublished status' do
      expect(post.published?).to eq false
      expect(post.published_at).to eq nil
    end

    it 'uses ActiveRecord updated_at timestamp, not published_at, as timestamp' do
      ts = draft.timestamp

      expect(ts).to eq draft.updated_at
      expect(ts).not_to eq draft.published_at
    end
  end

  describe 'Class methods' do
    posts = [
      FactoryGirl.create(:post, :published, published_at: 1.day.ago, created_at: 4.days.ago, updated_at: 2.days.ago),
      FactoryGirl.create(:post, created_at: 6.days.ago, updated_at: 2.days.ago),
      FactoryGirl.create(:post, :published, published_at: 3.days.ago),
      FactoryGirl.create(:post, :published, published_at: 4.days.ago),
      FactoryGirl.create(:post, created_at: 5.days.ago, updated_at: 5.days.ago)
    ]

    let(:desc_posts) { posts }

    it 'sorts unpublished (by updated_at) with published (published_at)' do
      allow(Post).to receive(:all).and_return( desc_posts.shuffle)

      expect(Post.sort_desc).to eq desc_posts
      expect(Post.sort_asc).to eq desc_posts.reverse
    end

  end
end
