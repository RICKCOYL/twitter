require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:relationships) }
    it { should have_many(:followings) }
    it { should have_many(:passive_relationships) }
    it { should have_many(:followers) }
    it { should have_many(:posts)
  end
end
