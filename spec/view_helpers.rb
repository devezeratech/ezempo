module ViewHelpers
  def set_current_user!(kind)
    let(:user) { FactoryGirl.create(kind) }
    before do
      allow(view).to receive(:current_user).and_return(user)
    end
  end
end