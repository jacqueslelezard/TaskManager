angular.module('app').factory 'Tasks',
    ($firebase) ->

        tasks = new Firebase("https://kanbangt.firebaseio.com/tasks")
        console.log($firebase(tasks))


        list = [
            {name:'un peu de style !', category:'inprogress', priority: 2}
            {name:'système de drag and drop basique', category:'done', priority: 1}
            {name:'manger !', category:'todo', priority: 1}
            {name:'documenter', category:'todo', priority: 3}
            {name:'faire marche tout le bazard', category:'todo', priority: 1}
        ]

        return {

            get: ->
                return $firebase(tasks)

            add: (newtask, newtaskcategory, newtaskpriority) ->
                if newtaskpriority
                    priority2=newtaskpriority
                else
                    priority2=2
                list.push({name:newtask, category:newtaskcategory, priority:priority2})


            delete: (currenttask) ->
                list.splice(list.indexOf(currenttask), 1)

            updateCat: (currenttask, newcategory) ->
                currenttask.category=newcategory

            updatePrio: (currenttask, newprio) ->
                console.log("hop")
                currenttask.priority=newprio
                #currenttask.priority=newcategory
                #alert(newcategory)
            #allowDrop: (ev) ->
                #ev.preventDefault()
            #drag: (ev) ->
                #ev.dataTransfer.setData("Text", ev.target.id)
        }