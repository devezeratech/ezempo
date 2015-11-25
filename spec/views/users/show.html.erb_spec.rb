require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view, logged_in: :user do
  before do
    assign(:user, user)
    assign(:statuses, Array.new(2, FactoryGirl.create(:status, user: user)))
  end
  it 'renders the name of the user' do
    render
    expect(rendered).to have_css(".name", text: user.name )  
  end
  it 'renders the text field for status update' do 
    render
    expect(rendered).to have_css(".text_status")
  end

end
