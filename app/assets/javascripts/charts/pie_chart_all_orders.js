// CHART
$(document).ready(function() {

  // Download .json for all orders  
  $.getJSON(window.location + '.json', function(json) {
    var ordersCount = json.orders.length // number of all orders
    var mealsOverall = 0; // how many meals overall were sold
    var meals = []; // list of meals for chart labels
    var mealsCount = []; // list of meals to count number of certain meals
    var i = 0;
    var colors = [
          "#2ecc71",
          "#3498db",
          "#95a5a6",
          "#9521a6",
          "#173da2",
          "#162810",
          "#f25981"
          ]
    function defineLabels() {
      for(order of json.orders) {
        for (meal of order.meals) {
        // Loop for defining the number and names of meals labels
          if(meals.includes(meal.meal) == false) {
            meals.push(meal.meal)
          }
        };}};


    defineLabels();

    // Define colors of datasets
    function defineColors() {
      let colorsNumber = meals.length;
      var chartColors = [];
      for (let i = 0; i < colorsNumber; i++) {
        chartColors.push(colors[i]);
      }
      return chartColors}


    //Loop through all orders    
    

    // console.log(mealsOverall);


    for(order of json.orders) {
      for(meal of order.meals) {

      }
    }

    // console.log(mealsCount);








    var ctp = document.getElementById("pieChart");
    var myChart = new Chart(ctp, {
      type: 'doughnut',
      data: {
        labels: meals,
        datasets: [{
          backgroundColor: defineColors(),
          data: [12, 19, 3, 8]
        }]
      }
    });
  });







});
  // CHART END




