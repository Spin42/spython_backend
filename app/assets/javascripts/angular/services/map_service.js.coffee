"use strict"

@services ?= angular.module("spython.services", [])

@services.factory "Map", ->
  (mapId, markerLocations) ->
    map =
      markers: []
      map: null
      bounds: null

      _generateMapOptions: ->
        latitude = 50
        longitude = 4
        zoom: 13
        center: new google.maps.LatLng(latitude, longitude)
        mapTypeId: google.maps.MapTypeId.TERRAIN

      _initialize: ->
        mapOptions = @_generateMapOptions()
        @map = new google.maps.Map(document.getElementById(mapId), mapOptions)
        @bounds = new google.maps.LatLngBounds();

      addMarkers: (markerLocations) ->
        for location in markerLocations
          latLng = location.split(";")
          @_addMarker(latLng[0], latLng[1])

      _addMarker: (latitude, longitude) ->
        marker = new google.maps.Marker
          position: new google.maps.LatLng(latitude, longitude)
          map: @map
          zIndex: 1
        @markers.push marker
        @bounds.extend(marker.position)

      fitMapToBounds: ->
        @map.fitBounds(@bounds)

    map._initialize()
    map.addMarkers(markerLocations)
    map.fitMapToBounds()
    map

