$(document).ready(function() {
	if($('body').hasClass('orders new')) {
		

		$('.meals').on('change', 'select:first-child', function() {
			var chosen = $(this).find(":selected");
			var price = chosen.data("description");
			var priceInt = parseInt(price)
			var quantity = $(this).siblings('select').val()
			var quantityInt = parseInt(quantity)
			console.log(priceInt)
			console.log(quantityInt)

			$(this).siblings("div").html("<p>" + priceInt*quantityInt + " pln</p>");	
			$('.meals').on('change', 'select:nth-child(2)', function() {
				var quant = $(this).val()
				var quantInt = parseInt(quant);
				console.log(quant)
				$(this).siblings("div").html("<p>" + priceInt*quantInt + " pln</p>");	
			})	
		});
	}
})