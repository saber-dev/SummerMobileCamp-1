nunki.controller 'gridListDemoCtrl', ($scope, $http, ngDialog) ->
    image = []
    embedLink = []

    $scope.embedOpen = (author) ->
      $scope.pseudo = author
      ngDialog.open
          template:   'templates/instaEmbed.html'
          controller: 'instagramCtrl'
          scope:       $scope

    buildGridModel = (tileTmpl, image, EmbedLink) ->
      it = null
      results = []
      j = 0
      while j < 10
        it = angular.extend({}, tileTmpl)
        it.icon = it.icon + (j + 1)
        it.title = it.title + (j + 1)
        it.image = image[j]
        it.Link = EmbedLink[j]
        #it.background = it.background + (image[j])

        it.span =
          row: 1
          col: 1
        switch j + 1
          when 1
            it.background = 'nigga'
            it.span.row = it.span.col = 2
          when 2
            it.background = 'gray'
          when 3
            it.background = 'green'
          when 4
            it.background = 'blue'
            it.span.col = 2
          when 5
            it.background = 'darkBlue'
            it.span.row = it.span.col = 2
          when 6
            it.background = 'purple'
          when 7
            it.background = 'red'
          when 8
            it.background = 'pink'
          when 9
            it.background = 'lightPurple'
          when 10
            it.background = 'deepBlue'
          when 11
            it.background = 'yellow'
        results.push it
        j++
      results

    $http.get('Json/data_formatted.json')
    .success (data) ->
      #$scope.results = data.results.thumbImageLink
        angular.forEach data.results, (result, key) ->
          image.push (result.thumbImageLink)
          embedLink.push (result.platformMediaLink)
          #console.log image
          $scope.tiles = buildGridModel(
            icon: 'avatar:svg-'
            title: 'svg-'
            background: ''
            image: ''
            Link: '' , image, embedLink)
          return
