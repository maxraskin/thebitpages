function initialize() {
  var myLatlng = new google.maps.LatLng(gon.merchant.latitude, gon.merchant.longitude);
  // var myLatlng = new google.maps.LatLng(40.7484, -73.947);

  var mapOptions = {
    zoom: 13,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("merchant-google-map"), mapOptions);

  var marker = new google.maps.Marker({
    position : myLatlng,
    map: map,
    title: gon.merchant.bname
  });
}

function loadScript(populateCheck) {
  var script = document.createElement("script");
  script.type = "text/javascript";
  
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAsykPdvWSTP8uKVQCv27poiNwimwVQ7ds&callback=initializeAndPopulate&sensor=false";
  document.body.appendChild(script);
}

function initializeAndPopulate() {
  initialize();
  populateMap();
}

function addMarker(latitude, longitude, title) {
  // var map = new google.maps.Map(document.getElementById("merchant-google-map"));
  var myLatlng = new google.maps.LatLng(latitude, longitude);

  var marker = new google.maps.Marker({
    position : myLatlng,
    map: map,
    title: title
  });

  marker.setMap(map);
}

function populateMap() {
  _.each(gon.merchant_array, function(merchant) {
    console.log(merchant);
    addMarker(merchant.latitude, merchant.longitude, merchant.bname);
  });
}
