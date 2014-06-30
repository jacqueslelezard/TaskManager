angular.module('app').factory 'Categories',
    ->

        categories = ['todo', 'inprogress', 'done']

        return {

            getCat: ->
                return categories

            addCat: (newCategory) ->
                categories.push(newCategory)

            deleteCat: (currentCat) ->
                categories.splice(categories.indexOf(currentCat), 1)

        }