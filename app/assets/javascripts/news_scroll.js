  // Parses returned response and extracts  
//     // the title, links, and text of each news story.  


function show_news(url){  
  var items = url.query.results.item;  
  var headline = [];  
  var output = " "
  var no_items=items.length;  
  for(var i=0;i<no_items;i++){  
    var title = items[i].title;  
    var link = items[i].link;   
    headline[i] = "<li id=\"headline\"><a href='" + link + "'>"+title+"</a></li>";  
    output += headline[i];
  };  
  // Place news stories in div tag
  $('.newsticker').html(output)

}  


$('#headline').ready(function() {
  $('.newsticker').newsTicker({
    row_height: 20,
    max_rows: 2,
    speed: 600,
    direction: 'down',
    duration: 4000,
    autostart: 1,
    pauseOnHover: 0
  });
}) 

