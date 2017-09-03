$(document).ready(function() {

	$('#avatar-thumb').click(function() {
		$('#user-buttons').slideToggle(100);
	})

// Go to URL when clicking on buttons divs
	$('.navbutton').click(function() {
		window.location = $(this).data('link')
	})


// Go to user when clicking on a thumbnail on user showpage

	$(".user-thumb").click(function() {
	  var chosen = $(this)
	  window.location = chosen.data("link");
	});

	$("#settings").click(function() {
	  var chosen = $(this)
	  window.location = chosen.data("link");
	});

});



