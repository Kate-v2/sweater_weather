require 'rails_helper'

RSpec.describe Favorite, type: :model do

  let(:user) { create(:user) }

  describe 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :location }
    it { should validate_uniqueness_of(:location).scoped_to(:user) }
    it { should validate_uniqueness_of(:location).scoped_to(user) }
  end

end
