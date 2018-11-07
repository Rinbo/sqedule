require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :period }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :period }
    it { is_expected.to validate_presence_of :user_id }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:schedule)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many :patterns }
  end

end
