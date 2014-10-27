// Parses returned response and extracts  
// the title, links, and text of each news story.

var ready;
ready = function() {  
  var $newsWindow = $('.news_window');
  if ($newsWindow.length != 0) {
    var url_news = "https://query.yahooapis.com/v1/public/yql?q=select%20title%2C%20link%20from%20rss%20where%20url%3D%22http%3A%2F%2Ffinance.yahoo.com%2Frss%2Fheadline%3Fs%3D" + qticker + "%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=window.show_news"
    $.getScript(url_news);
  }
};  

  show_news = function(url) {  
    var items = url.query.results.item;  
    var headline = [];  
    var output = " "
    var no_items=items.length;  

    for (var i=0;i<(no_items/2);i++) {  
      var title = items[i].title.replace(/'/g, " ");  
      var link = items[i].link;   
      headline[i] = "<li id=\"headline\"><a href='" + link + "'>"+ title + "</a>" + 
      "<a href=\'https://twitter.com/intent/tweet?text=$" + qticker + "%20" + title + "&url=" + link + "\'>" + 
      " <i class=\"fa fa-spinner fa-spin\"></i>" +
      "</a></li>";

      output += headline[i];
    } 
    // Place news stories in div tag
    $('.newsticker').html(output);

    $('.newsticker').newsTicker({
      row_height: 36,
      max_rows: 1,
      speed: 600,
      direction: 'down',
      duration: 4000,
      autostart: 1,
      pauseOnHover: 1
    });
  }




$('.news_window').ready(ready);
$('.news_window').on('page:load', ready);

