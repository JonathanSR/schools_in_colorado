      function initMap() {
        var uluru = {lat: gon.institution.latitude, lng: gon.institution.longitude};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
