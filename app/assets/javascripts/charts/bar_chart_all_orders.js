$(document).ready(function() {
	if($('body').hasClass('admin')) {
		$.getJSON(window.location + '.json', function(json) {
			let allOrders = []
			let values = [];


	  	function returnDate(jsonDate) {
	  		let date = new Date(jsonDate)
	  		let day = date.getDate();
				let month = date.getMonth();
				let year = date.getFullYear();
				return `${day}-${month}-${year}`;
	  	}

			function setLabels() {
				var startDate = new Date - 24 * 3600 * 1000 * 7 - 1 //returns miliseconds
				var endDate = new Date()

				var e = new Date(startDate);
				var t = new Date(endDate);
				var a = [];
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
					labels.push(date);

				}
				return labels;					
			}	  	

			for(user of json.users) {
				for(order of user.orders) {
					// returnDate(order.created_at)
					allOrders.push(returnDate(order.created_at))
				}
			}
			
			console.log(allOrders);

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
			}



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
		});
	}
});