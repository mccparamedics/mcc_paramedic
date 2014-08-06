angular.module('directives.drugCalculation', [])
  .directive('drugCalculation', () ->
    restrict: 'E'
    scope:
      value: '=ngModel'
    replace: 'true'
    templateUrl: 'directives/drugCalculation.html'
    link: (scope, elem, attrs) ->
      scope.$watch 'answer', (newValue, oldValue) ->
        return if angular.equals(newValue, oldValue)
        x = parseFloat(pharma(scope.value).toBaseConcentration())
        correctValue = Math.round(x * 100) / 100
        scope.correct = correctValue == parseFloat(scope.answer)
        if scope.answer != parseFloat(scope.answer).toString()
          scope.correct = false
  )