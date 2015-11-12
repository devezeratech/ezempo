module UsersHelper
  def submit_button(user)
    unless user.id.nil?
      link_to 'Cancel', user_path(user), class: 'btn default'
    end
  end
end
