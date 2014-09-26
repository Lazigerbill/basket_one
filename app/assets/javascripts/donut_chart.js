$(document).on('ready page:load', function(){
  
// 1st chart ***ROE***
  var fund_goal = parseInt($('#fund_goal').text())
  var current_fund = parseInt($('#current_fund').text())
  var fund_completetion = parseInt($('#fund_completetion').text())
  if(current_fund>=fund_goal){
    var reminder = 0;
  } else {
    var reminder = fund_goal - current_fund;
  }
  
$("#ROEChart").drawDoughnutChart([
  { 
    title: "TD Bank",
    value : reminder,  
    color: "#005C00" 
  },
  { 
    title: "Industry Avg",
    value:  current_fund,   
    color: "#00FF00" 
  }
]);

// 2nd chart ***EPS***
  var fund_goal = parseInt($('#fund_goal').text())
  var current_fund = parseInt($('#current_fund').text())
  var fund_completetion = parseInt($('#fund_completetion').text())
  if(current_fund>=fund_goal){
    var reminder = 0;
  } else {
    var reminder = fund_goal - current_fund;
  }
  
$("#EPSChart").drawDoughnutChart([
  { 
    title: "TD Bank",
    value : reminder,  
    color: "#005C00" 
  },
  { 
    title: "Industry Avg",
    value:  current_fund,   
    color: "#00FF00" 
  }
]);

})
