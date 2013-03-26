$('.slideParent').live('click', function() {
  $(this).parent().next().slideToggle();
});
