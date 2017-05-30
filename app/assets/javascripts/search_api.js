// const host = "https://data.colorado.gov/resource/yt5k-hawq.json"

// $(document).ready(function(){
// newYear();
// // parseInstitutionResponse();
// });

// function newYear(){
//   $("#year").on('change', function(){
//     var year = $('#year').val();
//     getInstitution(year)
//   });
// };

// var getInstitution = function(year){
//   var apiYear = year
//   return $.ajax({
//     url: host + '?year=' + apiYear,
//     method: 'GET'
//   })
//   .done(schools)
//   .fail(function(error){
//     console.log(error)
//   });
// }; 

// var schools = function(data){

//   console.log(data[0])
//   var school_data = data
//   var singleSchoolData = _.uniqBy(school_data, 'institutionname');
// //  console.log(singleSchoolData)
//   for(var i = 0; i < singleSchoolData.length; i++){
//     console.log(singleSchoolData[26])
//   }
// }