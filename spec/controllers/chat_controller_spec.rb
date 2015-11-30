require 'rails_helper'

RSpec.describe ChatController, type: :controller do
  let(:user) { FactoryGirl.build(:user, id: 9999) }
  let(:chat) { FactoryGirl.create(:chat, user: user) }

  describe "GET #chat", js: true do
    it 'assigns message to @user' do
      allow(Chat).to receive(:create).and_return(chat)
      expect(Chat.all.last).to eq(chat)
    end

  end

end
