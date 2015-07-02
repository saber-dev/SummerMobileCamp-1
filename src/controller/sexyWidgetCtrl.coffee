
nunki.controller 'sexyWidgetCtrl', ($scope) ->
    $scope.results = $scope.$parent.results
    $scope.hide = ->
      $mdDialog.hide()
      return

    $scope.cancel = ->
      $mdDialog.cancel()
      return

    $scope.answer = (answer) ->
      $mdDialog.hide answer
      return
    return
