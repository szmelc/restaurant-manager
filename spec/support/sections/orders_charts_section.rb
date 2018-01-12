class OrdersCharts < SitePrism::Section
  element :all_orders, "canvas[id='barChartAllOrders']"
  element :all_employees, "canvas[id='barChartAllEmployees']"
  element :daily_comparison, "canvas[id='barChartAllEmployeesDailyComparison']"
end
