const host = "https://data.colorado.gov/resource/yt5k-hawq.json"

$(document).ready(function(){
  newYear();
  newProgram();
  newEthnicity();
});

function newYear(){
  $("#year").on('change', function(){
    var year = $('#year').val();
    getInstitution(year)
  });
};

var getInstitution = function(year){
  return $.ajax({
    url: host + '?year=' + year,
    method: 'GET',
    data: {
      "$$app_token" : $('body').data('env')
    }
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
  return $.ajax({
    url: host + '?year=' + year + '&institutionname=' + college,
    method: 'GET',
    data: {
      "$$app_token" : ($('body').data('env'))
    }
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

function newEthnicity(){
  $("#program").on('change', function(){
    var year = $("#year").val();
    var college = $("#college").val();
    var program = $("#program").val();
    getEthnicity(year, college, program)
  });
};

var getEthnicity = function(year, college, program){
  return $.ajax({
    url: host + '?year=' + year + '&institutionname=' + college + '&cip2=' + program,
    method: 'GET',
    data: {
      "$$app_token" : ($('body').data('env'))
    }
  })
  .done(ethnicities)
  .fail(function(error){
    console.log(error)
  });
};

var ethnicities = function(ethnicitiesData){
  var singleEthnicityData = _.uniqBy(ethnicitiesData, 'ethnicity');
  for(var i = 0; i < singleEthnicityData.length; i++){
    ethnicity = (singleEthnicityData[i].ethnicity)
    $('#ethnicity').append(new Option(ethnicity))
  };
};

