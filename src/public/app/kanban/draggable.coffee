angular.module('app').directive 'draggable', (DnDService, $parse) ->
    link: (scope, elem, attrs) ->
        item = $parse(attrs.draggable)(scope)
        #class = $parse(attrs.ngClass)(scope)
        el = elem[0]
        el.draggable = true

        _dragstart = (e) ->
            DnDService.data = item
            #console.log("dragstart")
            elem.addClass("drag")

        _dragend = (e) ->
            #elem.preventDefault();
            #console.log("dragend")
            elem.removeClass("drag")

        elem.bind 'dragstart', _dragstart
        elem.bind 'dragend', _dragend


angular.module('app').directive 'droppable', (DnDService, $parse) ->
    link: (scope, elem, attrs) ->
        el = elem[0]
        item = $parse(attrs.droppable)(scope)

        _dragenter = (e) ->
            e.preventDefault()

        _dragover = (e) ->
            e.preventDefault()
            #console.log("dragover")
            elem.addClass('dragover')

        _dragleave = (e) ->
            e.preventDefault()
            #console.log("dragleave")
            elem.removeClass("dragover")

        _drop = (e) ->
            e.preventDefault()
            fn = $parse(attrs.ngDrop)
            #console.log("drop")
            elem.removeClass("dragover")
            scope.$apply ->
                fn(scope, {dragItem: DnDService.data, dropItem: item})

        elem.bind 'dragenter', _dragenter
        elem.bind 'dragover', _dragover
        elem.bind 'dragleave', _dragleave
        elem.bind 'drop', _drop


angular.module('app').service 'DnDService', ->
     @data = null

# angular.module('app').directive 'ngEnter', ->
#         link: (scope, element, attrs) ->
#             element.bind "keydown keypress", link : (event) ->
#                 if(event.which === 13) {
#                     scope.$apply(function(){
#                         scope.$eval(attrs.ngEnter, {'event': event})
#                     })

#                     event.preventDefault()
#                 }
        # el = element[0]

        # el.draggable = true

        # el.addEventListener(
        #         'dragstart',
        #          dragstart: (e) ->
        #             e.dataTransfer.effectAllowed = 'move'
        #             e.dataTransfer.setData('Text', this.id)
        #             this.classList.add('drag')
        #             return false
        #         false
        #         )
        # el.addEventListener(
        #         'dragend',
        #          dragend: (e) ->
        #             this.classList.remove('drag')
        #             return false
        #         false
        #         )
        # return{



        #     }