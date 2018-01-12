class AdminPage < SitePrism::Page
  set_url '/admin'
  section :menu, MenuSection, '#navbar'
  section :actions, AdminActions, '#actions'
  section :employees, Employees, '.user-list'
  section :income_section, Income, '#income'
  section :dishes_chart_section, DishesCharts, '#meals-info'
  section :orders_section, OrdersSection, '#orders-chart'
  section :footer, Footer, '#footer'
end
