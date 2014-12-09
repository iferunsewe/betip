app.controller('profileController', function($scope, $routeParams, $http){
  $http.get('/users/' + $routeParams.id + '.json').success(function(data){
    $scope.user = data
  });

  $http.get('/tips.json').success(function(data){
    $scope.tips = data;
  });

  // $http.get('/home/nextfixtures').success(function(response) {
  //   $scope.nextFixtures = response.data;
  // });
});