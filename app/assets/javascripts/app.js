angular.module('probablyJokes', ['ngSanitize'])
.controller('TweetController', function($scope, $compile) {

	$scope.addTweet = function() {
		var el = $compile( "<tweet-card></tweet-card>" )($scope);
		$('.tweet-card-container').append(el);
	}

	$scope.$on('cardShift', function(){
		//animate

		$('.tweet-card').first().remove();
		$scope.addTweet();
	});

	// add tweet on tweet-card.destroy()

});