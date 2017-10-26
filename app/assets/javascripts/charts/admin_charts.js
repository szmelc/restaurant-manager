$(document).ready(function() {
	if($('body').hasClass('admin')) {
		$.getJSON(window.location + '.json', function(json) {

	  	function returnDate(jsonDate) {
	  		let date = new Date(jsonDate)
	  		let day = date.getDate();
				let month = date.getMonth();
				let year = date.getFullYear();
				return `${day}-${month}-${year}`;
	  	}	// converts any date to a usable format	DD-MM-YYYY

      function defineColor() {
        let letters = '0123456789ABCDEF'
        let color = '#'
        for(let i = 0; i < 6; i++) {
          color += letters[Math.floor(Math.random()*16)]
        }
        return color;
      } // generates random color with hex values	  	
		
			function setLabels() {
				let startDate = new Date - 24 * 3600 * 1000 * 7 - 1 //returns miliseconds
				let endDate = new Date()
				let dayLabels = []

				let e = new Date(startDate);
				let t = new Date(endDate);
				let a = [];
				let labels = [];

				while(e < t - 1	) {
					a.push(e)
					e = new Date(e.setDate(e.getDate() + 1))
				}
				for(let i = 0; i < a.length; i++) {
					let day = a[i].getDate();
					let month = a[i].getMonth();
					let year = a[i].getFullYear(); // zrefaktoruj
					
					let date = `${day}-${month}-${year}`;
					dayLabels.push(date);

				}
				return dayLabels;					
			}	 // returns last 7 days of the week

			function defineAmounts() {
				for(let i = 0; i < setLabels().length; i++) {
					let counter = 0;
					for(let j = 0; j < allOrders.length; j++) {
						if(allOrders[j] == setLabels()[i]) {
							counter++;
						}					
					}
					values.push(counter)
				}
				return values;
			} // defines amount of orders on a certain day

			// Porównanie zamówień między robolami
				let nameLabels = []; 
				let ordersNumber = [];

				let allOrders = [];
				let values = [];


				for(user of json.users) {
					nameLabels.push(user.name)
					ordersNumber.push(user.orders_count)
					for(order of user.orders) {
						allOrders.push(returnDate(order.created_at));
					}
				} // provide data for employee comparison chart

				var ctu = document.getElementById('barChartAllEmployees');
				var chartAllEmployees = new Chart(ctu, {
					type: 'bar',
					data: {
					labels: nameLabels,
					datasets: [{
						label: 'Ilość zamówień',
						backgroundColor: 'rgba(27, 157, 226, .95)',
						hoverBackgroundColor: 'rgba(27, 157, 226, 1)',
	  				borderColor: 'whitesmoke',
	  				borderWidth: 2,
	  				data: ordersNumber						
					}]	
					},
		  		options: {
		  			legend: {
		  				labels: {
		  					defaultFontFamily: "'Lato', sans-serif"
		  				}
		  			},
		  			scales: {
		  				yAxes: [{
		  					ticks: {
		  						beginAtZero: true,
		  						stepSize: 4
		  					}
		  				}]
		  			}
		  		}					
				});	
			// END Porównanie zamówień między robolami



			// ILOŚĆ WSZYSTKICH ZAMÓWIEŃ DANEGO DNIA
			

				
				var ctao = document.getElementById('barChartAllOrders')
				var chartOrderCount = new Chart(ctao, {
					type: 'bar',
					data: {
						labels: setLabels(),
						datasets: [{
							label: 'Ilość zamówień',
							backgroundColor: 'rgba(27, 157, 226, .95)',
							data: defineAmounts()
						}]
					},
		  		options: {
		  			legend: {
		  				labels: {
		  					defaultFontFamily: "'Lato', sans-serif"
		  				}
		  			},
		  			scales: {
		  				yAxes: [{
		  					ticks: {
		  						beginAtZero: true,
		  						stepSize: 8
		  					}
		  				}]
		  			}
		  		}					
				});		
			// END ILOŚĆ WSZYSTKICH ZAMÓWIEŃ DANEGO DNIA

			// PORÓWNANIE ZAMÓWIEŃ Z POSZCZEGÓLNYCH DNI
				let colors = [
				"#5f9bfc",
				"#d8944b",
				"#ed7bda",
				"#628e75",
				"#959ea0",
				"#00d0ff",
				"#f4bbb2",
				"#fffa84",
				"#647f4f"
				]				

				function amountOfOrdersDaily() {
					let orderDates = [];
					let amounts = [];
					let counter = 0;	

					for(user of json.users) {	
						for(order of user.orders) {
							orderDates.push(returnDate(order.created_at))
						}
						for(let i = 0; i < setLabels().length; i++) {
							for(let j = 0; j < orderDates.length; j++) {
								if(orderDates[j] == setLabels()[i]) {
									counter++
								}
							}
							amounts.push(counter);
							counter = 0;
						}
					}
				}

				function returnDataset() {
					let i = 0;					
					let orderDates = [];
					let amounts = [];
					let counter = 0;					
					let data = [];
					for(user of json.users) {	
						for(order of user.orders) {
							orderDates.push(returnDate(order.created_at))
						}
						for(let i = 0; i < setLabels().length; i++) {
							for(let j = 0; j < orderDates.length; j++) {
								if(orderDates[j] == setLabels()[i]) {
									counter++
								}
							}
							amounts.push(counter);
							counter = 0;
						}

						orderDates = [];
						data.push({label: user.name, backgroundColor: colors[i], data: amounts});												
						i++						
						amounts = []
					}
					return data
				}
								
				function amountOfOrdersEachDay() {
					let orderDates = [];
					let amounts = [];
					var counter = 0;
					for(user of json.users) {
						for(order of user.orders) {
							orderDates.push(returnDate(order.created_at))
						}						
						for(let i = 0; i < setLabels().length; i++) {
							for(let j = 0; j < orderDates.length; j++) {
								if(orderDates[j] == setLabels()[i]) {
									counter++;
								}
							}
							amounts.push(counter)
							counter = 0;														
						}						
						orderDates = [];
						amounts = []
					}
				}
				amountOfOrdersEachDay()



				var ctud = document.getElementById('barChartAllEmployeesDailyComparison');
				var chartAllEmployeesDaily = new Chart(ctud, {
					type: 'bar',
					data: {
						labels: setLabels(),
						datasets: returnDataset()
					},
		  		options: {
		  			legend: {
		  				labels: {
		  					defaultFontFamily: "'Lato', sans-serif"
		  				}
		  			},
		  			scales: {
		  				yAxes: [{
		  					ticks: {
		  						beginAtZero: true,
		  						stepSize: 4
		  					}
		  				}]
		  			}
		  		}									
				});
			// END PORÓWNANIE ZAMÓWIEŃ Z POSZCZEGÓLNYCH DNI



			// INCOME CHARTS
				// GENERAL INCOME EACH DAY & AVERAGE ORDER COST
					function calculateIncome() {
						let income = []
						
						for(let i = 0; i < setLabels().length; i++) {
							var pricesOnThatDay = []
							for(order of json.orders) {
								if(setLabels()[i] == returnDate(order.date)) {
									pricesOnThatDay.push(order.price);
								}
							}
							if(pricesOnThatDay.length > 0) {
								let sum = pricesOnThatDay.reduce(function(a, b) {
									return a + b;
								})
								income.push(sum)
							} else {
								income.push(0)
							}
						}
						return income
					}
									
					function calculateAverageOrderPrice() {		
						let averagePrices = []
						for(let i = 0; i < setLabels().length; i++) {
							let prices = [];
							for(order of json.orders) {
								if(setLabels()[i] == returnDate(order.date)) {
									prices.push(order.price);
								}
							}
							if(prices.length > 0) {
								let sum = prices.reduce(function(a, b) {
									return a + b;									
								});
								averagePrices.push(parseInt((sum/prices.length).toFixed(2)));
							} else {
								let sum = 0;
								averagePrices.push(sum)
							}							
						}
						return averagePrices
					}

					calculateAverageOrderPrice()
					var incomeDailyChart = document.getElementById('income-daily-chart');
					var dailyIncomeChart = new Chart(incomeDailyChart, {
					  type: 'bar',
					  data: {
					    labels: setLabels(),
					    datasets: [
					    {
					    	label: 'Średnia wartość zamówienia',
					    	backgroundColor: 'rgba(232, 255, 33, .85)',
					    	borderColor: 'rgba(27, 157, 226, 1)',
					    	borderWidth: 2,
					    	type: 'line',
					    	data: calculateAverageOrderPrice(),
					    	lineTension: 0.25,
					    	spanGaps: true
					    },					    	
					    {
					      label: 'Dzienny przychód',
								backgroundColor: 'rgba(27, 157, 226, .95)',
								hoverBackgroundColor: 'rgba(27, 157, 226, 1)',
			  				borderColor: 'whitesmoke',
			  				borderWidth: 2,					      
					      data: calculateIncome()
					    }]
					  },
			  		options: {
			  			title: {
			  				display: true,
			  				text: "Tygodniowy utarg"
			  			},
			  			legend: {
			  				labels: {
			  					defaultFontFamily: "'Lato', sans-serif"
			  				}
			  			},
			  			scales: {
			  				yAxes: [{
			  					ticks: {
			  						beginAtZero: true
			  					}
			  				}]
			  			}
			  		}					  
					});

				// END GENERAL INCOME EACH DAY & AVERAGE ORDER COST




				// INCOME PER EMPLOYEE ON A CERTAIN DAY

					function setNameLabels() {
						let namesArray = []
						for(user of json.users) {
							namesArray.push(user.name);
						}
						return namesArray;
					}

					function returnEmployeeDatasets() {
						let dataset = [];
						let i = 0;
						let cost = [];
						for(user of json.users) {
							let dailyCost = []
							for(let j = 0; j < setLabels().length; j++) {
								for(order of user.orders) {
									if(setLabels()[j] == returnDate(order.date)) {
										cost.push(order.price);
									}			
								}
								if (cost.length > 0) {
									let sum = cost.reduce(function(a, b) {
										return a + b;
									});
									dailyCost.push(sum)
									cost = []
								} else {
									let sum = 0;
									dailyCost.push(0);
								}
							}							
							i++
							dataset.push({label: user.name, data: dailyCost, backgroundColor: defineColor()})
							cost = []
						}
						return dataset;
					}
					returnEmployeeDatasets()



					var incomePerEmployeeChart = document.getElementById("income-per-employee-chart").getContext('2d');
					var barChart = new Chart(incomePerEmployeeChart, {
					  type: 'bar',
					  data: {
					    labels: setLabels(),
					    datasets: returnEmployeeDatasets()
					  },
					  options: {
				      title: {
				        display: true,
				        text: 'Utarg poszczególnych pracowinków'
				      }					  	
					  }
					});

					


				// END INCOME PER EMPLOYEE ON CERTAIN DAY


			// END INCOME CHARTS

			// NAJPOPULARNIEJSZE POTRAWY
		    function defineMealsLabels(condition) {
		      let mealsAll = []; // list of meals for chart labels
		      for(order of json.orders) {
		        for(meal of order.meals) {
		          if(condition == 'all') {
		            if(mealsAll.includes(meal.name) == false) {
		              mealsAll.push(meal.name)
		            }
		          } else if(condition == 'today') {
		            if(returnDate(order.date) == returnDate(today) 
		               && mealsAll.includes(meal.name) == false) {
		             mealsAll.push(meal.name)
		           }
		          }
		        }
		      }
		     return mealsAll.sort()
		    } // returns array with names of sold meals

		    function defineAmountOfMeals() {
		    	let arr = []
		    	let quantities = []
		    	for(order of json.orders) {
		    		for(meal of order.meals) {
		    			for(let i = 0; i < meal.quantity; i++) {
			    			arr.push(meal.name)	
		    			}		    			
		    		}
		    	}
		    	arr.sort()
		    	for(let i = 0; i < defineMealsLabels('all').length; i++) {
		    		let counter = 0;
		    		for(let j = 0; j < arr.length; j++) {
		    			if(defineMealsLabels('all')[i] == arr[j]) {
		    				counter++;
		    			}		    			
		    		}
		    		quantities.push(counter);
		    	}
		    	return quantities
		    }
		    defineAmountOfMeals()

		    function returnArrOfColors(amount) {	      
		      let colors = [];
		    	for(let i = 0; i < amount; i++) {
		    		let color = '#';
		    		let letters = '0123456789ABCDEF'		      
		    		for(let i = 0; i < 6; i++) {
			        color += letters[Math.floor(Math.random()*16)]
			      }
			      colors.push(color);
		    	}		      
		      return colors;
		    }




				new Chart(document.getElementById("mostPopularDishesChart"), {
				    type: 'bar',
				    data: {
				      labels: defineMealsLabels('all'),
				      datasets: [				      	
				        {
				          backgroundColor: returnArrOfColors(defineAmountOfMeals().length),				          
				          data: defineAmountOfMeals()				          
				        }
				      ]
				    },
				    options: {
				      legend: { 
				      	display: false,
				      },				      
				      title: {
				        display: true,
				        text: 'Najpopularniejsze potrawy'
				      },
			  			scales: {
			  				yAxes: [{
			  					ticks: {
			  						beginAtZero: true
			  					}
			  				}],
			  				xAxes: [{
			  					ticks: {
			  						autoSkip: false,
			  						maxRotation: 90,
			  						minRotation: 90
			  					}
			  				}]
			  			}				      
				    }
				});
			// END NAJPOPULARNIEJSZE POTRAWY

			// create a sorted object with meals and quantites to use it in a list and populate the list
			function createMealsObject() {
				var arr = [];
				for(let i = 0; i < defineMealsLabels('all').length; i++) {					
					arr.push({'name': defineMealsLabels('all')[i], 'quantity': defineAmountOfMeals()[i]})
				}
				// sort the array according to amount of meals
				function compareMealAmounts(a, b) {
					let firstItem = a.quantity;
					let secondItem = b.quantity;
					if(firstItem > secondItem) {
						return - 1;
					} else if(firstItem < secondItem) {
						return 1;
					} else {
						return 0;
					}
				}
				arr.sort(compareMealAmounts)
				return arr;
			}

			createMealsObject();

		// Populate table with popular meals
			for(let i = 0; i < createMealsObject().length; i++) {
				$('#meals-table').append("<li><span>" + createMealsObject()[i].name + "</span>" + "<strong>" + createMealsObject()[i].quantity + '</strong></li>')
			}


		});
	}
});