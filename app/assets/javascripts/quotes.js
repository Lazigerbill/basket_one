function show_quote(url){  
  var quote = url.query.results.quote;  
  var name = quote.Name;  
  var change = quote.Change;
  var yearlow = quote.YearLow;
  var yearhigh = quote.YearHigh;
  var range = yearlow + " - " + yearhigh;
  var lasttrade = quote.LastTradePriceOnly;
  var volume = quote.volume;
  var mcap = quote.MarketCapitalization;
  var pre_close = Math.round((parseFloat(quote.LastTradePriceOnly) - parseFloat(quote.Change))*100)/100

  $('#company').append(name);
  $('#last_trade').append(lasttrade);
  $('#change').append(change);
  $('#last_update').before(pre_close);
  $('#range').append(range);
}  

$('ticker_window').ready(function(){
  if(parseFloat($('#change').text())>=0){
    $('#last_trade').before("<img id=\"tick_arrow\" src=\"/assets/uptick.gif\">");
    $('#change').css({"color":"green"});
  } else {
    $('#last_trade').before("<img id=\"tick_arrow\" src=\"/assets/downtick.gif\">");
    $('#change').css({"color":"red"});
  }
})


