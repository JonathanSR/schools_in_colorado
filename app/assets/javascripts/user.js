$(document).ready(function(){
  newSearchSave();
});

function newSearchSave(){
  $("#save-search").on('click', function(event){
    event.preventDefault();
    alert("Search has been Saved");
    // var school = $('.results-college').val();
    // var ethnicity = $('.results-ethnicity').val();
    // var year = $('.results-year').val();
    // var programGrads = $('.program-grads').val();
    // var EthnicityGrads = $('.ethnicity-grads').val();
    // // var percentageOne = $('.percentage-one').val();
    // // var percentageTwo = $('.percentage-two').val();
    // var program = $('.results-program').val();
    // // AddSearchSave(school, ethnicity, year, programGrads, EthnicityGrads, program)
    // console.log(school)
  })
}

var AddSearchSave = function(school, ethnicity, year, programGrads, EthnicityGrads, program){
  var search = {'school': school, 'ethnicity': ethnicity, 'year': year, 'program_grads': programGrads, 'ethnicity_grads':ethnicityGrads, 'program':program}
  return $.ajax({
    url: '/api/usersearches/',
    method: 'POST',
    data: search
  })
  .done()
  .fail(function(error){
    console.log(error)
  })
}