app.controller('profileController', ['$scope','$routeParams','$http', function($scope, $routeParams, $http){
  $scope.tipsters = tipsters
  $scope.currentUser = currentUser
  $scope.followingDefault = false

  $http.get('/users/users_profile/' + $routeParams.id + '.json').success(function(data){
    
    $scope.userProfile = data
    $http.post('/users/profile_tips.json', {tip:{ user_id: data.data.id}}).success(function(data){
      $scope.userTips = data
      $http.post('/users/profile_predictions.json', {predictions:{ tip_id: data.data.id}}).success(function(data){
        console.log(data.data)
        $scope.userPredictions = data
            });
    });
  });

  // $http.get('/tipsters/' + $routeParams.id + '.json').success(function(data){
  //   $scope.tipster = data
  // });

  

  $http.get('/tips.json').success(function(data){
    $scope.tips = data;
  });

  $http.get('/user_connections/subscription_requests').success(function(response){
    // console.log(response)
    $scope.follower = response.data; 
  });

  $scope.subscribeTips = function(tipster){
    $http.post('/user_connections.json', {user_connection: {tipster_id: tipster.id, tipster_name: tipster.name, customer_id: $scope.currentUser.id, customer_name: $scope.currentUser.name, following: $scope.followingDefault}}).success(function(data){
      $scope.pendingFollowing = data.following
    });
  }

  $scope.acceptSubscription = function(connection){
    $http.put('/user_connections/' + connection.id + '.json', {connection: {following: true}}).success(function(data){
      $http.get('/user_connections/subscription_requests').success(function(response){
        $scope.follower = response.data;
      });
    })
  }

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

  $scope.selectUser = function(user) {
    $scope.selectedUser = user;
  };
}]);