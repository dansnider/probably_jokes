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

		$scope.showImage = function() {
			var $image = $('.card--tweet-image'),
					$button = $('.card--display-button');

			$button.addClass('is-hidden');
			$image.addClass('is-displayed');
		}

		$scope.twitterShare = function() {
			var url = "https://twitter.com/share?url=" + 
								"/tweet/" + $scope.tweet.id +
								"&viaprobablyjokes&text=via @" +
								$scope.comedian_screen_name + "- " +
								$scope.tweet.text;

			PJ.openShareWindow(url);
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