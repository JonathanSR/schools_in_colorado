 $('.form').on('ajax:error', function(event, xhr, status, error){

   $(this).append(xhr.responseText)
 });
 