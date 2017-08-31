// CHART
$(document).ready(function() {

  // Download .json for all orders  
  $.getJSON(window.location + '.json', function(json) {
    let ordersCount = json.orders.length // number of all orders
    let mealsOverall = 0; // how many meals overall were sold
    let meals = []; // list of meals for chart labels
    let mealsCount = []; // list of meals to count number of certain meals
    let i = 0;
    let colors = [
          "#2ecc71",
          "#3498db",
          "#95a5a6",
          "#9521a6",
          "#173da2",
          "#162810",
          "#f25981"
          ] // define appropriate colors
    
    function defineLabels() {
      for(order of json.orders) {
        for (meal of order.meals) {
        // Loop for defining the number and names of meals labels
          if(meals.includes(meal.meal) == false) {
            meals.push(meal.meal)
          }
        };
      }
      console.log(meals.sort())
    };
    defineLabels();

    // Define colors of datasets
    function defineColors() {
      let colorsNumber = meals.length;
      let chartColors = [];
      for (let i = 0; i < colorsNumber; i++) {
        chartColors.push(colors[i]);
      }
      return chartColors
    }

    function defineAmountOfSoldMeals() {
      const data = [];
      let counterArr = [];
      let quantArr = [];
      let dataArray = []
      function compare(a, b) {
        const firstItem = a.meal;
        const secondItem = b.meal;
        if(firstItem < secondItem) {
          return -1;
          } else if (firstItem > secondItem) {
            return 1;
          } else {
            return 0;
          }
        }
        
      for(order of json.orders) {
        for (meal of order.meals) {
          data.push(meal)
        }
      }

      data.sort(compare);

      console.log(data);
      
      for(let i = 0; i < meals.length; i++) {
        let counter = 0;
        for(let j = 0; j < data.length; j++) {
          if(data[j].meal == meals[i]) {
            counter++;
          }          
        }
        counterArr.push(counter)
        
      }
      console.log(counterArr)
      for(let i = 0; i < counterArr.length; i++) { 
        for(let j = 0; j < counterArr[i]; j++) {
          quantArr.push(data[0]);
          data.shift()
        }

        console.log(quantArr);
        if (quantArr.length > 1) {
          let quantity = quantArr.reduce(function(a, b) {
            return a.quantity + b.quantity
          });
          dataArray.push(quantity)  
          quantArr = [];
        } else {
          dataArray.push(quantArr[0].quantity);
          quantArr = [];
        }                      
      }

      console.log(dataArray)
      console.log(typeof dataArray[1]);
      return dataArray
    }



    



    let ctp = document.getElementById("pieChart");
    let myChart = new Chart(ctp, {
      type: 'doughnut',
      data: {
        labels: meals,
        datasets: [{
          backgroundColor: defineColors(),
          data: defineAmountOfSoldMeals()
        }]
      }
    });
  });







});
  // CHART END




