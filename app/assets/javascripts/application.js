// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic_ui/semantic_ui

$(function(){

  if ($('#login-box').length) {
    $('.launch.icon.item').addClass('no-display');
  };

  $('.top.sidebar').sidebar('attach events', '.toggle-button');
  $('.modal-content').css('max-height', $('html').height() - 20 + 'px');    

  $(window).resize(function() {
    $('.modal-content').css('max-height', $('html').height() - 10 + 'px');
  });


  // SHOW MODAL functionality for CUSTOMER ORDER SELECTION
  $('.modal-trigger').on('click', function(){
      var selectText = $(this).find('.select-text').text().trim();
      console.log(selectText);

      var optionValue = parseInt($('form option').filter(function () { return $(this).text() == selectText; }).val());
      console.log(optionValue);

      $('.item-header').text(selectText);

      $('form select').val(optionValue);
  });


  $('.modal-trigger').on('click', function() {
    $('.modal').toggle().fadeIn();
  });

  $(".close-modal").on('click', function() {
    console.log("You clicked the close button!");
    $(".modal").toggle();
  });

  $('select.dropdown')
  .dropdown();

});
