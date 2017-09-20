$(document).ready(function() {
	if($('body').hasClass('orders new')) {

		$('.meals').on('change', '.nested-fields select:first-child', function() {
			var chosen = $(this).find(":selected");
			$fields = chosen.parent().parent();
			var price = chosen.data("description");
			var priceInt = parseInt(price)
			var quantity = $(this).siblings('select').val()
			var quantityInt = parseInt(quantity)
			$(this).siblings("input[id$='price']").val(priceInt*quantityInt)
			$(this).siblings("#pricediv").html("<p>" + priceInt*quantityInt + "</p>");	
			$('.meals').on('change', 'select:nth-child(2)', function() {
				var quant = $(this).val()
				var quantInt = parseInt(quant);
				console.log(priceInt)
				$(this).siblings("input[id$='price']").val(priceInt*quantInt)
				$(this).siblings("#pricediv").html("<p>" + priceInt*quantInt + "</p>");	
			})	
		});
	}
})

