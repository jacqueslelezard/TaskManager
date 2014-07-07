angular.module('app').directive 'widthresize',
    ($parse, $firebase) ->
        restrict: 'A'
        link: (scope, elem, attrs, categories) ->
            #catSize = $parse(attrs['widthresize'])(scope)
            #console.log $parse(attrs['widthresize'])(scope)
            categoriesRef = new Firebase("https://kanbangt.firebaseio.com/categories")
            categories = $firebase(categoriesRef)
            catArray=categories.$getIndex()
            catSize= catArray.length
            console.log catSize
            elem[0].style.width = (100/(catSize)-3)+'%'