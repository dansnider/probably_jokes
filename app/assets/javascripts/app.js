angular.module('probablyJokes', []);

angular.module('probablyJokes')
.controller('TweetController', function($scope, $compile) {

	$scope.addTweet = function() {
		var el = $compile( "<tweet-card></tweet-card>" )($scope);
		$('body').append(el);
	}

	// add tweet on tweet-card.destroy()

});