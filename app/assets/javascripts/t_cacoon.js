/*$('.slideParent').on('click', function() {
  $(this).parent().next().slideToggle();
});*/


$(document).on('click', '.slideParent', function() { 
  $(this).parent().next().slideToggle();
});