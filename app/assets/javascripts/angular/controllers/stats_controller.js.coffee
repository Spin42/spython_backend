"use strict"

@app.controller "StatsController", ["$scope", "stats", "Map", ($scope, stats, Map) ->
  $scope.statistics = stats
  $scope.map = Map("map-canvas", stats.skin_locations)
]