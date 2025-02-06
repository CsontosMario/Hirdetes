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
                templateUrl: './html/header.html',
                controller: 'headerController'
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
              $scope.$applyAsync();
            })
            .catch(e => alert(e))
        }

      }
    ])
    .controller('headerController', [
      '$scope',
      function ($scope) {

        // Set local methods
        let methods = {

          // Initialize
          init: () => {

            // Get available languages
            fetch('./languages/available.json')
              .then(response => response.json())
              .then(response => {

                // Set language
                $scope.lang = {
                  available: response
                };

                // Get last language identifier
                let langID = localStorage.getItem('languageID');

                // When exist, then change html lang attribute value
                if (langID) document.documentElement.lang = langID;

                // Set selected language identifier
                $scope.lang.id = document.documentElement.lang;

                // Get actual language index
                $scope.lang.index = methods.indexByKeyValue(
                  $scope.lang.available, 'id', $scope.lang.id);

                // Get language
                methods.getLanguage().then(() => {});
              })
              .catch(error => console.log(error));
          },

          // Get language
          getLanguage: () => {
            return new Promise((resolve, reject) => {
              fetch(`./languages/${$scope.lang.id}.json`)
                .then(response => response.json())
                .then(response => {
                  $scope.lang.data = response;
                  $scope.$applyAsync();
                  resolve();
                })
                .catch(error => {
                  console.log(error);
                  reject();
                });
            });
          },

          // Index array of object key value
          indexByKeyValue: (a, k, v) => a.findIndex(o => o[k] === v)
        }

        // Set scope methods
        $scope.methods = {

          // Language changed
          languageChanged: (langID) => {

            // Set selected language identifier
            $scope.lang.id = langID;

            // Save selected language identifier to local storige
            localStorage.setItem('languageID', langID);

            // Change html lang attribute value
            document.documentElement.lang = langID;

            // Get selected language index
            $scope.lang.index = methods.indexByKeyValue(
              $scope.lang.available, 'id', $scope.lang.id);

            // Get language
            methods.getLanguage().then(() => {});
          }
        };

        // Initialize
        methods.init();
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
