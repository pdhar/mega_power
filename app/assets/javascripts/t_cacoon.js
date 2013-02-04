$(document).ready(function() {
    
    $('#componentmonths').bind('cocoon:after-insert',
         function() {
           /* ... do something ... */
          alert('hi');
         });
  

});