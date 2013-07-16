function initialize() {
  var myLatlng = new google.maps.LatLng(gon.merchant.latitude, gon.merchant.longitude); //Empire State Building
  var mapOptions = {
    zoom: 13,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("merchant-google-map"), mapOptions);

  var marker = new google.maps.Marker({
    position : myLatlng,
    map: map,
    title: gon.merchant.bname
  });
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAsykPdvWSTP8uKVQCv27poiNwimwVQ7ds&callback=initialize&sensor=false";
  document.body.appendChild(script);
}

// function addMarker(latitude, longitude, title) {
//   var myLatLng = new google.maps.LatLng(latitude, longitude);

//   var marker = new google.maps.Marker({
//     position : myLatLng,
//     map: map,
//     title: title
//   });

//   var infowindow =  new google.maps.InfoWindow({
//     content: title,
//     map: map,
//     position: myLatLng
//   });

//   console.log(marker);
//   console.log(marker.title);

//   marker.setMap(map);
// }

window.onload = loadScript;
