angular.module('probablyJokes', []);

angular.module('probablyJokes')
.controller('TweetController', function($scope, $http) {

	$scope.randomTweet = function() {
		var url = "/tweet.json";
		
		$http.get(url).success(function(response) {
			$scope.tweet = response;
		});
	}

});