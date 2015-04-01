'use strict';
var app;

app = angular.module('app', ["ngResource", "ngRoute"]);

app.config(function($routeProvider, $locationProvider) {
  $routeProvider.when('/', {
    templateUrl: '/partials/home',
    controller: 'indexCtrl'
  }).otherwise({
    redirectTo: '/'
  });
  return $locationProvider.html5Mode(true);
});
