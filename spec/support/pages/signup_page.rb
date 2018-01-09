class SignUpPage < SitePrism:: Page
  set_url '/my/users/sign_up'
  inputs = [
    :user_first_name,
    :user_last_name,
    :user_email,
    :user_city,
    :user_password,
    :user_password_confirmation
  ]
  inputs.each do |attribute|
    element attribute, "input[id=\"#{attribute}\"]"
  end
  element :signup_button, "input[type='submit']"
end
