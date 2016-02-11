angular.module('probablyJokes')
.directive('tweetCard', function() {

	var controller = ['$scope', '$http', function ($scope, $http) {

		var url = "/tweet.json";

		init = function() {
			$http.get(url).then(function(response) {
				$scope.tweet = response;
			});
		}

		init();

		$scope.upVote = function() {
			var data = {
				vote: {
					id: $scope.tweet.data.id,
					direction: "up"
				}
			}
			$http.put(url, data);
		}

		$scope.downVote = function() {
			var data = {
				vote: {
					id: $scope.tweet.data.id,
					direction: "down"
				}
			}
			$http.put(url, data);
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