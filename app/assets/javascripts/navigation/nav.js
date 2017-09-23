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

	$("img").click(function() {
	  var chosen = $(this)
	  window.location = chosen.data("link");
	});	


// Go to action when clicking on action button

	$(".action-button").click(function() {
		var chosen = $(this)
		window.location = chosen.data('link')
	});

// Navigate through charts in admin panel

	$('.button').click(function() {
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
		$alt = $(this).attr('alt')
		$('canvas').css('display', 'none')
		$('div[id="' + $alt + '"]').css('display', 'inline');
	});

// Navigate through income tabs in admin panel
	$('.button-income').click(function() {
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
		$alt = $(this).attr('alt')
		$income = $("div[class='income']")
		$income.css('display', 'none')
		$('div[id="' + $alt + '"]').css('display', 'inline');
	});

});



