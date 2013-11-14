"use strict"

@app.controller "StatsController", ["$scope", "stats", ($scope, stats) ->
  $scope.statistics = stats
]