<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta charset="utf-8">
  <title>Pizza Weather</title>
  <style>
    
    #map {
      height: 100%;
    }
    
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
    }
  
  </style>
</head>
<body>
<div id="map"></div>
<script>

  function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4.9,
      center: {lat: 55, lng:  -125}
    });
    setMarkers(map);
  }

  // Data for the markers consisting of a name, a LatLng and a zIndex for the
  // order in which these markers should display on top of each other.
  var branches = [
    ['Fort Nelson', 58.8, -122.69, 7],
    ['Dease Lake', 58.437, -130.007, 6],
    ['Terrace', 54.509, -128.606, 5],
    ['Prince George', 53.916, -122.769, 4],
    ['Whistler', 50.116, -122.960, 3],
    ['Revelstoke', 51.004, -118.205, 2],
    ['Creston', 49.091, -116.553, 1]
  ];

  let cities = [
    '<iframe title="Environment Canada Weather" width="150px" height="100px" src="https://weather.gc.ca/wxlink/wxlink.html?cityCode=bc-83&amp;lang=e" allowtransparency="true" frameborder="0"></iframe>',
    '<iframe title="Environment Canada Weather" width="150px" height="100px" src="https://weather.gc.ca/wxlink/wxlink.html?cityCode=bc-14&amp;lang=e" allowtransparency="true" frameborder="0"></iframe>',
    '<iframe title="Environment Canada Weather" width="150px" height="100px" src="https://weather.gc.ca/wxlink/wxlink.html?cityCode=bc-80&amp;lang=e" allowtransparency="true" frameborder="0"></iframe>',
    '<iframe title="Environment Canada Weather" width="150px" height="100px" src="https://weather.gc.ca/wxlink/wxlink.html?cityCode=bc-79&amp;lang=e" allowtransparency="true" frameborder="0"></iframe>',
    '<iframe title="Environment Canada Weather" width="150px" height="100px" src="https://weather.gc.ca/wxlink/wxlink.html?cityCode=bc-86&amp;lang=e" allowtransparency="true" frameborder="0"></iframe>',
    '<iframe title="Environment Canada Weather" width="150px" height="100px" src="https://weather.gc.ca/wxlink/wxlink.html?cityCode=bc-65&amp;lang=e" allowtransparency="true" frameborder="0"></iframe>',
    '<iframe title="Environment Canada Weather" width="150px" height="100px" src="https://weather.gc.ca/wxlink/wxlink.html?cityCode=bc-26&amp;lang=e" allowtransparency="true" frameborder="0"></iframe>'
  ];



  function setMarkers(map) {
    // Adds markers to the map.

    // Marker sizes are expressed as a Size of X,Y where the origin of the image
    // (0,0) is located in the top left of the image.

    // Origins, anchor positions and coordinates of the marker increase in the X
    // direction to the right and in the Y direction down.
    var image = {
      url: 'https://i.imgur.com/OQO9eGK.png',
      size: new google.maps.Size(20, 20),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(0, 20)
    };

    // Shapes define the clickable region of the icon. The type defines an HTML
    // <area> element 'poly' which traces out a polygon as a series of X,Y points.
    // The final coordinate closes the poly by connecting to the first coordinate.
    var shape = {
      coords: [1, 1, 1, 20, 18, 20, 18, 1],
      type: 'poly'
    };

    for (var i = 0; i < branches.length; i++) {
      var branch = branches[i];
      var marker = new google.maps.Marker({
        position: {lat: branch[1], lng: branch[2]},
        map: map,
        icon: image,
        shape: shape,
        title: branch[0],
        zIndex: branch[3],
        optimized: false,
      });

      var infowindow = new google.maps.InfoWindow();

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(cities[i]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  }

</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY_HERE&callback=initMap">
</script>
</body>
</html>
