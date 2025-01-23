; (function (window, angular) {

  angular.module('app', [
    'ui.router',
    'app.common'
  ])
    .config([
      '$stateProvider',
      '$urlRouterProvider',
      function ($stateProvider, $urlRouterProvider) {

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
          .state('profil', {
            url: '/',
            parent: 'root',
            templateUrl: './html/profil_and_cart/profile.html',
            controller: 'profileController'
          })

          .state('cart', {
            url: '/cart',
            parent: 'root',
            templateUrl: './html/profil_and_cart/cart.html',
            controller: 'cartController'
          })

        $urlRouterProvider.otherwise('/');

      }
    ])

    .run([
      '$rootScope',
      '$state',
      'trans',
      function ($rootScope, $state, trans) {

        $rootScope.user = { id: null, name: null };

        console.log('Run...' + $state.current.name);

        $rootScope.kilep = () => {
          if (confirm('Biztossan kilép?')) {
            $rootScope.user.id = null;
            $rootScope.$applyAsync();
          }
        }
      }
    ])

    //Home controller
    .controller('homeController', [
      '$scope',
      function ($scope,) {
        console.log('Home controller...');
      }
    ])

    //Products controller
    .controller('productsController', [
      '$scope',
      'http',
      function ($scope, http) {

        http.request("./php/hirdetes.php")
          .then(response => {
            $scope.zoldsegek = response;
            $scope.$applyAsync();
          })
          .catch(e => console.log(e))

        console.log('Products controller...');
      }
    ])

    //About our farmers controller
    .controller('about_our_farmersController', [
      '$scope',
      function ($scope) {
        console.log('About_our_farmers controller...');
      }
    ])

    //About us controller
    .controller('about_usController', [
      '$scope',
      function ($scope) {
        console.log('Products controller...');
      }
    ])

    //Register controller
    .controller('registerController', [
      '$scope',
      'http',
      function ($scope, http) {
        console.log('Register controller...');

        $scope.register = () => {

          http.request({
            url: "./php/register.php",
            data: $scope.sign_up
          })
            .then(result => {
              $scope.data = result
              $scope.$applyAsync()
              alert("Sikeres a regisztráció!");
            })
            .catch(e => console.log(e))


          console.log($scope.sign_up); //Ideiglenesen van benn!!!!
        }

      }
    ])

    //Login controller
    .controller('loginController', [
      '$rootScope',
      '$scope',
      'http',
      function ($rootScope, $scope, http) {
        console.log('Login controller...');

        $scope.login = () => {
          http.request({
            url: "./php/felhasznalo.php",
            data: $scope.sign_in
          })
            .then(result => {
              $scope.data = result;
              $scope.$applyAsync();
              if (result) {
                $rootScope.user.id = result.felhasznaloID;
                alert("Sikeres a bejelentkezés!");
              }
              else {
                $rootScope.user.id = null;
                $rootScope.$applyAsync();
                alert("Nincs ilyen felhasználó akit be lehetne léptetni.");
                alert("Kérem regisztrálja ezt a felhasználót!")
              }

            })
            .catch(e => console.log(e))
        }

      }
    ])

    //Profile controller
    .controller('profileController', [
      '$scope',
      function ($scope) {
        console.log('Profile controller...');
      }
    ])

    //Cart controller
    .controller('cartController', [
      '$rootScope',
      '$scope',
      function ($rootScope, $scope) {
        console.log('Cart controller...');
      }
    ])

})(window, angular);