$(document).ready(function() {
		if($('body').hasClass('admin')) {
			$.getJSON(window.location + '.json', function(json) {
				let labels = [];
				let data = [];
				for(user of json.users) {
					labels.push(user.name)
					data.push(user.count)
				}
				console.log(labels);
				console.log(data);
				var ctu = document.getElementById('barChartAllEmployees');
				var chartAllEmployees = new Chart(ctu, {
					type: 'bar',
					data: {
					labels: labels,
					datasets: [{
						label: 'Ilość zamówień',
						backgroundColor: 'rgba(27, 157, 226, .95)',
						hoverBackgroundColor: 'rgba(27, 157, 226, 1)',
	  				borderColor: 'whitesmoke',
	  				borderWidth: 2,
	  				data: data						
					}]	
					}
				});

			});
		}
})
