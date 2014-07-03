angular.module('app').factory 'Categories',
    ->

        #categories = ['todo', 'inprogress', 'done']
        #categories = [{name:'todo', priority:1}, {name:'inprogress', priority:2}, {name:'done', priority:3}]

        return {

            getCat: ->
                return categories

            addCat: (newCategory) ->
                priority = categories.length+1
                console.log priority
                if newCategory
                    categories.push({name:newCategory, priority: priority})

            deleteCat: (currentCat) ->
                categories.splice(categories.indexOf(currentCat), 1)

        }