app.controller('profileController', ['$scope','$routeParams','$http', '$route', function($scope, $routeParams, $http, $route){
  $scope.currentUser = currentUser
  $scope.followingDefault = false
  $scope.dateNow = new Date();


//getting the tipster information, data was passed back as a string so had to parse the data to retrieve the objects
$http.get('/users/tipsters').success(function(data) {
  $scope.tipsters = angular.fromJson(data.data) //had to use angular.fromJson as data was coming back as a string.
});

//getting all of the info for the users profile page, have to delve even deeper to get their tips, the predictions on the tip and the type of bet of the prediction.
  $http.get('/users/users_profile/' + $routeParams.id + '.json').success(function(data){
    $scope.userProfile = angular.fromJson(data.data)
    $http.post('/users/profile_tips.json', {
      tip: { 
        user_id: $scope.userProfile.id
      }
    }).success(function(data){ //tip can be anything here but has to be the same as the first params bracket in the user controller action 'profile_tips'
      $scope.userTips = angular.fromJson(data.data)
      //Json data coming back from the controller was being passed as a string, so i used the angular function angular.fromJson() to parse the string back into an object and stored it in $scope.userTips to make it accessible.
      angular.forEach($scope.userTips, function(tip){
        angular.forEach(tip.predictions, function(prediction){
          $http.post('/predictions/result_bet.json', {
            prediction: {
              prediction_id: prediction.id
            }
          }).success(function(data){
            // Looping through each tip to get the predictions on each tip to get the id of each prediction to use to put the prediction through the method result_bet and get their results so I log on the html whether the prediction was won which can then indicate whether the tip was won
          });   
          $http.post('/tips/tip_won', {
            tip: {
              tip_id: tip.id
            }
          });
        });
      });
    });
  });

  $scope.deleteTip = function(tip){
    $http.delete('/tips/' + tip.id +'.json').success(function(data){
      $route.reload();
    });
  }

  //get method to get all of the user connections for a subscription request
  $http.get('/user_connections/subscription_requests').success(function(response){
    $scope.follower = response.data; 
  });

  //posting all of the info for a user connection
  $scope.subscribeTips = function(tipster, userProfile){ //userProfile sends back the profile page and tipster has the info from the leadertable
    $http.post('/user_connections.json', {
      user_connection: {
        tipster_id: tipster.id || userProfile.id, 
        tipster_name: tipster.name || userProfile.name, 
        customer_id: $scope.currentUser.id, 
        customer_name: $scope.currentUser.name, 
        following: $scope.followingDefault
      }
    }).success(function(data){
      $http.post('/user_connections/followed_tipster', {
        tipster: {
          tipster_id: tipster.id,
          customer_id: $scope.currentUser.id
        }
      }).success(function(response){
        $http.get('/users/tipsters').success(function(data) {//this last get request changes the button to prnding without refreshing as you get the tipster's info again and reassign with the updated information.  will be stored as $scope.tipsters so will replace the original $scope.tipsters with the older data
          $scope.tipsters = angular.fromJson(data.data) //now the data is objects of user connections
        });
        $http.get('/users/users_profile/' + $routeParams.id + '.json').success(function(data){
          $scope.userProfile = angular.fromJson(data.data)
        });
      })
    });
  }

  //accepting the subscription request
  $scope.acceptSubscription = function(connection){
    $http.put('/user_connections/' + connection.id + '.json', {
      connection: {
        following: true
      }}).success(function(data){
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
}]);