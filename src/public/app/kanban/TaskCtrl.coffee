angular.module('app').controller 'TaskCtrl',
    ($scope, Categories, $firebase, $filter) ->
        tasksRef = new Firebase("https://kanbangt.firebaseio.com/tasks")
        categoriesRef = new Firebase("https://kanbangt.firebaseio.com/categories")
        $scope.newTask = ""
        $scope.newTaskCategory = ""
        $scope.tasks = tasks = $firebase(tasksRef)
        $scope.categories = categories = $firebase(categoriesRef)
        console.log categories
        console.log tasks
        #window.cat = categories
        #$scope.categories = Categories.getCat()

        $scope.add = (newTask, newTaskCategory, newTaskPriority) ->
            newTaskPriority = 2 if !newTaskPriority
            tasks.$add({name: newTask, category: newTaskCategory.name, priority: newTaskPriority}) if newTask
            $scope.newTask = ""

        $scope.addCat = (newCategory) ->
            if newCategory
                categories.$add({name: newCategory})
            $scope.newCategory= ""
            catArray=categories.$getIndex()
            catSize= catArray.length
            console.log catSize

        $scope.delete = (currenttask) ->
            tasks.$remove(currenttask.$id)

        $scope.deleteCat = (currentCat) ->
            #if the currentCat isn't the default category
            if currentCat.name !=  "base"
            #filter to activate array behaviour
                firebaseTasks = $filter('orderByPriority')(tasks)
            # Select task in the category
                tasksCat = $filter('filter')(firebaseTasks, { category: currentCat.name })
                categories.$remove(currentCat.$id)

                for task in tasksCat
                    console.log(task.name+" move to base category")
                    task.category= 'base'
                    #tasks.$child(task.$id).$update(task)
                    tasks.$child(task.$id).$update(task)

        $scope.updatePrio = (currentTask, newPrio) ->
            #Tasks.updatePrio(currenttask, newprio)
            #tasks.$update(currentTask.$id, currentTask)
            currentTask.priority = newPrio
            #tasks.$child(currentTask.$id).$update(currentTask)
            tasks.$update(currentTask)
            #tasks.$set({name: currentTask, category: newTaskCategory, priority: newprio})
            #tasks.currentTask.$set({name: currentTask, priority: newprio})
            #TaskToUpdate = new Firebase('https://kanbangt.firebaseio.com/tasks/'+currentTask.$id+'/'+currentTask+'/')

            #Modify the 'first' and 'last' children, but leave other data at fredNameRef unchanged
            #tasks.(currentTask.$id).set({name: currentTask, priority: newprio})

        $scope.updateContent = (currentTask, newContent) ->
            currentTask.name = newContent
            #tasks.$update(currentTask)
            tasks.$update(currentTask)

        $scope.updateLiveContent = (currentTask, newContent) ->
            currentTask.name = newContent

        $scope.drop = (dragItem, category) ->
            dragItem.category = category.name
            #tasks.$update(dragItem)
            tasks.$child(dragItem.$id).$update(dragItem)
            console.log dragItem
            console.log "hé"
            #tasks.$child(dragItem.$id).$update(dragItem)

        $scope.resize = () ->
            #categoriesRef = new Firebase("https://kanbangt.firebaseio.com/categories")
            #categories = $firebase(categoriesRef)
            #catArray=categories.$getIndex()
            #catSize= catArray.length
            console.log catSize
            category.style.width = (100/(catSize)-3)+'%'

