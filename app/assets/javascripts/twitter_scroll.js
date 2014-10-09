$(document).on('ready page:load', function(){
	$('.tweet_list').newsTicker({
		row_height: 101,
		max_rows: 3,
		speed: 1200,
		direction: 'up',
		duration: 6000,
		autostart: 1,
		pauseOnHover: 1
	});

	$('#sparkline').sparkline(tweet_count, {
		type: "bar",
		tooltipSuffix: " tweets"
	});
})


