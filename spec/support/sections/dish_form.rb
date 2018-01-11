class DishForm < SitePrism::Section
  element :dish_name_label, "label[for='dish_name']"
  element :dish_name_input, "input[class='dish_name']"
  element :dish_price_label, "label[for='dish_price']"
  element :dish_price_input, "input[class='dish_price']"
  element :dish_description_label, "label[for='dish_description']"
  element :dish_description_input, "input[class='dish_description']"
  element :dish_category_label, "label[for='dish_category']"
  element :dish_category_select, "select[class='dish_category']"
end
