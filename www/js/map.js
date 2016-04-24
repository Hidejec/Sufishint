var track = [];
var city;
var lineCoordinatesArray = [];
var map, infoWindow, pos;
var marker;

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
              infoWindow.open(map, marker);
              city = results[1].address_components[1].long_name;
              infoWindow.setContent(city);
                var date = new Date();
                date = formatDate(date);
                console.log(city+" "+date);
                var data = {
                  vessel_id: 4, // {{ Auth::user()->id }}
                  date: date,
                  location: city
                };

                $.ajax({
                  url: "http://lol-haha.com/LiquidoAPI/tracks",
                  type: "post",
                  data: data,
                  dataType: "json",
                  success: function(data){
                    console.log(data);
                    //document.getElementById("status").innerHTML = data.responseText;
                  },
                  error: function(data){
                    console.log(data);
                    //document.getElementById("status").innerHTML = data.responseText;
                  }
                });
                var date2 = [];
               
                for(var x = 1 ; x<= 5; x++){
                  for(var y= 1; y<=7; y++){

                      date2[x-1] = $(".fc-day-grid .fc-week:nth-child("+(x)+") .fc-content-skeleton thead td:nth-child("+(y)+")").attr("data-date");
                      console.log(date2[x-1]);
                      var wa = $(".fc-day-grid .fc-week:nth-child("+(x)+") .fc-content-skeleton thead td:nth-child("+(y)+")").append("<span class='"+city+"-"+date2[x-1]+"'></span>");
                      
                      $.ajax({
                        url: "http://lol-haha.com/LiquidoAPI/vessel/count/"+city+"/"+date2[x-1]+"",
                        type: "get",
                        dataType: "json",
                        success: function(data){
                          console.log(data);
                          console.log($(".fc-content-skeleton thead td > span."+city+"-2016-04-24").append());
                        }
                    });
                  }

                }

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

  function changeCity(){
    if(city == "Makati"){
      city = "Zamboanga";
      infoWindow.setContent(city);

      pos = {
        lat: 6.871892,
        lng: 122.0581075
      };

      map.setCenter(pos);
      marker.setPosition(pos);
    }
    else if(city == "Zamboanga"){
      city = "General Santos";
      infoWindow.setContent(city);

      pos = {
        lat: 5.7922,
        lng: 125.0971
      };

      map.setCenter(pos);
      marker.setPosition(pos); 
    }
    else{
      city = "Makati";
      infoWindow.setContent(city);

      pos = {
        lat: 14.5474,
        lng: 121.02401
      };

      map.setCenter(pos);
      marker.setPosition(pos);  
    }
    var date = new Date();
    date = formatDate(date);
    var data = {
      vessel_id: 1,
      date: date,
      location: city
    };

    $.ajax({
      url: "http://lol-haha.com/LiquidoAPI/tracks",
      type: "post",
      data: data,
      dataType: "json",
      success: function(data){
        console.log(data);
      },
      error: function(data){
        console.log(data);
      }
    });
  }
