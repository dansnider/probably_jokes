var PJ = {};

PJ.openShareWindow = function(link) {
	var w = 835,
			h = 500,
			scrollbars 	= 'yes',
			left = (screen.width / 2) - (w / 2),
			top = (screen.height / 2) - (h / 2),
			popup = window.open(
							link,
							'shareWindow',
							'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars='+scrollbars+', resizable=yes, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left
						);
		return popup;
}

PJ.shortenUrl = function(longUrl) {
	var login = 'probablyjokes',
			apiKey = 'R_c36df3a85ac84486aec1f05e495b5f82'
}