require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user, id: 9999)}

  # it 'valid with valid attributes' do 
  #   is_expected.to be_valid
  # end

  it 'invalid without a name' do
    subject.name = nil
    is_expected.to be_invalid
  end

end
