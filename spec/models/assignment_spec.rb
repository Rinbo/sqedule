require 'rails_helper'

RSpec.describe Assignment, type: :model do

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :date }
    it { is_expected.to have_db_column :off }
    it { is_expected.to have_db_column :locked_shift_id }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :staff_id }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :staff_id }    
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:assignment)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to :staff }
  end
end
