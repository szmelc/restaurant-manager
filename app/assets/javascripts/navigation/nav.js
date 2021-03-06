$(document).ready(function() {


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

	$("img#avatar").click(function() {
	  var chosen = $(this)
	  window.location = chosen.data("link");
	});	

	$(".post-avatar").click(function() {
	  var chosen = $(this)
	  window.location = chosen.data("link");
	});	

	$(".comment-avatar").click(function() {
	  var chosen = $(this)
	  window.location = chosen.data("link");
	});	

// Go to action when clicking on action button

	$(".action-button").click(function() {
		var chosen = $(this)
		window.location = chosen.data('link')
	});

// Hide two canvases
	$('#barChartAllEmployees').css("display", "none");
	$('#barChartAllEmployeesDailyComparison').css("display", "none");
	$('#income-per-employee-chart').css("display", "none");

// Navigate through charts in admin panel

	$('.button').click(function() {
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
		$alt = $(this).attr('alt')
		$('#chart > canvas').css('display', 'none')
		$('canvas[id="' + $alt + '"]').css('display', 'inline');
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

// Navigate through charts in the income panel
	$('.button-income-chart').click(function() {
		$(this).siblings().removeClass('active');
		$(this).addClass('active');		
		$alt = $(this).attr('alt');
		$('.income-chart > canvas').css('display', 'none')
		$('.income-chart > canvas[id="' + $alt + '"]').css('display', 'inline');
	});



});



