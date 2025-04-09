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
                templateUrl: './html/footer.html',
                controller: 'footerController'
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
      .state('aboutOurFarm', {
            url: '/about_our_farm',
            parent: 'root',
            templateUrl: './html/about_our_farm.html',
            controller: 'about_our_farmController'
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
            url: '/profile/sign_up',
            parent: 'root',
            templateUrl: './html/profil_and_cart/sign_up.html',
            controller: 'registerController'
      })
      .state('login', {
            url: '/profile/sign_in',
            parent: 'root',
            templateUrl: './html/profil_and_cart/sign_in.html',
            controller: 'loginController'
      })
      .state('profil', {
            url: '/profile/profile',
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
      'util',
      function ($rootScope, $state, util) {
        $rootScope.user       = {};
        $rootScope.user.id    = util.localStorage('get', 'loginID');
        $rootScope.user.name  = util.localStorage('get', 'loginName');
        console.log('Run...' + $state.current.name);
        
        //Kilépés
        $rootScope.kilep = () => {
          if (confirm($rootScope.lang.data.exit_question)) {
            $rootScope.user.id = null;
            $rootScope.user.name = null;
            util.localStorage('remove', 'loginID');
            util.localStorage('remove', 'loginName');
            $rootScope.$applyAsync();
            $state.go('home');
          }
        };
      }
    ])

    //Home controller
    .controller('homeController', [
      '$scope',
      function ($scope) {
        console.log('Home controller...');
      }
    ])

    //Footer controller
    .controller('footerController', [
      '$scope',
      function ($scope) {
        $scope.current_year = moment().year().toString();
      }
    ])

    //Products controller
    .controller('productsController', [
      '$rootScope',
      '$scope',
      'http',
      function ($rootScope, $scope, http) {
        http.request("./php/hirdetes.php")
        .then(response => {
          $scope.zoldsegek = response;
          $scope.$applyAsync();
        })
        .catch(e => console.log(e));

        $scope.toCart = (product_id, quantity, product_ar) => {
          if (!quantity) {
            alert($rootScope.lang.data.invalid_quantity);
          }
          else{
            http.request({
              url: "./php/toCart.php",
              data: {
                kosarID:$rootScope.user.id,
                termekID:product_id,
                db:quantity,
                ar:product_ar*quantity
              }
            })
            .then(result => {
              $scope.data = result;
              $scope.$applyAsync();
              alert($rootScope.lang.data.add_product);
              $state.go("cart");
            })
            .catch(e => console.log(e));
          }

        };

        console.log('Products controller...');
      }
    ])

    //About our farm controller
    .controller('about_our_farmController', [
      '$scope',
      'http',
      function ($scope, http) {
        http.request('./php/farm.php')
        .then(result => {
          $scope.farm_kepek = result;
          $scope.$applyAsync();
        })
        .catch(e => console.log(e))
        console.log('About_our_farm controller...');
      }
    ])

    //About us controller
    .controller('about_usController', [
      '$scope',
      'http',
      function ($scope, http) {
        http.request('./php/programmers.php')
        .then(result => {
          $scope.programmers = result;
          $scope.$applyAsync();
        })
        .catch(e => console.log(e))
        console.log('Products controller...');
      }
    ])

    //Register controller
    .controller('registerController', [
      '$rootScope',
      '$scope',
      '$state',
      'http',
      function ($rootScope,$scope,$state,http) {
        console.log('Register controller...');

        //Nincs bejelentkezve egy felhasználó se
        $scope.register = () => {
          if ($scope.confirm_password === $scope.sign_up.jelszo) {
            http.request({
              url: "./php/register.php",
              data: $scope.sign_up
            })
            .then(result => {
              $scope.data = result;
              $state.go('login');
              $scope.$applyAsync();
              alert($rootScope.lang.data.registered1);
            })
            .catch(e => {
              alert($rootScope.lang.data[e]);
            })
          } else {
            alert($rootScope.lang.data.wrong_password);
          }
        };

        //Be van jelentkezve egy felhasználó
        $scope.register_logged_in = () => {
          if ($scope.confirm_password === $scope.sign_up.jelszo) {
            http.request({
              url: "./php/register.php",
              data: $scope.sign_up
            })
            .then(result => {
              $scope.data = result;
              $scope.$applyAsync();
              alert($rootScope.lang.data.registered2);
            })
            .catch(e => {
              alert($rootScope.lang.data[e])
            })
          } else {
            alert($rootScope.lang.data.wrong_password);
          }
        };
      }
    ])

    //Login controller
    .controller('loginController', [
      '$rootScope',
      '$scope',
      'http',
      'util',
      '$state',
      function ($rootScope, $scope, http, util, $state) {
        console.log('Login controller...');
        $scope.login = () => {
          http.request({
            url: "./php/felhasznalo.php",
            data: $scope.sign_in
          })
          .then(result => {
              $rootScope.user.id = result.felhasznaloID;
              $rootScope.user.name = result.nev;
              util.localStorage('set', 'loginID', $rootScope.user.id);
              util.localStorage('set', 'loginName', $rootScope.user.name);
              alert($rootScope.lang.data.sign_in_success_1 + "\n" + 
                    $rootScope.lang.data.sign_in_success_2 + " " + 
                    $rootScope.user.name + "!");
              $state.go('home');
              $scope.$applyAsync();
          })
          .catch(e => alert($rootScope.lang.data[e]));
        }
      }
    ])

    //About our farmers controller
    .controller('about_our_farmersController', [
      '$scope',
      'http',
      function ($scope, http) {
        http.request('./php/producers.php')
        .then(result => {
          $scope.farmers = result;
          $scope.$applyAsync();
        })
        .catch(e => console.log(e))
        console.log('About_our_farmers controller...');
      }
    ])

    //Header controller
    .controller('headerController', [
      '$rootScope',
      '$scope',
      function ($rootScope, $scope) {
        // Set local methods
        let methods = {
          // Initialize
          init: () => {
            // Get available languages
            fetch('./languages/available.json')
              .then(response => response.json())
              .then(response => {
                // Set language
                $rootScope.lang = {
                  available: response
                };
                // Get last language identifier
                let langID = localStorage.getItem('languageID');
                // When exist, then change html lang attribute value
                if (langID) document.documentElement.lang = langID;
                // Set selected language identifier
                $rootScope.lang.id = document.documentElement.lang;
                // Get actual language index
                $rootScope.lang.index = methods.indexByKeyValue(
                  $rootScope.lang.available, 'id', $rootScope.lang.id);
                // Get language
                methods.getLanguage().then(() => {
                  // Change html title
								  document.title = $rootScope.lang.data.language;
                });
              })
              .catch(error => console.log(error));
          },

          // Get language
          getLanguage: () => {
            return new Promise((resolve, reject) => {
              fetch(`./languages/${$rootScope.lang.id}.json`)
                .then(response => response.json())
                .then(response => {
                  $rootScope.lang.data = response;
                  //console.log($scope.lang.data)
                  $rootScope.$applyAsync();
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
						$rootScope.lang.id = langID;
						// Save selected language identifier to local storige
						localStorage.setItem('languageID', langID);
						// Change html lang attribute value
						document.documentElement.lang = langID;
						// Get selected language index
						$rootScope.lang.index = methods.indexByKeyValue(
							$rootScope.lang.available, 'id', $rootScope.lang.id);
						// Get language
						methods.getLanguage().then(() => {
							// Change html title
							document.title = $rootScope.lang.data.language;
						});
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
      'http',
      'util',
      function ($rootScope, $scope, http, util) {

        $scope.changes = {
          profil_base: null,
          change : false
        };

        http.request({
          url: "./php/profile.php",
          data: $rootScope.user.id
        })
        .then(result =>{
          $scope.profile_data = util.objMerge($scope.profile_data, result);
          $scope.changes.profil_base = util.objMerge({}, $scope.profile_data);
          $scope.$applyAsync();
        })
        .catch(e=>console.log(e));

        $scope.$watch('profile_data', (newValue, oldValue) => {
          if (newValue) {
            $scope.changes.change = 
                !angular.equals(newValue, $scope.changes.profil_base);
          }
        }, true);
      }
    ])

    //Cart controller
    .controller('cartController', [
      '$rootScope',
      '$scope',
      'http',
      function ($rootScope, $scope, http) {

        //A kosár frissítése új termékek berakása után.
        $scope.$applyAsync();
        
        //Fizetési típusok
        http.request("./php/cart.php")
        .then(result => {
            $scope.pay_types = result;
            $scope.$applyAsync();
        })
        .catch(e => console.log(e));

        //Megvett termékek adatainak leszedése
        http.request({
          url:"./php/cartelements.php",
          data: $rootScope.user.id
        })
        .then(result =>{
          $scope.bought_products = result;
          $scope.$applyAsync();
        })
        .catch(e => console.log(e));

        //Tartalom kiszedése a kosárból
        $scope.remove_from_cart=(index)=>{
          if (confirm($rootScope.lang.data.confirm_delete) === true) {
            //Megadott termék tölése az adatbázisból
            http.request({
              url:"./php/fromCart.php",
              data:{
                "kosarID":$rootScope.user.id,
                "termekID":$scope.bought_products[index].termekID
              }
            })
            .then(result =>{
              alert($rootScope.lang.data.deleted_item);
              $scope.$applyAsync();
            })
            .catch(e=>console.log(e));
          }
          else{
            alert($rootScope.lang.data.not_deleted_item);  
          }
        };
        
        //Fizetés
        $scope.pay = ()=>{
          http.request({
            url:"./php/buy_items.php",
            data:{
              "kosarID":$rootScope.user.id,
              "fizetesTipus":$scope.cart.fizetesTipus,
              "kartyaSzam":$scope.cart.kartyaSzam,
              "datum":$scope.cart.datum
            }
          })
          .then(result=>{
            alert($rootScope.lang.data.pay_msg);
            $scope.$applyAsync();
          })
          .catch(e=>console.log(e));
        };

        console.log('Cart controller...');
      }
    ])

})(window, angular);