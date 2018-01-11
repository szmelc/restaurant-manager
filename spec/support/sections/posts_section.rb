class Posts < SitePrism::Section
  element :post_input, "textarea[id='post-content']"
  element :post_button, "input[type='submit']"
  element :comment_link, "a[class='comment-link']"
  element :post, "div[class='post']"
end
