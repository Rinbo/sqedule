require 'rails_helper'

RSpec.describe Staff, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :primary_role }
    it { is_expected.to have_db_column :shift_preference }
    it { is_expected.to have_db_column :workrate }
    it { is_expected.to have_db_column :employment_start }
    it { is_expected.to have_db_column :employment_end }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :roles }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :user_id } 
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:staff)).to be_valid
    end
  end
end
