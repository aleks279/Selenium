# require 'rails_helper'

describe Article do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(5) }
  end

  describe 'associations' do

  end
end