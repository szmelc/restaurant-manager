$(".orders index").ready(function() {
  if($('body').hasClass('orders index')) {
  	let labels = [];
	  var colors = [
	    "#2ecc71",
	    "#3498db",
	    "#95a5a6",
	    "#9521a6",
	    "#173da2",
	    "#162810",
	    "#f25981"
	    ]
  	function returnDate(jsonDate) {
  		let date = new Date(jsonDate)
  		let day = date.getDate();
			let month = date.getMonth();
			let year = date.getFullYear();
			return `${day}.${month}.${year}`;
  	}



  	$.getJSON(window.location + '.json', function(json) {
  		let today = new Date()
  		returnDate(today);
  		function defineLabels() {
	  		for(order of json.orders) {
	  			for(meal of order.meals) {
	  				if(returnDate(order.date) == returnDate(today) 
		  					&& labels.includes(meal.meal) == false) {
	  					labels.push(meal.meal)
	  				}
	  			}
	  		}
	  		return labels.sort()
	  	}
	  	function defineColors() {
	  		let colorsArray = [];
	  		let colorsNumber = defineLabels().length
	  		for(let i = 0; i < colorsNumber; i++) {
	  			colorsArray.push(colors[i]);
	  		}
	  		return colorsArray
	  	}

	  	function howManyMealsSoldToday() {
	  		let counterArr = [];
	  		let quantArr = []; // array with sum of meals' quantites
	  		let meals = [];
	  		let data = []; // final data
	  		function compare(a, b) {
	  			const firstItem = a.meal;
	  			const secondItem = b.meal;
	  			if(firstItem < secondItem) {
	  				return -1;
	  			} else if(firstItem > secondItem) {
	  				return 1;
	  			} else {
	  				return 0;
	  			}
	  		}
	  		for(order of json.orders) {
	  			for (meal of order.meals) {
	  				if(returnDate(order.date) == returnDate(today)) {
	  					meals.push(meal);
	  				}
	  			}
	  		}
	  		meals.sort(compare)
	  		console.log(defineLabels())
	  		console.log(meals)
	  		for(let i = 0; i < defineLabels().length; i++) {
	  			let counter = 0;
	  			for(let j = 0; j < meals.length; j++) {
	  				if(meals[j].meal == defineLabels()[i]) {
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
	  			console.log(quantArr);
	  			if(quantArr.length > 1) {	  				
		  			var quantity = quantArr.reduce(function(a, b) {
		  				return a.quantity + b.quantity;
		  			})
		  			console.log(quantity);
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

	  	howManyMealsSoldToday();
  		




	    let ctt = document.getElementById("pie-chart-today");
      let myChart = new Chart(ctt, {
        type: 'doughnut',        
        data: {
          labels: defineLabels(),
          datasets: [{
            backgroundColor: defineColors(),
            data: howManyMealsSoldToday()
          }]
        },
        options: {
          maintainAspectRatio: false,
          responsive: true
        }
      });
   





  	}); // getJSON end
  } // if statement end
}); // ready function end