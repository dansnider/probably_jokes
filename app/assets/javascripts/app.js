angular.module('probablyJokes', ['ngSanitize'])
.controller('TweetController', function($scope, $compile) {

	$scope.addTweet = function() {
		var el = $compile( "<tweet-card class='card'></tweet-card>" )($scope);
		$('.card-container').prepend(el);
	}

	$scope.$on('cardShift', function(){
		$('tweet-card').last().addClass('is-offscreen');
		setTimeout(function() { $('tweet-card').last().remove(); }, 300);
		$scope.addTweet();
	});

});