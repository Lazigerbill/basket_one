$(document).ready(function() {
	$('.tweet_list').newsTicker({
		row_height: 77,
		max_rows: 3,
		speed: 600,
		direction: 'up',
		duration: 4000,
		autostart: 1,
		pauseOnHover: 1
	});
})