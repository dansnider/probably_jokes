
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

 comedians = 
 [
 	"ronfunches",
 	"maxsilvestri",
 	"hodgman",
 	"birbigs",
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
 	"chelseaperetti",
 	"amyschumer",
 	"robhuebel",
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
 	"timheidecker",
 	"thekidmero",
 	"iankarmel",
 	"fart",
 	"boring_as_heck",
 	"julieklausner",
 	"averymonsen",
 	"andylevy",
 	"samgrittner",
 	"mkupperman",
 	"damienfahey",
 	"fred_delicious",
 	"joshgondelman",
 	"mikedrucker",
 	"mallelis",
 	"tricialockwood",
 	"briangaar",
 	"mat_johnson",
 	"untresor",
 	"froghammer",
 	"mattytalks",
 	"hellolanemoore",
 	"weismanjake",
 	"bridger_w"
 ]

comedians.each do |comic|
	comedian = client.user(comic)
	unless comedian.nil?
		Comedian.create({
			id_str: comedian.id, 
			name: comedian.name, 
			screen_name: comedian.screen_name, 
			url: comedian.url.to_s,
			profile_image_url: comedian.profile_image_url.to_s,
			followers_count: comedian.followers_count
			})
	end
end
