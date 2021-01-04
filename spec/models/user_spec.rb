require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:posts) }

    it 'User should have many friends' do
      should have_many(:followings)
    end

    it 'User can have many comments' do
      should have_many(:followers)
    end
    it 'User can have many likes' do
      should have_many(:relationships)
    end
  end
end
