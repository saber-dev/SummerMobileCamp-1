nunki.controller 'swipeCtrl', ($scope) ->
  $scope.onLeft = (ev) ->
    alert('left')
  $scope.onRight = (ev) ->
    alert('right')
