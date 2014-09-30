
function load_fundamentals(url){  
  ticker = url.query.results.results.symbol
  peg = url.query.results.results.GrowthEst.PEGRatio
  pe = url.query.results.results.GrowthEst.PriceEarnings
  this_peg = parseFloat(peg[ticker]);
  this_pe = parseFloat(pe[ticker]);
  industry_peg = parseFloat(peg.Industry);
  industry_pe = parseFloat(pe.Industry);
  sector_peg = parseFloat(peg.Sector);
  sector_pe = parseFloat(pe.Sector);
  sp_peg = parseFloat(peg.SP500);
  sp_pe = parseFloat(pe.SP500);
};  
  
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
});


