nunki.controller 'gridListDemoCtrl', ($scope) ->

    buildGridModel = (tileTmpl) ->
      it = null
      results = []
      j = 0
      while j < 10
        it = angular.extend({}, tileTmpl)
        it.icon = it.icon + (j + 1)
        it.title = it.title + (j + 1)
        it.span =
          row: 1
          col: 1
        switch j + 1
          when 1
#            it.background = "http://lorempixel.com/400/200"
            it.span.row = it.span.col = 2
          when 2
            it.background = 'http://lorempixel.com/400/200'
          when 3
            it.background = 'http://lorempixel.com/400/200'
          when 4
            it.background = 'http://lorempixel.com/400/200'
            it.span.col = 2
          when 5
            it.background = 'http://lorempixel.com/400/200'
            it.span.row = it.span.col = 2
          when 6
            it.background = 'http://lorempixel.com/400/200'
          when 7
            it.background = 'http://lorempixel.com/400/200'
          when 8
            it.background = 'http://lorempixel.com/400/200'
          when 9
            it.background = 'http://lorempixel.com/400/200'
          when 10
            it.background = 'http://lorempixel.com/400/200'
          when 11
            it.background = 'http://lorempixel.com/400/200'
        results.push it
        j++
      results

    @tiles = buildGridModel(
      icon: 'avatar:svg-'
      title: 'svg-'
      background: '')
    return