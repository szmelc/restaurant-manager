class UserInfo < SitePrism::Section
  element :name, "div[class='name-info']"
  element :description, "div[class='description']"
  element :avatar, "img[class='avatar']"
  element :contact_details, "div[class='contact-info']"
  element :settings_button, "div[id='settings']"
end
