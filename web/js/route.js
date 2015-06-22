var sandstormApp = angular.module('sandstormApp', ['ngRoute']);

sandstormApp.config(function ($routeProvider) {
    $routeProvider

            .when('/', {
                templateUrl: 'Home',
                controller: 'mainController'
            })

            .when('/Login', {
                templateUrl: 'Login',
                controller: 'aboutController'
            })

            .when('/Register', {
                templateUrl: 'Register',
                controller: 'contactController'
            })
            .when('/Account', {
                templateUrl: 'Account',
                controller: 'contactController'
            })
            .when('/Profile', {
                templateUrl: 'Profile',
                controller: 'contactController'
            })
            .when('/Users', {
                templateUrl: 'Users',
                controller: 'contactController'
            })
            .when('/Music', {
                templateUrl: 'Music',
                controller: 'contactController'
            })
            .when('/Radio', {
                templateUrl: 'Radio',
                controller: 'contactController'
            })
            .when('/Playlists', {
                templateUrl: 'Playlists',
                controller: 'contactController'
            });


});


sandstormApp.controller('mainController', function ($scope) {

    $scope.message = 'Hi!';
});

sandstormApp.controller('aboutController', function ($scope) {
    $scope.message = 'Hello.';
});
