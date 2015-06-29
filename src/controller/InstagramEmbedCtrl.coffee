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

    buildGridModel = (tileTmpl) ->
      it = null
      results = []
      j = 0
      while j < 11
        it = angular.extend({}, tileTmpl)
        it.title = it.title + j + 1
        it.span =
          row: 1
          col: 1
        switch j + 1
          when 1
            it.background = 'nigga'
            it.span.row = it.span.col = 2
          when 2
            it.background = 'green'
          when 3
            it.background = 'darkBlue'
          when 4
            it.background = 'blue'
            it.span.col = 2
          when 5
            it.background = 'yellow'
            it.span.row = it.span.col = 2
          when 6
            it.background = 'pink'
          when 7
            it.background = 'darkBlue'
          when 8
            it.background = 'purple'
          when 9
            it.background = 'deepBlue'
          when 10
            it.background = 'lightPurple'
          when 11
            it.background = 'yellow'
        results.push it
        j++
      results

      $scope.tiles = buildGridModel(
        icon: 'avatar:svg-'
        title: 'Svg-'
        background: '')
