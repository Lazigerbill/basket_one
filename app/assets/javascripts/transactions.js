var ready;
ready = function() {  
	$('#buy').click(function(){
		$('#buy_action').attr('value', qticker + "," + $('#last_trade').text());
	});

	$('#sell').click(function(){
		$('#sell_action').attr('value', qticker + "," + $('#last_trade').text());
	});

	$('#transaction_table').DataTable({
        "order": [[ 0, "desc" ],[1, "asc"]]
    });
}
  
$(document).ready(ready);	
$(document).on('page:load', ready);	