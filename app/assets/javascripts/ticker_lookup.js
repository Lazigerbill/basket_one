$(document).ready(function(){
	$('#tick_lookup').typing({
    stop: function () {
        var content = $('#tick_lookup').val();
        console.log(content);
        var lookup_url = 'http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=hsbc&callback=' + content + 
        '.Finance.SymbolSuggest.ssCallback'

        $.getScript(lookup_url).done(function show_lookup(url){
        	var comp = url.ResultSet
        	console.log(comp)
        })

        
    },
    delay: 400
});



});



function show_news(url){  
  var items = url.query.results.item;  
  var headline = [];  
  var output = " "
  var no_items=items.length;  
  for(var i=0;i<(no_items/2);i++){  
    var title = items[i].title;  
    var link = items[i].link;   
    headline[i] = "<li id=\"headline\"><a href='" + link + "'>"+title+"</a></li>";  
    output += headline[i];
  };  
  // Place news stories in div tag
  $('.newsticker').html(output)

}  
