# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :header }
    it { is_expected.to have_db_column :subheader }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :status }
    it { is_expected.to have_db_column :comment }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :header }
    it { is_expected.to validate_presence_of :subheader }
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_presence_of :status }
  end

  describe 'Statuses' do 
    it { is_expected.to respond_to :pending! }
    it { is_expected.to respond_to :pending? }
    it { is_expected.to respond_to :approved! }
    it { is_expected.to respond_to :approved? }
    it { is_expected.to respond_to :rejected! }
    it { is_expected.to respond_to :rejected? }
    it { is_expected.to respond_to :commented! }
    it { is_expected.to respond_to :commented? }
  end

  describe 'Class methods' do
    it { expect(described_class).to respond_to :pending }
    it { expect(described_class).to respond_to :approved }
    it { expect(described_class).to respond_to :rejected }
    it { expect(described_class).to respond_to :commented }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :category }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:article)).to be_valid
    end
  end
end
