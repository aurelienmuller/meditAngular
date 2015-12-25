var app = angular.module('MeditApp', ['ngRoute'])
    .config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider
        .when('/', {
            templateUrl: 'partials/Emploi/Create.html',
            controller: 'EmploisCtrl'
        })
        .otherwise({ redirectTo: '/' });
    }]);
    app.controller('EmploisCtrl', function ($scope, $http) {

        $http.get("api/Entreprises").success(function (data, status, headers, config) {
            $scope.entreprises = data;
        }).error(function (data, status, headers, config) {
            console.log("something went wrong!!!");
        });

        $http.get("api/Personnes").success(function (data, status, headers, config) {
            $scope.personnes = data;
        }).error(function (data, status, headers, config) {
            console.log("something went wrong!!!");
        });
        
        $http.get("api/tradTravails").success(function (data, status, headers, config) {
            $scope.professions = data;
        }).error(function (data, status, headers, config) {
            console.log("something went wrong!!!");
        });

        $http.get("api/tradRisques").success(function (data, status, headers, config) {
            $scope.risques = data;
        }).error(function (data, status, headers, config) {
            console.log("something went wrong!!!");
        });

        $http.get("api/TypeExamen").success(function (data, status, headers, config) {
            $scope.examens = data;
        }).error(function (data, status, headers, config) {
            console.log("something went wrong!!!");
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


