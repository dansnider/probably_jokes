console.log('loaded jokes.js')

var tweetUrl = "/tweet.json",
		loadTweet;
		

loadTweet = function(){
	$('#joke-body').empty().fadeOut();
	$('#name').empty().fadeOut();
	$('#screen-name').empty().fadeOut();
	$('#avatar-container').empty().fadeOut();
	$('.avatar').remove().fadeOut();
	$('.icon-text').empty().fadeOut();
	$.ajax({
	  method: "GET",
	  dataType: "json",
	  url: tweetUrl,
	  success: function(data){
	  	console.log(data);
	  	$('#name').before('<img class="avatar" src="' + data.comedian_image_url + '"/>').hide().fadeIn();
	  	$('#name').append(data.comedian_name).hide().fadeIn();
	  	$('#screen-name').append("@" + data.comedian_screen_name).hide().fadeIn()
	  	$('#joke-body').append(data.text).hide().fadeIn();
	  	$('#rt-count').append(data.retweet_count).hide().fadeIn();
	  	$('#fav-count').append(data.favorite_count).hide().fadeIn();
	  }
	})
}

$(function(){
	
	loadTweet();
	
	$('#get-tweet').on('click', function(){
		loadTweet();
	});
})
