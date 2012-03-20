      var venues=null;
      function loadMapVenues(event){
        if (event==null){//if is the first time loading the event
          //confirm html5 function for geolocation
          
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
            var infowindow = new google.maps.InfoWindow();

            for (i = 0; i<venues.length; i++){

                  var contentString = '<div id="info">'+
                    '<div id="siteNotice">'+
                    '</div>'+
                    '<h1 id="firstHeading" class="firstHeading">'+venues[i].tittle+'</h1>'+
                    '<div id="bodyContent">'+
                    '<p>'+venues[i].address+'</p>'+
                    '</div>'+
                    '</div>';

                  var marker = new google.maps.Marker({
                  position: new google.maps.LatLng(venues[i].lat,venues[i].lng),
                  map: map,
                  icon: venues[i].image,
                  animation: google.maps.AnimationDROP,
                  title: venues[i].title,
                  info: contentString
                });
               

                google.maps.event.addListener(marker, 'mouseover', function() {
                  infowindow.setContent(this.info);
                  infowindow.open(map,this);
                });

                google.maps.event.addListener(marker, 'mouseout', function() {
                  infowindow.close();
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
      function meh(position){
        lat= position.coords.latitude;
        lng= position.coords.longitude;

        initialize(lat, lng);
      }

      function bu(error){
        lat = 10.98940092958238;
        lng = -74.7999849319458;
        initialize(lat, lng);
      }

      $(document).ready(function(){

        // //initialize();
        // var event=null;
        // loadMapVenues(event);
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(meh,bu);
            
        } else {
          alert('Geolocation not supported');
        }
        
      });