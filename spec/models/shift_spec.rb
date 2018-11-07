require 'rails_helper'

RSpec.describe Shift, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :date }
    it { is_expected.to have_db_column :cleaning }
    it { is_expected.to have_db_column :staff_req }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :pattern_id }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :pattern_id }    
  end
end
