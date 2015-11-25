require 'rails_helper'

RSpec.describe Status, type: :model do
  subject { FactoryGirl.build(:status)}

  it "valid with valid attributes" do
    is_expected.to be_valid
  end

  it "is invalid without a text status" do
    subject.text_status = nil
    is_expected.to be_invalid
  end

end
