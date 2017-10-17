// CHART
$(".orders index").ready(function() {
  if($('body').hasClass('orders index')) {
    // Download .json for all orders  
    $.getJSON(window.location + '.json', function(json) {
      
      let today = new Date();

      function defineColor() {
        let letters = '0123456789ABCDEF'
        let color = '#'
        for(let i = 0; i < 6; i++) {
          color += letters[Math.floor(Math.random()*16)]
        }
        return color;
      } // generates random color with hex values

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

      function returnDate(jsonDate) {
        let date = new Date(jsonDate)
        let day = date.getDate();
        let month = date.getMonth();
        let year = date.getFullYear();
        return `${day}.${month}.${year}`;
      }      
      
      function defineLabels(condition) {
        let mealsAll = []; // list of meals for chart labels
        for(order of json.orders) {
          for(meal of order.meals) {
            if(condition == 'all') {
              if(mealsAll.includes(meal.meal) == false) {
                mealsAll.push(meal.meal)
              }
            } else if(condition == 'today') {
              if(returnDate(order.date) == returnDate(today) 
                 && mealsAll.includes(meal.meal) == false) {
               mealsAll.push(meal.meal)
             }
            }
          }
        }
       
       return mealsAll.sort()
      } // returns array with names of sold meals
      
      

      function returnColorsArray(array) {
        let colors = []
        for(let i = 0; i < array.length; i++) {
          colors.push(defineColor())               
        } 
        return colors       
      } // returns array of colors based on defineLabels().length
            

      function defineAmountOfAllSoldMeals() {
        let data = [];
        let counterArr = [];
        let quantArr = [];
        let dataArray = []

          
        for(order of json.orders) {
          for (meal of order.meals) {
            data.push(meal)
          }
        } // returns all orders
        
        data.sort(compare); // sorts all orders in alphabetical order


        
        for(let i = 0; i < defineLabels('all').length; i++) {
          let counter = 0;
          // compares how many instances of a meal there's in all orders
          for(let j = 0; j < data.length; j++) {
            if(data[j].meal == defineLabels('all')[i]) {
              counter++;
            }          
          }
          counterArr.push(counter) // returns array with quantites of certain meals   
        }
        
        for(let i = 0; i < counterArr.length; i++) { 
          for(let j = 0; j < counterArr[i]; j++) {
            quantArr.push(data[0]);
            data.shift()
          }
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
        return dataArray
      }


      function howManyMealsSoldToday() {
        let counterArr = [];
        let quantArr = []; // array with sum of meals' quantites
        let meals = [];
        let data = []; // final data

        for(order of json.orders) {
          if(returnDate(order.date) == returnDate(today))  {
            for (meal of order.meals) {
              meals.push(meal);
            };
          };
        };
        
        meals.sort(compare) // returns alphabetically sorted array of all meals ordered today

        for(let i = 0; i < defineLabels('today').length; i++) {
          let counter = 0;
          for(let j = 0; j < meals.length; j++) {
            if(meals[j].meal == defineLabels('today')[i]) {
              counter++
            }           
          }
          counterArr.push(counter) // returns occurences of certain meal in orders
        }

        for(let i = 0; i < counterArr.length; i++) {
          for(let j = 0; j < counterArr[i]; j++) {
            quantArr.push(meals[0]);
            meals.shift();
          }
                    
          if(quantArr.length > 1) {           
            var quantity = quantArr.reduce(function(a, b) {
              return a.quantity + b.quantity;
            })
            data.push(quantity);
            quantArr = [];          
          } else {
            var quantity = quantArr[0].quantity
            data.push(quantity);
            quantArr= [];
          }

        }

        return data;
      }      
      howManyMealsSoldToday()

      let ctp = document.getElementById("pie-chart-all");
      let myChartAllOrders = new Chart(ctp, {
        type: 'doughnut',        
        data: {
          labels: defineLabels('all'),
          datasets: [{
            backgroundColor: returnColorsArray(defineLabels('all')),
            data: defineAmountOfAllSoldMeals()
          }]
        },
        options: {
          maintainAspectRatio: false,
          responsive: true
        }
      });

      let ctt = document.getElementById("pie-chart-today");
      let myChart = new Chart(ctt, {
        type: 'doughnut',        
        data: {
          labels: defineLabels('today'),
          datasets: [{
            backgroundColor: returnColorsArray(defineLabels('today')),
            data: howManyMealsSoldToday()
          }]
        },
        options: {
          maintainAspectRatio: false,
          responsive: true
        }
      });




    });
  }
});





