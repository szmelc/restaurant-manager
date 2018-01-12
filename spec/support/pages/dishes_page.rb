class Dishes < SitePrism::Page
  set_url '/dishes'
  element :add_dish, "a[id='add-dish']"
  section :dish_form, DishForm, '#dish-form'
end
