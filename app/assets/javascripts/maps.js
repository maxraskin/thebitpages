function initialize() {
  var myLatlng = (gon.center === undefined) ? new google.maps.LatLng(gon.merchant.latitude, gon.merchant.longitude) : new google.maps.LatLng(gon.center[0], gon.center[1])

  var mapOptions = {
    zoom: 15,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("merchant-google-map"), mapOptions);



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

function addMarker(latitude, longitude, letter, url, title) {
  // var map = new google.maps.Map(document.getElementById("merchant-google-map"));
  var myLatlng = new google.maps.LatLng(latitude, longitude);

  var marker = new google.maps.Marker({
    position : myLatlng,
    map: map,
    url: url,
    icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|F66F66|000000'
  });

  google.maps.event.addListener(marker, 'click', function() {
    window.location.href = this.url;
    console.log("sup");
  });

  marker.setMap(map);
}

function populateMap() {
  _.each(gon.merchants, function(merchant) {
    var url = "/merchants/" + merchant.id;
    var title = merchant.bname;
    addMarker(merchant.latitude, merchant.longitude, merchant.bname, url, title);
  });
}

function bitcoinCode(qrcode) {
  var url = "http://chart.apis.google.com/chart?cht=qr&chs=150x150&chl="+qrcode;
  document.getElementById("bitcoin-id").src = url;
  return url;
}

// $(document).ready(function() {
//   $("#new-zip-code-button").click(function() {
//     gon.zip_code = $("new-zip-code").val();
//     populateMap();
//   });
// })
