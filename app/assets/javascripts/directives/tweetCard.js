angular.module('probablyJokes')
.directive('tweetCard', function() {

	var controller = ['$scope', '$http', function ($scope, $http) {

		var url = "/tweet.json";

		init = function() {
			$http.get(url).then(function(response) {
				$scope.tweet = response.data;
			});
		}

		init();

		$scope.upVote = function() {
			var data = {
				id: $scope.tweet.id	
			}
			$http.put(url, data);
			// $scope.$emit('cardShift');
		}

		$scope.nextTweet = function() {
			$scope.$emit('cardShift');
		}

	}];

	return {
		restrict: 'E',
		scope: {},
		controller: controller,
		templateUrl: 'tweet-card.html'
	};
});

// { "data": { "id": 1, "direction": "up"} }