class AddDishForm < SitePrism::Section
  element :select_dish, "select[name='order[meals_attributes][0][name]']"
  element :select_quantity, "select[name='order[meals_attributes][0][quantity]']"
  element :price_field, "div[id='pricediv']"
  element :remove_dish, "a[class='remove_fields']"
end
