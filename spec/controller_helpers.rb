module ControllerHelpers
  def sign_in!(kind, *options)
    let(:user) { kind == :anonymous ? User.new : FactoryGirl.create(kind) }
    before do
      allow_message_expectations_on_nil
      allow(controller).to receive(:current_user).and_return(user)
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    end
  end
end
