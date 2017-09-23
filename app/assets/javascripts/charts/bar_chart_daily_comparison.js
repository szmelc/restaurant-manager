// $(document).ready(function() {
// 		if($('body').hasClass('admin')) {
// 			$.getJSON(window.location + '.json', function(json) {
// 				let colors = [
// 				"#5f9bfc",
// 				"#d8944b",
// 				"#ed7bda",
// 				"#628e75",
// 				"#959ea0",
// 				"#00d0ff",
// 				"#f4bbb2",
// 				"#fffa84",
// 				"#647f4f"
// 				]

// 		  	function returnDate(jsonDate) {
// 		  		let date = new Date(jsonDate)
// 		  		let day = date.getDate();
// 					let month = date.getMonth();
// 					let year = date.getFullYear();
// 					return `${day}-${month}-${year}`;
// 		  	}

// 				function setLabels() {
// 					var startDate = new Date - 24 * 3600 * 1000 * 7 - 1 //returns miliseconds
// 					var endDate = new Date()

// 					var e = new Date(startDate);
// 					var t = new Date(endDate);
// 					var a = [];
// 					let labels = [];

// 					while(e < t - 1	) {
// 						a.push(e)
// 						e = new Date(e.setDate(e.getDate() + 1))
// 					}
// 					for(let i = 0; i < a.length; i++) {
// 						let day = a[i].getDate();
// 						let month = a[i].getMonth();
// 						let year = a[i].getFullYear(); // zrefaktoruj
						
// 						let date = `${day}-${month}-${year}`;
// 						labels.push(date);

// 					}
// 					return labels;					
// 				}

// 				function amountOfOrdersDaily() {
// 					let orderDates = [];
// 					let amounts = [];
// 					var counter = 0;	

// 					for(user of json.users) {	
// 						for(order of user.orders) {
// 							orderDates.push(returnDate(order.created_at))
// 						}
// 						for(let i = 0; i < setLabels().length; i++) {
// 							for(let j = 0; j < orderDates.length; j++) {
// 								if(orderDates[j] == setLabels()[i]) {
// 									counter++
// 								}
// 							}
// 							amounts.push(counter);
// 							counter = 0;
// 						}
// 					}
// 				}

// 				function returnDataset() {
// 					let i = 0;					
// 					let orderDates = [];
// 					let amounts = [];
// 					var counter = 0;					
// 					var data = [];
// 					for(user of json.users) {	
// 						for(order of user.orders) {
// 							orderDates.push(returnDate(order.created_at))
// 						}
// 						for(let i = 0; i < setLabels().length; i++) {
// 							for(let j = 0; j < orderDates.length; j++) {
// 								if(orderDates[j] == setLabels()[i]) {
// 									counter++
// 								}
// 							}
// 							amounts.push(counter);
// 							counter = 0;
// 						}

// 						orderDates = [];
// 						data.push({label: user.name, backgroundColor: colors[i], data: amounts});												
// 						i++						
// 						amounts = []
// 					}
// 					return data
// 				}
				
				
				

// 				function amountOfOrdersEachDay() {
// 					let orderDates = [];
// 					let amounts = [];
// 					var counter = 0;
// 					for(user of json.users) {
// 						for(order of user.orders) {
// 							orderDates.push(returnDate(order.created_at))
// 						}						
// 						for(let i = 0; i < setLabels().length; i++) {
// 							for(let j = 0; j < orderDates.length; j++) {
// 								if(orderDates[j] == setLabels()[i]) {
// 									counter++;
// 								}
// 							}
// 							amounts.push(counter)
// 							counter = 0;														
// 						}						
// 						orderDates = [];
// 						amounts = []
// 					}
// 				}
// 				amountOfOrdersEachDay()



// 				var ctud = document.getElementById('barChartAllEmployeesDailyComparison');
// 				var chartAllEmployeesDaily = new Chart(ctud, {
// 					type: 'bar',
// 					data: {
// 					labels: setLabels(),
// 					datasets: returnDataset()
// 						}				
// 				});
// 			});
// 		}
// });
