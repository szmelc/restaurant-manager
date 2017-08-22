// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require cocoon
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

// $(".meal-name").change(function(){
//     var chosen = $(this).find(":selected");
//     var price = chosen.data("description");
//     $(this).siblings("input").val(price);
// })


// CHANGE PRICE TEXT FIELD VALUE WHEN A MEAL IS CHOSEN

$('.meals').on('change', '.meal-name', function() {
	$('.meal-name').on('change', function() {		
		var chosen = $(this).find(":selected");
		var price = chosen.data("description");
		console.log(price)		
		$(this).siblings("input").val(price);

	})
})

// END

// GO TO USER PAGE WHEN CLICKING ON A ROW

$("tr[data-link]").click(function() {
	var chosen = $(this)
  window.location = chosen.data("link");
});

// END

// GO TO USER PAGE WHEN CLICKING ON AVATAR

$("img[data-link]").click(function() {
	var chosen = $(this)
  window.location = chosen.data("link");
});

// END

});