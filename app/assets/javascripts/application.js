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
//= require ckeditor/init
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function() {
  $('.flash-wrapper').delay(1500).fadeOut(2000);

  $('.add_artwork').click(function() {
    $('.add_artwork_form').toggle();
    if ( $('.add_artwork').text() == "Hide Form") {
      $('.add_artwork').text("Add Artwork");
    } else {
      $('.add_artwork').text("Hide Form");
    }
  });

  $('#myCarousel').carousel({interval: 3000, cycle: true});

  $('#mainModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var image = button.data('image')
  var description = button.data('description') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-image').html("<img src="+image+" />")
  modal.find('.modal-description').text(description)
})
});
