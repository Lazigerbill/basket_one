// callback for quote query from yahoo, to parse json and insert data into fundamental window
function load_fundamentals(url){  
  var ticker = url.query.results.results.symbol
  var peg = url.query.results.results.GrowthEst.PEGRatio
  var this_peg = parseFloat(peg[ticker]);
  var industry_peg = parseFloat(peg.Industry);
  var sector_peg = parseFloat(peg.Sector);
  var pe = url.query.results.results.GrowthEst.PriceEarnings
  var this_pe = parseFloat(pe[ticker]);
  var industry_pe = parseFloat(pe.Industry);
  var sector_pe = parseFloat(pe.Sector);
  var ge = url.query.results.results.GrowthEst.CurrentQtr
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
  


