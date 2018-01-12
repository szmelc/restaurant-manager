class AddOrder < SitePrism::Page
  set_url '/orders/new'
  section :add_dish_form, AddDishForm, '.meals'
end
