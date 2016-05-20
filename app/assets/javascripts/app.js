angular.module('probablyJokes', ['ngSanitize'])
.controller('TweetController', function($scope, $compile) {

	$scope.addTweet = function() {
		var el = $compile( "<tweet-card class='b-card'></tweet-card>" )($scope);
		$('.b-card_container').prepend(el);
	}

	$scope.$on('cardShift', function(){
		$('tweet-card').last().addClass('b-card--offscreen');
		setTimeout(function() { $('tweet-card').last().remove(); }, 300);
		$scope.addTweet();
	});

});