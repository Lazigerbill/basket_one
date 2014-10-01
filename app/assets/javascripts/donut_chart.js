// callback for quote query from yahoo, to parse json and insert data into fundamental window
function load_fundamentals(url){  
  var ticker = url.query.results.results.symbol
  var peg = url.query.results.results.GrowthEst.PEGRatio
  var pe = url.query.results.results.GrowthEst.PriceEarnings
  var this_peg = parseFloat(peg[ticker]);
  var this_pe = parseFloat(pe[ticker]);
  var industry_peg = parseFloat(peg.Industry);
  var industry_pe = parseFloat(pe.Industry);
  var sector_peg = parseFloat(peg.Sector);
  var sector_pe = parseFloat(pe.Sector);
  var sp_peg = parseFloat(peg.SP500);
  var sp_pe = parseFloat(pe.SP500);

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
    title: "S&P500",
    value: sp_peg,   
    color: "#FF0000" 
  },
], "PEG");


// 2nd chart ***PE***
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
    title: "S&P500",
    value: sp_pe,   
    color: "#FF0000" 
  },
], "PE");

// 3nd chart ***Growth Est***
$("#growth_est").drawDoughnutChart([
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
    title: "S&P500",
    value: sp_pe,   
    color: "#FF0000" 
  },
], "PE");  
});
};  
  


