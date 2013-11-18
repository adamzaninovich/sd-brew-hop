class Map
  constructor: (selector, center, zoom=16) ->
    @canvas = jQuery selector
    @map = new google.maps.Map @canvas[0],
      center: new google.maps.LatLng center.latitude, center.longitude
      zoom: zoom
      mapTypeId: google.maps.MapTypeId.ROADMAP
      scrollwheel: false
    @markers = []

  addMarker: (location, title='') ->
    marker = new google.maps.Marker
      position: new google.maps.LatLng location.latitude, location.longitude
      map: @map
      title: title
    @markers.push marker

window.Map = Map
