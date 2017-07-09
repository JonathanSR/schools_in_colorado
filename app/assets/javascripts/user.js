$(document).ready(function(){
  newSave();
});

function newSave(){
  $("#save-search").on('click', function(){
    var school = $('#results').val();
    var ethnicity = $('.results-ethnicity').val();
    var year = $('.results-year').val();
  })
}