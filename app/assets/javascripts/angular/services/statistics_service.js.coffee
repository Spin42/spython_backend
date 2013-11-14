"use strict"

@services ?= angular.module("spython.services", [])

@services.factory "Statistics", ["$http", ($http) ->
  baseUrl = "#{window.API_URL}"
  statisticsUrl = "#{baseUrl}/statistics"

  query: ->
    $http.get statisticsUrl
]

@services.factory "StatisticsLoader", ["Statistics", "$q", (Statistics, $q) ->
  ->
    delay = $q.defer()
    Statistics.query()
      .success (statistics) ->
        delay.resolve statistics
      .error (err) ->
        delay.reject "Unable to fetch statistics: #{err}"

    delay.promise
]