require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  let(:user) {
    User.create(
      name: Faker::Internet.user_name,
      password: Faker::Internet.password
      )
    }
  describe 'signin' do
    it 'saves session id on successful signin' do
    end

  end

end
