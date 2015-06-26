nunki.controller "instagramCtrl", ($scope, $http, $sce, $timeout) ->
  test = 'http://api.instagram.com/publicapi/oembed/?url=' + $scope.$parent.pseudo + '&omitscript=true'
  backup = 'http://api.instagram.com/publicapi/oembed/?url=http://instagr.am/p/fA9uwTtkSN/'
  console.log test
  $http.get(test)
    .success (data) ->
      $timeout ->
        window.instgrm.Embeds.process()

      #$scope.mahefa = $scope.$parent.pseudo
      $scope.html   = $sce.trustAsHtml(data.html)
      #$scope.test   = $sce.trustAsHtml('<h1>hello</h1>')

    .error (error) ->
      console.log "cannot fetch data"
