class AdminPage < SitePrism::Page
  set_url '/admin'
  section :menu, MenuSection, '#navbar'
  section :actions, AdminActions, '#actions'
  section :footer, Footer, '#footer'
  element :employees_div, "div[class='user-list']"
  element :income_div, "div[id='income']"
  element :orders_div, "div[id='orders-chart']"
end
