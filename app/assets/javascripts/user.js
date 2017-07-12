$(document).ready(function(){
  newSearchSave();
});

function newSearchSave(){
  $("#save-search").on('click', function(event){
    event.preventDefault();
    // alert("Search has been Saved");
    var school = $('#results-college').text();
    var ethnicity = $('#results-ethnicity').text();
    var year = $('#results-year').text();
    var programGrads = $('#program-grads').text();
    var ethnicityGrads = $('#ethnicity-grads').text();
    var percentageOne = $('#percentage-one').text();
    var percentageTwo = $('#percentage-two').text();
    var program = $('.results-program').text();
    AddSearchSave(school, ethnicity, year, programGrads, ethnicityGrads, program, percentageOne, percentageTwo)
  })
}

var AddSearchSave = function(school, ethnicity, year, programGrads, ethnicityGrads, program, percentageOne, percentageTwo){
  var search = {'school': school, 'ethnicity': ethnicity, 'year': year, 'program_grads': programGrads, 'ethnicity_grads':ethnicityGrads, 'program':program, 'percentage_one':percentageOne, 'percentage_two':percentageTwo}
  return $.ajax({
    url: '/api/v1/saves',
    method: 'POST',
    data: search
  })
  .done()
  .fail(function(error){
    console.log(error)
  })
}