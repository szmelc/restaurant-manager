class AdminPage < SitePrism::Page
  set_url '/admin'
  element :employees_div, "div[class='user-list']"
  element :income_div, "div[id='income']"
  element :orders_div, "div[id='orders-chart']"
  section :menu, MenuSection, '#navbar'
  section :actions, AdminActions, '#actions'
end
