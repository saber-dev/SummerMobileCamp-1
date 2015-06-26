nunki.controller "instaEmbedCtrl", ($scope, $http, ngDialog) ->
    $http.get('Json/data_formatted.json')
    .success (data) ->
        $scope.results = data.results

    $scope.embedOpen = (author) ->
      $scope.pseudo = author
      ngDialog.open
          template:   'templates/instaEmbed.html'
          controller: 'instagramCtrl'
          scope:       $scope
