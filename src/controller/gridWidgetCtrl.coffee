nunki.controller 'gridWidgetCtrl', ($scope, $http, ngDialog) ->
    image = []
    embedLink = []
    authorLink = []

    $http.get('Json/data_formatted.json')
    .success (data) ->
      #$scope.results = data.results.thumbImageLink
        angular.forEach data.results, (result, key) ->
          image     .push (result.thumbImageLink)
          embedLink .push (result.platformMediaLink)
          authorLink.push (result.author)
          $scope.tiles = buildGridModel(
            image: ''
            Link: '',
            image, embedLink, authorLink)
          return

    $scope.embedOpen = (author) ->
      $scope.pseudo = author
      ngDialog.open
          template:   'templates/instaEmbed.html'
          controller: 'instagramCtrl'
          scope:       $scope

    buildGridModel = (tileTmpl, image, EmbedLink, AuthorLink) ->
      it = null
      results = []
      j = 0
      while j < 9
        it = angular.extend({}, tileTmpl)
        it.image = image[j]
        it.Link  = EmbedLink[j]
        it.author  = AuthorLink[j]

        it.span =
          row: 1
          col: 1
        switch j + 1
          when 1
            it.span.row = it.span.col = 2
          when 4
            it.span.col = it.span.row = 2
          when 5
            it.span.row = it.span.col = 2
        results.push it
        j++
      results
