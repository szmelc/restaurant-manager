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
					}
				})				
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
						}				
				});
			// END PORÓWNANIE ZAMÓWIEŃ Z POSZCZEGÓLNYCH DNI



			// INCOME CHARTS
			
				// GENERAL INCOME EACH DAY
					var incomeDailyChart = document.getElementById('income-daily-chart');
					var dailyIncomeChart = new Chart(incomeDailyChart, {
					  type: 'bar',
					  data: {
					    labels: setLabels(),
					    datasets: [{
					      label: 'apples',
					      data: [12, 19, 3, 17, 28, 24, 7]
					    }]
					  }
					});

				// END GENERAL INCOME EACH DAY

				// INCOME PER EMPLOYEE ON CERTAIN DAY



				// END INCOME PER EMPLOYEE ON CERTAIN DAY


			// END INCOME CHARTS







		});
	}
});