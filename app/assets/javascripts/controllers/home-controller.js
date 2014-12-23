app.controller('homeController', ['$scope','$routeParams','$http', function($scope, $routeParams, $http){
  $scope.currentUser = currentUser
  $scope.currentTip = currentTip
  $scope.madePredictions = [];

  $http.get('/tips.json').success(function(data){
    $scope.tips = data
  });

  $http.get('/users.json').success(function(data){
    $scope.users = data 
  });

  //getting the top three tipsters on the website 
  $http.get('/users/top_three').success(function(response) {
    $scope.first = response.data[0]
    $scope.second = response.data[1]
    $scope.third = response.data[2]
  });

  $http.get('/type_of_bets.json').success(function(data){
    $scope.typeOfBets = data
  });

  //using controller action 'followed tips' to get the tips of a tipster that a customer follows
  $http.get('/users/followed_tips.json').success(function(data){
    $scope.followedTips = data 
  });


  $scope.makeTip = function(tip){
    data = {
      tip: { 
        bookies: tip.bookies, 
        user_id: $scope.currentUser.id
      }, 
      prediction: $scope.madePredictions
    },
    $http.post('/tips.json', data).success(function(data, tip){
      $scope.madeTip = tip;//used to switch page to tell users they've made a tip
    });
  };
  
  $http.get('/predictions/fixtures_this_week').success(function(response){
    $scope.fixturesThisWeek = response.data;
  });

  //Updating the scores the dependent of on the type of bet id
  $scope.addPrediction = function(prediction, fixtureId) {
    data = {};
    data.fixtureId = fixtureId;
    data.predictionGoalsHomeTeam = prediction.scores.predictionGoalsHomeTeam[fixtureId];
    data.predictionGoalsAwayTeam = prediction.scores.predictionGoalsAwayTeam[fixtureId];
    data.typeOfBet = prediction.typeOfBetId[fixtureId];
    $scope.madePredictions.push(data);
  }
}]);