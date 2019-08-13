require 'rails_helper'

RSpec.describe Merchant do
  describe 'Relationships' do
    xit {should have_many :items}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
  end
end	
