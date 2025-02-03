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
            url: '/',
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
      'util',
      function ($rootScope, $state, util) {

        $rootScope.user = {};
        $rootScope.user.id = util.localStorage('get', 'loginID');
        $rootScope.user.name = util.localStorage('get', 'loginName');

        console.log('Run...' + $state.current.name);

        $rootScope.kilep = () => {
          if (confirm('Biztosan ki szeretne lépni ebből a fiókból?')) {
            $rootScope.user.id = null;
            $rootScope.user.name = null;
            util.localStorage('remove', 'loginID');
            util.localStorage('remove', 'loginName');
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
      'util',
      function ($rootScope, $scope, http, util) {
        console.log('Login controller...');

        $scope.login = () => {
          http.request({
            url: "./php/felhasznalo.php",
            data: $scope.sign_in
          })
            .then(result => {
              $rootScope.user.id = result.felhasznaloID;
              $rootScope.user.name = $scope.sign_in.nev;

              util.localStorage('set', 'loginID', $rootScope.user.id);
              util.localStorage('set', 'loginName', $rootScope.user.name);
              alert("Sikeres a bejelentkezés!\nÜdvözöljük " + $scope.sign_in.nev + "!");
            })
            .catch(e => alert(e))
        }

      }
    ])

    //Profile controller
    .controller('profileController', [
      '$rootScope',
      '$scope',
      function ($rootScope, $scope) {
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
