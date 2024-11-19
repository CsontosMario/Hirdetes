;(function(window, angular) {

    angular.module('app', [
		'ui.router'
	])
    .config([
        '$stateProvider', 
        '$urlRouterProvider', 
        function($stateProvider, $urlRouterProvider) {

            $stateProvider
            .state('root', {
                abstract: true,
                views: {
                    '@': {
                        templateUrl: './html/root.html'
                    },
                    'header@root': {
                        templateUrl: './html/header.html'
                    },
                    'footer@root': {
                      templateUrl: './html/footer.html'
                    }
                }
            })
            .state('home', {
                url: '/',
                parent: 'root',
                templateUrl: './html/home.html',
                controller: 'homeController'
            })
            .state('products', {
                url: '/',
                parent: 'root',
                templateUrl: './html/products.html',
                controller: 'productsController'
            })

            $urlRouterProvider.otherwise('/');

        }
      ])

    //Home controller
    .controller('homeController', [
        '$scope',
        '$state',
        function($scope, $state) {
            console.log('Home controller...');
        }
    ])

    //Products controller
    .controller('productsController', [
        '$scope',
        '$state',
        function($scope, $state) {
            console.log('Products controller...');
        }
    ])

})(window, angular);