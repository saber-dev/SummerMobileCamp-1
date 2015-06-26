'use strict';
var nunki;

nunki = angular.module('nunki', ['ngRoute', 'ngMaterial', 'restangular', 'ngSanitize', 'ngDialog']);

nunki.config(["$routeProvider", "$httpProvider", "$mdIconProvider", function($routeProvider, $httpProvider, $mdIconProvider) {
  $routeProvider.when('/', {
    templateUrl: 'index.html'
  });
  return $mdIconProvider.iconSet('avatar', 'icons/avatar-icons.svg', 128);
}]);

nunki.controller("instaEmbedCtrl", ["$scope", "$http", "ngDialog", function($scope, $http, ngDialog) {
  var buildGridModel;
  $http.get('Json/data_formatted.json').success(function(data) {
    return $scope.results = data.results;
  });
  $scope.embedOpen = function(author) {
    $scope.pseudo = author;
    return ngDialog.open({
      template: 'templates/instaEmbed.html',
      controller: 'instagramCtrl',
      scope: $scope
    });
  };
  return buildGridModel = function(tileTmpl) {
    var it, j, results;
    it = null;
    results = [];
    j = 0;
    while (j < 11) {
      it = angular.extend({}, tileTmpl);
      it.title = it.title + j + 1;
      it.span = {
        row: 1,
        col: 1
      };
      switch (j + 1) {
        case 1:
          it.background = 'red';
          it.span.row = it.span.col = 2;
          break;
        case 2:
          it.background = 'green';
          break;
        case 3:
          it.background = 'darkBlue';
          break;
        case 4:
          it.background = 'blue';
          it.span.col = 2;
          break;
        case 5:
          it.background = 'yellow';
          it.span.row = it.span.col = 2;
          break;
        case 6:
          it.background = 'pink';
          break;
        case 7:
          it.background = 'darkBlue';
          break;
        case 8:
          it.background = 'purple';
          break;
        case 9:
          it.background = 'deepBlue';
          break;
        case 10:
          it.background = 'lightPurple';
          break;
        case 11:
          it.background = 'yellow';
      }
      results.push(it);
      j++;
    }
    results;
    return $scope.tiles = buildGridModel({
      icon: 'avatar:svg-',
      title: 'Svg-',
      background: ''
    });
  };
}]);

nunki.controller("instagramCtrl", ["$scope", "$http", "$sce", "$timeout", function($scope, $http, $sce, $timeout) {
  var backup, test;
  test = 'http://api.instagram.com/publicapi/oembed/?url=' + $scope.$parent.pseudo + '&omitscript=true';
  backup = 'http://api.instagram.com/publicapi/oembed/?url=http://instagr.am/p/fA9uwTtkSN/';
  console.log(test);
  return $http.get(test).success(function(data) {
    $timeout(function() {
      return window.instgrm.Embeds.process();
    });
    return $scope.html = $sce.trustAsHtml(data.html);
  }).error(function(error) {
    return console.log("cannot fetch data");
  });
}]);

nunki.controller('gridListDemoCtrl', ["$scope", function($scope) {
  var buildGridModel;
  buildGridModel = function(tileTmpl) {
    var it, j, results;
    it = null;
    results = [];
    j = 0;
    while (j < 10) {
      it = angular.extend({}, tileTmpl);
      it.icon = it.icon + (j + 1);
      it.title = it.title + (j + 1);
      it.span = {
        row: 1,
        col: 1
      };
      switch (j + 1) {
        case 1:
          it.background = "http://lorempixel.com/400/200";
          it.span.row = it.span.col = 2;
          break;
        case 2:
          it.background = 'http://lorempixel.com/400/200';
          break;
        case 3:
          it.background = 'http://lorempixel.com/400/200';
          break;
        case 4:
          it.background = 'http://lorempixel.com/400/200';
          it.span.col = 2;
          break;
        case 5:
          it.background = 'http://lorempixel.com/400/200';
          it.span.row = it.span.col = 2;
          break;
        case 6:
          it.background = 'http://lorempixel.com/400/200';
          break;
        case 7:
          it.background = 'http://lorempixel.com/400/200';
          break;
        case 8:
          it.background = 'http://lorempixel.com/400/200';
          break;
        case 9:
          it.background = 'http://lorempixel.com/400/200';
          break;
        case 10:
          it.background = 'http://lorempixel.com/400/200';
          break;
        case 11:
          it.background = 'http://lorempixel.com/400/200';
      }
      results.push(it);
      j++;
    }
    return results;
  };
  this.tiles = buildGridModel({
    icon: 'avatar:svg-',
    title: 'svg-',
    background: ''
  });
}]);
