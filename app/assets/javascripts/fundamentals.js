// callback for quote query from yahoo, to parse json and insert data into fundamental window

var ready;
ready = function() {  

  load_fundamentals = function(url_doughnut){  
    var ticker = url_doughnut.query.results.results.symbol
    var peg = url_doughnut.query.results.results.GrowthEst.PEGRatio
    var this_peg = parseFloat(peg[ticker]);
    var industry_peg = parseFloat(peg.Industry);
    var sector_peg = parseFloat(peg.Sector);
    var pe = url_doughnut.query.results.results.GrowthEst.PriceEarnings
    var this_pe = parseFloat(pe[ticker]);
    var industry_pe = parseFloat(pe.Industry);
    var sector_pe = parseFloat(pe.Sector);
    var ge = url_doughnut.query.results.results.GrowthEst.CurrentQtr
    var this_ge = parseFloat(ge[ticker]);
    var industry_ge = parseFloat(ge.Industry);
    var sector_ge = parseFloat(ge.Sector);
      
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
  }

  load_keystats = function(url_keystats){
    var data = url_keystats.query.results.stock;
    var ticker = data.symbol.toUpperCase();
    var sector = data.Sector;
    var industry = data.Industry;
    $('#trading_ticker').text(ticker);
    $('#sector').text(sector);
    $('#industry').text(industry);
  }

  var $fundamentalsWindow = $('.fundamentals_window');
  if ($fundamentalsWindow.length != 0) {
  
    var url_doughnut = 'https://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20yahoo.finance.analystestimate%20WHERE%20symbol%3D\''
    + qticker + '\'&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=load_fundamentals'
    $.getScript(url_doughnut)

    var url_keystats = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.stocks%20where%20symbol%3D%22'
    + qticker + 
    '%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=load_keystats'
    $.getScript(url_keystats)
  }
}
  
$(document).ready(ready);
$(document).on('page:load', ready);



