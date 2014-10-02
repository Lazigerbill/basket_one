// callback for quote query from yahoo, to parse json and insert data into fundamental window
function load_fundamentals(url_fund){  
  var ticker = url_fund.query.results.results.symbol
  var peg = url_fund.query.results.results.GrowthEst.PEGRatio
  var this_peg = parseFloat(peg[ticker]);
  var industry_peg = parseFloat(peg.Industry);
  var sector_peg = parseFloat(peg.Sector);
  var pe = url_fund.query.results.results.GrowthEst.PriceEarnings
  var this_pe = parseFloat(pe[ticker]);
  var industry_pe = parseFloat(pe.Industry);
  var sector_pe = parseFloat(pe.Sector);
  var ge = url_fund.query.results.results.GrowthEst.CurrentQtr
  var this_ge = parseFloat(ge[ticker]);
  var industry_ge = parseFloat(ge.Industry);
  var sector_ge = parseFloat(ge.Sector);


  $(document).on('ready page:load', function(){
    // 1st chart ***PEG***
    $("#PEGChart").drawDoughnutChart([
      { 
        title: ticker,
        value: this_peg,  
        color: "#0000FF" 
      },
      { 
        title: "Industry",
        value: industry_peg,   
        color: "#00FF00" 
      },
      { 
        title: "Sector",
        value: sector_peg,   
        color: "#FF0000" 
      },
    ], "PEG");


    // 2nd chart ***PE***
    setTimeout(function(){
    $("#PEChart").drawDoughnutChart([
      { 
        title: ticker,
        value: this_pe,  
        color: "#0000FF" 
      },
      { 
        title: "Industry",
        value: industry_pe,   
        color: "#00FF00" 
      },
      { 
        title: "Sector",
        value: sector_peg,   
        color: "#FF0000" 
      },
    ], "PE");
    }, 400);
    // 3nd chart ***Growth Est***
    setTimeout(function(){
    $("#growth_est").drawDoughnutChart([
      { 
        title: ticker,
        value: this_ge,  
        color: "#0000FF" 
      },
      { 
        title: "Industry",
        value: industry_ge,   
        color: "#00FF00" 
      },
    ], "Growth");  
    }, 800);  
  });
};  
// Here are the key stats
$(document).on('ready page:load', function(){
  var url_keystats = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.stocks%20where%20symbol%3D%22'
  + qticker + 
  '%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=load_keystats'
  $.getScript(url_keystats)
});
  
function load_keystats(url_keystats){
  var data = url_keystats.query.results.stock;
  var ticker = data.symbol.toUpperCase();
  var sector = data.Sector;
  var industry = data.Industry;
  $('#trading_ticker').text(ticker);
  $('#sector').text(sector);
  $('#industry').text(industry);
}

