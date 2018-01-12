class MenuSection < SitePrism::Section
  element :left_nav, "div[class='nav-left']"
  element :admin_button, "div[id='home_admin-navbutton']"
  element :avatar, "img[id='avatar-thumb']"
  element :search, "input[id='search']"
  element :login_menu, "div[class='login-buttons']"
  element :login_link, "a[href='/my/users/sign_in']"
  element :signup_link, "a[href='/my/users/sign_up']"
end
