var sandstormApp = angular.module('sandstormApp', ['ngRoute']);

sandstormApp.config(function ($routeProvider) {
    $routeProvider

            .when('/', {
                templateUrl: 'Home',
                controller: 'mainController'
            })

            .when('/Login', {
                templateUrl: 'Login',
                controller: 'mainController'
            })

            .when('/Register', {
                templateUrl: 'Register',
                controller: 'mainController'
            })
            .when('/Account', {
                templateUrl: 'Account',
                controller: 'mainController'
            })
            .when('/Profile', {
                templateUrl: 'Profile',
                controller: 'mainController'
            })
            .when('/Users', {
                templateUrl: 'Users',
                controller: 'mainController'
            })
            .when('/Music', {
                templateUrl: 'Music',
                controller: 'mainController'
            })
            .when('/Radio', {
                templateUrl: 'Radio',
                controller: 'mainController'
            })
            .when('/Playlists', {
                templateUrl: 'Playlists',
                controller: 'mainController'
            })
            .when('/Upload', {
                templateUrl: 'Upload',
                controller: 'mainController'
            });


});


sandstormApp.controller('mainController', function ($scope) {

    $scope.message = 'Hi!';
});

sandstormApp.controller('aboutController', function ($scope) {
    $scope.message = 'Hello.';
});
