$(document).ready(function() {
	$('.tweet_list').newsTicker({
		row_height: 100,
		max_rows: 2,
		speed: 600,
		direction: 'up',
		duration: 4000,
		autostart: 1,
		pauseOnHover: 1
	});
})