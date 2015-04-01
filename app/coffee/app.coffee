'use strict'

app = angular.module 'app', ["ngResource", "ngRoute"]

app.config ($routeProvider, $locationProvider) ->
  $routeProvider.when '/',
      templateUrl: '/partials/home'
      controller: 'indexCtrl'
    .otherwise
      redirectTo: '/'

  $locationProvider.html5Mode true