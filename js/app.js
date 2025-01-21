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
                url: '/products',
                parent: 'root',
                templateUrl: './html/products.html',
                controller: 'productsController'
            })
            .state('aboutOurFarmers', {
                url: '/about_our_farmers',
                parent: 'root',
                templateUrl: './html/farmers_and_programmers/about_our_farmers.html',
                controller: 'about_our_farmersController'
            })
            .state('aboutUs', {
                url: '/about_our_website_creators',
                parent: 'root',
                templateUrl: './html/farmers_and_programmers/about_us.html',
                controller: 'about_usController'
            })
            .state('register', {
                url: '/sign_up',
                parent: 'root',
                templateUrl: './html/profil_and_cart/sign_up.html',
                controller: 'registerController'
            })
            .state('login', {
                url: '/sign_in',
                parent: 'root',
                templateUrl: './html/profil_and_cart/sign_in.html',
                controller: 'loginController'
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

    //Register controller
    .controller('registerController', [
        '$scope',
        'http',
        function($scope, http) {
            console.log('Register controller...');

            $scope.register= ()=>{

                http.request({
                    url: './php/register.php',
                    data: $scope.sign_up
                })
                .then(result => {
                    $scope.data = result
                    $scope.$applyAsync()
                })
                .catch(e=>console.log(e))

                alert("Sikeres a regisztráció!");
                console.log($scope.sign_up); //Ideiglenesen van benn!!!!
            }



        }
    ])

    //Login controller
    .controller('loginController', [
        '$scope',
        function($scope) {
            console.log('Login controller...');

            $scope.login = ()=>{
                alert("Sikeres a bejelentkezés!");
            }

        }
    ])

})(window, angular);