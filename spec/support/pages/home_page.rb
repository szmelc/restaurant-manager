class Home < SitePrism::Page
  set_url '/'
  section :menu, MenuSection, '#navbar'
  section :pinned_posts, PinnedPosts, '#pinned-post'
  section :post_form, Posts, '#regular-post-form'
  section :footer, Footer, '#footer'
end
