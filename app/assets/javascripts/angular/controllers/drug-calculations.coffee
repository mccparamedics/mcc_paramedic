angular.module('drugCalculations', [])
  .controller('DrugCalculationCtrl', ['$scope', '$templateCache', ($scope, $templateCache) ->
    categories = ['ratio', 'percent', 'units']
    masses = ['mg', 'mcg', 'g', 'kg']
    volumes = ['ml', 'l']
    getValue = () ->
      value = _.random(1, 500)
      category = categories[_.random(0, categories.length-1)]
      if category == 'units'
        mass = masses[_.random(0, masses.length-1)]
        volume = volumes[_.random(0, volumes.length-1)]
        value = value + ' ' + mass + '/' + volume
      if category == 'percent'
        value = value + '%'
      if category == 'ratio'
        value = '1:' + value
      value

    $scope.refresh = () ->
      $scope.valueGroups = []
      _.each _.range(4), () ->
        valueGroup = []
        _.each _.range(4), () ->
          valueGroup.push getValue()
        $scope.valueGroups.push valueGroup
    $scope.refresh()
  ])