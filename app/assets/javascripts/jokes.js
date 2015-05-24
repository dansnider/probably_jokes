console.log('loaded jokes.js')

var tweetUrl = "/tweet.json",
		loadTweet;
		

loadTweet = function(){
	$('#joke-body').empty();
	$('#comedian-name').empty();
	$.ajax({
	  method: "GET",
	  dataType: "json",
	  url: tweetUrl,
	  success: function(data){
	  	console.log(data)
	  	$('#comedian-name').append(data.comedian_name)
	  	$('#joke-body').append(data.text)
	  }
	})
}

$(function(){
	
	loadTweet();
	
	$('#get-tweet').on('click', function(){
		loadTweet();
	});
})
