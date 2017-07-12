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
    // var percentageOne = $('.percentage-one').val();
    // var percentageTwo = $('.percentage-two').val();
    var program = $('.results-program').text();
    AddSearchSave(school, ethnicity, year, programGrads, ethnicityGrads, program)
  })
}

var AddSearchSave = function(school, ethnicity, year, programGrads, ethnicityGrads, program){
  var search = {'school': school, 'ethnicity': ethnicity, 'year': year, 'program_grads': programGrads, 'ethnicity_grads':ethnicityGrads, 'program':program}
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