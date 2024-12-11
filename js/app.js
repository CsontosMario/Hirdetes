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
            .state('aboutOurFarmers', {
                url: '/',
                parent: 'root',
                templateUrl: './html/farmers_and_programmers/about_our_farmers.html',
                controller: 'about_our_farmersController'
            })
            .state('aboutUs', {
                url: '/',
                parent: 'root',
                templateUrl: './html/farmers_and_programmers/about_us.html',
                controller: 'about_usController'
            })
            .state('register', {
                url: '/',
                parent: 'root',
                templateUrl: './html/profil_and_cart/sign_up.html',
                controller: 'registerController'
            })
            $urlRouterProvider.otherwise('/');

        }
      ])

    .run([
      '$rootScope',
      '$state',
      function($rootScope, $state) {
              console.log('Run...'+$state.current.name);
      }
    ])

    //Home controller
    .controller('homeController', [
        '$scope',
        function($scope,) {
            console.log('Home controller...');
        }
    ])

    //Products controller
    .controller('productsController', [
        '$scope',
        function($scope) {
            console.log('Products controller...');
        }
    ])
    
    //About our farmers controller
    .controller('about_our_farmersController', [
        '$scope',
        function($scope) {
            console.log('About_our_farmers controller...');
        }
    ])

    //About us controller
    .controller('about_usController', [
        '$scope',
        function($scope) {
            console.log('Products controller...');
        }
    ])
    .controller('registerController', [
        '$scope',
        function($scope) {
            console.log('registerController')
        }
    ])

})(window, angular);