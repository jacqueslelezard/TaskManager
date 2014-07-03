angular.module('app').directive 'widthresize',
    ($parse) ->
        restrict: 'A'
        link: (scope, elem, attrs) ->
            catSize = $parse(attrs['widthresize'])(scope)
            console.log Object.keys catSize
            elem[0].style.witdth = (100/(catSize)-3)+'%'