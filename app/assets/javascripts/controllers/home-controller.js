app.controller('homeController', function($scope, $routeParams, $http){
  $scope.currentUser = currentUser
  $scope.currentTip = currentTip

  $http.get('')

  $http.get('/tips.json').success(function(data){
    $scope.tips = data
  });

  $http.get('/users.json').success(function(data){
    $scope.users = data 

  });

  $http.get('/users/top_three').success(function(response) {
    $scope.topThree = response.data;
  });

  $http.get('/type_of_bets.json').success(function(data){
    $scope.typeOfBets = data
  })

  // $http.get('/home/nextfixtures').success(function(response) {
  //   $scope.nextFixtures = response.data;
  // });

  $scope.currentUser = currentUser.id

  $scope.makeTip = function(){
    $http.post('/tips.json', {tip: $scope.newTip, user_id: $scope.currentUser}).success(function(tip){
      $scope.tips.push(tip);
      $scope.tipForm.$setPristine();
      // $http.get('/tips.json').success(function(data){
      //   $scope.tipPredictions = data.predictions
      // }
    });
  };

  $http.get('/predictions/fixtures_this_week').success(function(response){
    console.log(response.data)
    $scope.fixturesThisWeek = response.data;
  });



  $scope.addPrediction = function(prediction){
    debugger;
    $http.get('/tips.json').success(function(data){
      $scope.lastTips = data.last
      console.log(data.last)
    });
    $http.put('/predictions/' + prediction.id + '.json', {prediction: {predictionGoalsHomeTeam: 0, predictionGoalsAwayTeam: 3, tip_ids: $scope.currentTip}}).success(function(data){
    })  
    // $http.put('/predictions/' + prediction.id + '.json', {prediction: }).success(function(data){
    // }) 
  };
});