var track = [];
var city;
var lineCoordinatesArray = [];
var map, infoWindow, pos;
var marker;
var licenses = [];

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

    Date.prototype.addDays = function(days) {
       var dat = new Date(this.valueOf())
       dat.setDate(dat.getDate() + days);
       return dat;
   }

   function getDates(startDate, stopDate) {
      var dateArray = new Array();
      var currentDate = startDate;
      while (currentDate <= stopDate) {
        dateArray.push(currentDate)
        currentDate = currentDate.addDays(1);
      }
      return dateArray;
    }

  function initMap() {

    var geocoder = new google.maps.Geocoder;
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 14, lng: 121},
      zoom: 6
    });
    infoWindow = new google.maps.InfoWindow({map: map});

    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
          pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        map.setCenter(pos); 
        track.push(pos);
        geocoder.geocode({'location': pos}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            if (results[1]) {
              map.setZoom(11);
              marker = new google.maps.Marker({
                position: pos,
                map: map
              });
              //alert("latitude"+pos.lat+"\nLongitude"+pos.lng);
              infoWindow.open(map, marker);
              city = results[1].address_components[1].long_name;
              infoWindow.setContent(city);
              map.setCenter(pos);
              document.getElementById("city").innerHTML = city;
              $(function(){
                  $(".coordinatesss").html("COORDINATES: "+pos.lat.toFixed(4)+"° N, "+pos.lng.toFixed(4)+"° E");
                  $(".coordinatesss2").html(pos.lat.toFixed(4)+"° N, "+pos.lng.toFixed(4)+"° E");
              });
            
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });
      }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
    /*map.addListener('mousemove', function(event) {
      console.log(
        'lat: ' + event.latLng.lat() + ', ' +
        'lng: ' + event.latLng.lng()
        );
    });*/ 

  }

  function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
                          'Error: The Geolocation service failed.' :
                          'Error: Your browser doesn\'t support geolocation.');
  }

  