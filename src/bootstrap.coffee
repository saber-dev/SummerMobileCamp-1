'use strict'

nunki = angular.module 'nunki', [
  'ngRoute'
  'ngMaterial'
  'restangular'
  'ngSanitize'
  'ngDialog'
]


# les routes pour le site internet, a modifier si besoin
nunki.config ($routeProvider, $httpProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'index.html'

  #$httpProvider.defaults.useXDomain = true;
  #$httpProvider.defaults.withCredentials = true;
  #delete $httpProvider.defaults.headers.common["X-Requested-With"]
  #$httpProvider.defaults.headers.common['Access-Control-Allow-Origin'] = 'nunkiWidget.fr'
  #$httpProvider.defaults.headers.common["Accept"] = "application/json"
  #$httpProvider.defaults.headers.common["Content-Type"] = "application/json"
  #$httpProvider.defaults.headers.common["Access-Control-Request-Method"] = "GET"
