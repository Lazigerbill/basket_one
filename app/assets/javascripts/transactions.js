var ready;
ready = function() {  
	$('#buy').click(function(){
		$('#buy_action').attr('value', qticker + "," + $('#last_trade').text());
	});

}
  
$(document).ready(ready);	
$(document).on('page:load', ready);	