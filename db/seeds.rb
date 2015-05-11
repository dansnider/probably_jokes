# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Comedian.destroy_all

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

 # In the rake task, load tweets to memory, Tweet.all, 
 # and if tweet date is older than a certain point (30 days?)
 # and if the tweet has less than a certain rating, delete tweet.

 # have comedians, loop thru comedians, check for new unique tweets.

 # likes, tweets, comedians

 comedians = 
 [
 	"ronfunches",
 	"maxsilvestri",
 	"chrisrock",
 	"hodgman",
 	"birbigs",
 	"chelseahandler",
 	"sbellelauren",
 	"mulaney",
 	"thejoshpatten",
 	"neilhamburger",
 	"paulscheer",
 	"jimgaffigan",
 	"robcorddry",
 	"toddbarry",
 	"stephenathome",
 	"scullymike",
 	"natashaleggero",
 	"dougstanhope",
 	"chelseavperetti",
 	"amyschumer",
 	"robhuebel",
 	"unforettable",
 	"michaelianblack",
 	"kellyoxford",
 	"eugenemirman",
 	"sarahsilverman",
 	"kumailn",
 	"kristenschaaled",
 	"conanobrien",
 	"pftompkins",
 	"rejectedjokes",
 	"meganamram",
 	"pattonoswalt",
 	"perlapell",
 	"azizansari",
 	"mindykaling",
 	"joemande",
 	"robdelaney",
 	"desusnice",
 	"jennyslate",
 	"billyeichner",
 	"iamenidcoleslaw",
 	"dubstep4dads",
 	"kylekinane",
 	"andyrichter",
 	"Seinfeld2000",
 	"pourmecoffee",
 	"brendohare",
 	"dril",
 	"brendonwalsh",
 	"timheidecker"
 ]

comedians.each do |comic|
	comedian = client.user(comic)
	Comedian.create({
		id_str: comedian.id, 
		name: comedian.name, 
		screen_name: comedian.screen_name, 
		url: comedian.url.to_s,
		profile_image_url: comedian.profile_image_url.to_s,
		followers_count: comedian.followers_count
		})
end
 
 # tweets = []

 # comedians.each do |comedian|
 # 	comic_tweets = client.user_timeline(comedian, {exclude_replies: true, include_rts: false})
 # 		comic_tweets.each do |tweet|
 # 			if !tweet.text.start_with? "."
 # 				tweets << tweet
 # 			end
 # 		end
 # end






















