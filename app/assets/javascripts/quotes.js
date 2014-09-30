// callback for quote query from yahoo, to parse json and insert data into ticker window
function show_quote(url){  
  var quote = url.query.results.quote;  
  var name = quote.Name;  
  var change = quote.Change;
  var yearlow = quote.YearLow;
  var yearhigh = quote.YearHigh;
  var range = yearlow + " - " + yearhigh;
  var lasttrade = Math.round(parseFloat(quote.LastTradePriceOnly)*100)/100;
  var volume = quote.volume;
  var mcap = quote.MarketCapitalization;
  var pre_close = Math.round((parseFloat(quote.LastTradePriceOnly) - parseFloat(quote.Change))*100)/100;

  $('#company').text(name);
  $('#last_trade').text(lasttrade);
  $('#change').text(change);
  $('#pre_close').text(pre_close);
  $('#range').text(range);

// to change color and direction of ticker arrow, depending on 'change'
$('ticker_window').ready(function(){
  if(parseFloat($('#change').text())>=0){
    $('#tick').html("<img id=\"tick_arrow\" src=\"/assets/uptick.gif\">");
    $('#change').css({"color":"green"});
  } else {
    $('#tick').html("<img id=\"tick_arrow\" src=\"/assets/downtick.gif\">");
    $('#change').css({"color":"red"});
  }
});
}  

// to auto retrive live stock update every ?? seconds

setInterval(function(){
$('#last_trade').effect("pulsate");
$('#change').effect("highlight");
var url1 = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22'+ticker+'%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=show_quote'
$.getScript(url1)
}, 15000);

