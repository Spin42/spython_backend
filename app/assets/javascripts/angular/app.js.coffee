"use strict"

@app = angular.module "spython", ["ngRoute", "spython.services"]

@app.config ["$routeProvider", "$httpProvider", ($routeProvider, $httpProvider) ->
  $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';

  $routeProvider
    .when "/",
      controller: "StatsController"
      resolve:
        stats: ["StatisticsLoader", (StatisticsLoader) ->
          StatisticsLoader()
        ]
      templateUrl: "/partials/stats"

   .otherwise redirectTo: "/"

]