$(document).ready(function() {
		if($('body').hasClass('users')) {

			$('#orders-header').click(function() {
				$('#orders-chart').slideToggle(250)
			});

			

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
			setLabels();
			


		  $.getJSON(window.location + '.json', function(json) {

			function defineNumberOfOrders() {
				let dates = [];
				let numberOfOrders = [];
				for(order of json.orders) {
					let convertedDate = new Date(order.date) // converts string to date format
					let day = convertedDate.getDate();
					let month = convertedDate.getMonth();
					let year = convertedDate.getFullYear();
					let date = `${day}-${month}-${year}`; // formatted date (like in labels)
					dates.push(date);
				}
				console.log(dates)
				for(let i = 0; i < setLabels().length; i ++) {
					let counter = 0;
					for(let j = 0; j < dates.length; j++) {
						if(dates[j] === setLabels()[i]) {
							counter++
						}
					}
					numberOfOrders.push(counter)
				}
				return numberOfOrders
				

			}

			defineNumberOfOrders()



		  	let ctb = document.getElementById('barChart')
		  	let barChart = new Chart(ctb, {
		  		type: 'bar',
		  		data: {
		  			labels: setLabels(),
		  			datasets: [{
		  				label: 'Ilość zamówień',
		  				backgroundColor: 'rgba(27, 157, 226, .95)',
		  				hoverBackgroundColor: 'rgba(27, 157, 226, 1)',
		  				borderColor: 'whitesmoke',
		  				borderWidth: 2,
		  				data: defineNumberOfOrders()
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
		  						stepSize: 1
		  					}
		  				}]
		  			}
		  		}
		  	})



		  });
		}
	})
	  	