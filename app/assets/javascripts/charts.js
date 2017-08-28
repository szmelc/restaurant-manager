// CHART
$(document).ready(function() {


var ctp = document.getElementById("pieChart");
var myChart = new Chart(ctp, {
  type: 'doughnut',
  data: {
    labels: ['Dupa', 'Chuj', 'Gówno'],
    datasets: [{
      backgroundColor: [
        "#2ecc71",
        "#3498db",
        "#95a5a6"
      ],
      data: [12, 19, 3]
    }]
  }
});






});
  // CHART END




