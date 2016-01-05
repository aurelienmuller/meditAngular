var app = angular.module('MeditApp', ['ngRoute'])
    .config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider
        .when('/', {
            templateUrl: 'partials/Accueil/Accueil.html'
        })
        .when('/empl', {
            templateUrl: 'partials/Emploi/Create.html',
            controller: 'EmploisCtrl'
        })
        .when('/trav', {
            templateUrl: 'partials/Travailleur/Create.html',
            controller: 'TravailleursCtrl'
        })
        .otherwise({ redirectTo: '/' });
    }]);
    app.controller('EmploisCtrl', function ($scope, $http) {

        $http.get("api/Entreprises").success(function (data, status, headers, config) {
            $scope.entreprises = data;
        }).error(function (data, status, headers, config) {
            console.log(status);
        });

        $http.get("api/Personnes").success(function (data, status, headers, config) {
            $scope.personnes = data;
        }).error(function (data, status, headers, config) {
            console.log(status);
        });
        
        $http.get("api/Professions").success(function (data, status, headers, config) {
            $scope.professions = data;
        }).error(function (data, status, headers, config) {
            console.log(status);
        });

        $scope.emploi = {
            dateEntree: null,
            dateSortie: null,
            soumis: '0',
            numeroEntreprise: null,
            codeProfession: null,
            idPersonne: null          
        }

        $scope.Save = function () {
            var emploiJSON = angular.toJson($scope.emploi);

            $http.post('api/Emplois', emploiJSON)
                .success(function (data, status, headers, config) {
                    alert("Nouvel emploi ajouté");
                    console.log(data);
                })
                .error(function (data, status, header, config) {
                    alert("Une erreur est survenue");
                    console.log(data);
                });
        }


    });
    app.controller('TravailleursCtrl', function ($scope, $http) {

        $scope.personne = {
            name: null,
            lastName: null,
            adresse: null,
            numTel: null,
            email: null,
            numDossier: null,
            typePersonne: 'T'
        };


        $scope.Save = function () {
            var personneJSON = angular.toJson($scope.personne);
            $http.post('api/Personnes', personneJSON)
                .success(function (data, status, headers, config) {
                    alert("Nouveau Travailleur ajouté");
                    console.log(data);
                })
                .error(function (data, status, header, config) {
                    alert("Une erreur est survenue");
                    console.log(data);
                });
        }
    });