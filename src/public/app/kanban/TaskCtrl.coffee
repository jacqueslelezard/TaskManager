angular.module('app').controller 'TaskCtrl',
    ($scope, Tasks, Categories) ->

        $scope.newTask = ""
        $scope.newTaskCategory = ""
        $scope.tasks = Tasks.get()
        $scope.categories = Categories.getCat()

        $scope.add = (newTask, newTaskCategory, newTaskPriority) ->
            if(newTask)
                Tasks.add(newTask, newTaskCategory, newTaskPriority)
            $scope.tasks = Tasks.get()
            $scope.newTask= ""

        $scope.addCat = (newCategory, categoryPriority) ->
            if(newCategory)
                Categories.addCat(newCategory, categoryPriority)
            $scope.categories = Categories.getCat()
            $scope.newCategory= ""

        $scope.delete = (currenttask) ->
            Tasks.delete(currenttask)
            #$scope.tasks = Tasks.get()

        $scope.deleteCat = (currentCat) ->
            Categories.deleteCat(currentCat)

        $scope.updateCat = (currenttask, newcategory) ->
            Tasks.updateCat(currenttask, newcategory)
            #$scope.tasks = Tasks.get()

        $scope.updatePrio = (currenttask, newprio) ->
            Tasks.updatePrio(currenttask, newprio)
            $scope.tasks = Tasks.get()
            console.log("mmh oké...")

        $scope.drop = (dragItem, category) ->
            dragItem.category = category
            #$scope.newTask=""
            console.log("category changed !")
