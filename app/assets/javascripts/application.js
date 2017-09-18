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
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require cocoon
//= require jquery.easy-autocomplete
//= require Chart.bundle
//= require_tree .

$(document).ready(function() {


$('#count').text((200 - $('#textarea').val().length))

$("#textarea").keyup(function(){
  $count = (200 - $(this).val().length)
  $("#count").text($count);
  if ($count < 0) {
    $("#count").css("color", "red");
  } else {
    $("#count").css("color", "black");
  }
});






// CHANGE PRICE TEXT FIELD VALUE WHEN A MEAL IS CHOSEN



// END














});

