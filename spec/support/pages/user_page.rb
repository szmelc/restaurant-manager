class UserPage < SitePrism::Page
  set_url '/users/{id}'
  section :menu, MenuSection, '#navbar'
  section :user_info, UserInfo, '.user'
  section :user_colleagues, Employees, '.user-list'
  section :orders_chart, OrdersCharts, '#orders-chart'
  section :footer, Footer, '#footer'
end
