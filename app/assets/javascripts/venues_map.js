      var venues=null;
      function loadMapVenues(event){
        if (event==null){//if is the first time loading the event
          //confirm html5 function for geolocation
          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition();
            lat= position.coords.latitude;
            lng= position.coords.longitude;
          } else {
            alert('Geolocation not supported');
          }
        }else{
          lat = event.latLng.lat();
          lng = event.latLng.lng();  
        }
      }
        //get Json from controller
        

      function initialize(lat,lng) {
        //set lat and lng
        if (lat==undefined||lng==undefined){
           Lat = 10.98940092958238;
           Long = -74.7999849319458;
        }else{
           Lat = lat;
           Long = lng;
        }

        // $.getJSON('find',{
        //     lat:Lat,
        //     lng: Long,
        //     refresh: "1"
        //   }, function(data){
        //     alert("hello :D "+data);
        //     venues=data;
        // }); 

        //map options
        var myOptions = {
          center: new google.maps.LatLng(Lat, Long),
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        //create the map
        var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
        //set event forrefresh venues
        google.maps.event.addListener(map, 'click', 
          function(event) {
            lat = event.latLng.lat();
            lng = event.latLng.lng(); 
            initialize(lat,lng);
          });

        $.getJSON('find',{
            lat:lat,
            lng: lng,
            refresh: "1"
          }, function(data){
            venues=data.markups;

            for (i = 0; i<venues.length; i++){
              var marker = new google.maps.Marker({
                  position: new google.maps.LatLng(venues[i].lat,venues[i].lng),
                  map: map,
                  //icon: val["icon"],
                  title: venues[i].title
                });
               

            }
            
            // if (venues!=null){
            //   $.each(venues, function(val){
            //     var marker = new google.maps.Marker({
            //       position: new google.maps.LatLng(val["lat"],val["lng"]),
            //       map: map,
            //       //icon: val["icon"],
            //       title: val["title"]
            //     });
            //   });  
            // }
        }); 
      
        //set markups venues
        
        
        
      }
      $(document).ready(function(){

        // //initialize();
        // var event=null;
        // loadMapVenues(event);
        initialize();
      });