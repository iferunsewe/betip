app.controller('profileController', ['$scope','$routeParams','$http', function($scope, $routeParams, $http){
  $scope.tipsters = tipsters
  console.log(tipsters)
  $scope.currentUser = currentUser
  $scope.followingDefault = false

//getting all of the info for the users profile page, have to delve even deeper to get their tips, the predictions on the tip and the type of bet of the prediction.
  $http.get('/users/users_profile/' + $routeParams.id + '.json').success(function(data){
    $scope.userProfile = data
    $http.post('/users/profile_tips.json', {tip:{ user_id: data.data.id}}).success(function(data){ //tip can be anything here but has to be the same as the first params bracket in the user controller action 'profile_tips'
      $scope.userTips = data
      $http.post('/users/profile_predictions.json', {predictions:{ tip_id: data.data.id}}).success(function(data){
        $scope.userPredictions = data
        $http.post('/users/profile_type_of_bet.json', {type: {type_of_bet_id: data.data.type_of_bet_id}}).success(function(data){
          $scope.userTypeOfBet = data
        });
      });
    });
  });

  //gets all the tips data
  // $http.get('/tips.json').success(function(data){
  //   $scope.tips = data;
  // });

  //get method to get all of the user connections for a subscription request
  $http.get('/user_connections/subscription_requests').success(function(response){
    $scope.follower = response.data; 
  });

  //posting all of the info for a user connection
  $scope.subscribeTips = function(tipster){
    $http.post('/user_connections.json', {user_connection: {tipster_id: tipster.id, tipster_name: tipster.name, customer_id: $scope.currentUser.id, customer_name: $scope.currentUser.name, following: $scope.followingDefault}}).success(function(data){
      console.log(data)
      $http.get('/user_connections/' + tipster.id + '.json').success(function(response){
        console.log(response)
        $scope.pending = response
      });
    });
  }

  //accepting the subscription request
  $scope.acceptSubscription = function(connection){
    $http.put('/user_connections/' + connection.id + '.json', {connection: {following: true}}).success(function(data){
      $http.get('/user_connections/subscription_requests').success(function(response){
        $scope.follower = response.data;
      });
    })
  }

  //rejecting the subscription request
  $scope.rejectSubscription = function(connection){
    $http.delete('/user_connections/' + connection.id +'.json', {
      connection:{following:false}})
      .success(function(data){ 
        $http.get('/user_connections/subscription_requests')
        .success(function(response){
          $scope.follower = response.data;          
      });
    });
  };

  // $scope.selectUser = function(user) {
  //   $scope.selectedUser = user;
  // };
}]);