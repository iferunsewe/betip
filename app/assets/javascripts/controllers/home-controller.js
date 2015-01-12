app.controller('homeController', ['$scope','$routeParams','$http', '$route', function($scope, $routeParams, $http, $route){
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
  $http.get('/users/followed_tipsters.json').success(function(data){
    console.log(data.data)
    $scope.followedTipsters = data.data
    angular.forEach($scope.followedTipsters, function(tipster){
      $http.post('/users/profile_tips.json', {
        tip: { 
          user_id: tipster.id
        }
      }).success(function(data){
        $scope.followedTips = angular.fromJson(data.data)
      });
    });
  });

  $scope.makeTip = function(tip){
    data = {
      tip: { 
        bookies: tip.bookies,
        comment: tip.comment, 
        odds: tip.odds,
        user_id: $scope.currentUser.id
      }, 
      prediction: $scope.madePredictions
    },
    $http.post('/tips.json', data).success(function(data, tip){
      $scope.madeTip = tip;//used to switch page to tell users they've made a tip
    });
    $http.get('/tips.json').success(function(data){
      $scope.lastTip = data[data.length - 1]
    });
  };
  
  $http.get('/predictions/fixtures_this_week').success(function(response){
    $scope.fixturesThisWeek = response.data;
  });

  //Updating the scores the dependent of on the type of bet id
  $scope.addPrediction = function(prediction, fixtureId) {
    $http.get('/predictions/' + fixtureId + '.json').success(function(data){
      $scope.fixtureDetails = data
    }).success(function(data){
      $scope.typeOfBetId = parseInt(prediction.typeOfBetId[fixtureId]);
      $http.get('/type_of_bets/' + $scope.typeOfBetId + '.json').success(function(data){
        $scope.typeOfBetName = data.name
      }).success(function(data){
        data = {};
        data.fixtureId = fixtureId;
        data.typeOfBet = $scope.typeOfBetId
        data.homeTeam = $scope.fixtureDetails.homeTeam
        data.awayTeam = $scope.fixtureDetails.awayTeam
        data.typeOfBetName = $scope.typeOfBetName
        $scope.madePredictions.push(data);
      })
    });
  }
}]);