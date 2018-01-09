class Posts < SitePrism::Section
  element :post_input, "textarea[id='post-content']"
  element :post_button, "input[type='submit']"
end
