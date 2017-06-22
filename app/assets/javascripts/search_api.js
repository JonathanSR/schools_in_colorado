const host = "https://data.colorado.gov/resource/yt5k-hawq.json"

$(document).ready(function(){
  newYear();
  newProgram();
});

function newYear(){
  $("#year").on('change', function(){
    var year = $('#year').val();
    getInstitution(year)
  });
};

var getInstitution = function(year){
  var apiYear = year
  return $.ajax({
    url: host + '?year=' + apiYear,
    method: 'GET'
  })
  .done(schools)
  .fail(function(error){
    console.log(error)
  });
}; 

var schools = function(schoolData){
  var singleSchoolData = _.uniqBy(schoolData, 'institutionname');
  for(var i = 0; i < singleSchoolData.length; i++){
    institution = (singleSchoolData[i].institutionname)
    $('#college').append(new Option(institution))
  };
};

function newProgram(){
  $("#college").on('change', function(){
    var year = $("#year").val();
    var college = $("#college").val();
    getPrograms(year, college)
  });
};

var getPrograms = function(year, college){
  var apiYear = year
  var apiCollege = college 
  return $.ajax({
    url: host + '?year=' + apiYear + '&institutionname=' + apiCollege,
    method: 'GET'
  })
  .done(programs)
  .fail(function(error){
    console.log(error)
  });
};

var programs = function(programsData){
  var singleProgramData = _.uniqBy(programsData, 'cip2');
  for (var i = 0; i < singleProgramData.length; i++){
    program = (singleProgramData[i].cip2)
    getDatabasePrograms(program)
  };
};

var getDatabasePrograms = function(program){
  var databaseProgram = {'cip2': program}

  return $.ajax({
    url:"api/v1/programs/",
    method: 'GET',
    data: databaseProgram
  })
  .done(databasePrograms)
  .fail(function(error){
    console.log(error)
  });
};

var databasePrograms = function(databaseProgramsData){
  newProgramCip2 = databaseProgramsData[0].cip2
  newProgram = databaseProgramsData[0].name
  $("#program").append(new Option(newProgram, newProgramCip2))
};


