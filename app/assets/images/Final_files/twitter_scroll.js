$(document).on('ready page:load', function(){
	$('.tweet_list').newsTicker({
		row_height: 79,
		max_rows: 3,
		speed: 600,
		direction: 'up',
		duration: 4000,
		autostart: 1,
		pauseOnHover: 1
	});

	$('#sparkline').sparkline(tweet_count, {
		type: "bar",
		tooltipSuffix: " tweets"
	});
})


;
