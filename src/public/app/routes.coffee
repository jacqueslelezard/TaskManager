angular.module('app')
.config ($urlRouterProvider, $stateProvider) ->

  $urlRouterProvider.otherwise '/kanban'

  $stateProvider
    .state 'app',
      abstract: true
      templateUrl: 'tpl-layout.html'

    .state 'app.kanban',
      url: '/kanban'
      templateUrl: 'kanban/tpl-kanban.html'
      controller: 'TaskCtrl'