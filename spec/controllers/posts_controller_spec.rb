require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe 'GET #index' do
    it 'populates an array of posts' do
      Post.delete_all
      posts_array = Array.new(3).collect { FactoryGirl.create(:post) }
      get :index
      expect(assigns(:posts)).to match_array(posts_array)
    end

    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      xit 'creates a new post' do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by 1
      end

      it 'redirects to posts index' do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to posts_path
      end
    end

    context 'with invalid attributes' do
      it 'does not create a post' do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post, :invalid)
        }.not_to change(Post, :count)
      end

      xit 're-renders the new post page' do
        post :create, post: FactoryGirl.attributes_for(:post, :invalid)
        expect(response).not_to redirect_to posts_path
        #expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    # post object is set for form
    # why is render_template test failing?
  end

  describe 'POST #update' do
    # makes specified changes to post
    # redirects to show page
  end

  describe 'DELETE #destroy' do
    # decrements post count by 1
    # redirects to post index
  end
end
