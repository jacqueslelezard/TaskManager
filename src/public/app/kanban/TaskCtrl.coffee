angular.module('app').controller 'TaskCtrl',
    ($scope, Categories, $firebase) ->
        tasksRef = new Firebase("https://kanbangt.firebaseio.com/tasks")
        categoriesRef = new Firebase("https://kanbangt.firebaseio.com/categories")
        $scope.newTask = ""
        $scope.newTaskCategory = ""
        $scope.tasks = tasks = $firebase(tasksRef)
        $scope.categories = categories = $firebase(categoriesRef)
        #$scope.categories = Categories.getCat()

        $scope.add = (newTask, newTaskCategory, newTaskPriority) ->
            newTaskPriority = 2 if !newTaskPriority
            tasks.$add({name: newTask, category: newTaskCategory, priority: newTaskPriority}) if newTask
            $scope.newTask = ""

        $scope.addCat = (newCategory) ->
            defaultPriority = categories.length+1
            categories.$add({name: newCategory, priority: defaultPriority}) if newCategory
            $scope.newCategory= ""

        $scope.delete = (currenttask) ->
            tasks.$remove(currenttask.$id)
            #$scope.tasks = Tasks.get()

        $scope.deleteCat = (currentCat) ->
            console.log currentCat
            categories.$remove(currentCat.$id)
            #tasks.$remove(currenttask.$id)
            #tasks.forEach (task) ->
            #    console.log task
            #    if task.category== currentCat
            #        tasks.$remove(task.$id)

        # $scope.updateCat = (currenttask, newcategory) ->
        #     currenttask.category = newcategory
        #     console.log currenttask
        #     tasks.$set(currenttask)
        #     #$scope.tasks = Tasks.get()

        $scope.updatePrio = (currentTask, newPrio) ->
            #Tasks.updatePrio(currenttask, newprio)
            #tasks.$update(currentTask.$id, currentTask)
            currentTask.priority = newPrio
            tasks.$child(currentTask.$id).$update(currentTask)
            #tasks.$set({name: currentTask, category: newTaskCategory, priority: newprio})
            #tasks.currentTask.$set({name: currentTask, priority: newprio})
            #TaskToUpdate = new Firebase('https://kanbangt.firebaseio.com/tasks/'+currentTask.$id+'/'+currentTask+'/')

            #Modify the 'first' and 'last' children, but leave other data at fredNameRef unchanged
            #tasks.(currentTask.$id).set({name: currentTask, priority: newprio})

        $scope.updateContent = (currentTask, newContent) ->
            #console.log currentTask.$id
            currentTask.name = newContent
            tasks.$child(currentTask.$id).$update(currentTask)
        $scope.updateLiveContent = (currentTask, newContent) ->
            #console.log currentTask.$id
            currentTask.name = newContent

        $scope.drop = (dragItem, category) ->
            dragItem.category = category
            tasks.$child(dragItem.$id).$update(dragItem)

