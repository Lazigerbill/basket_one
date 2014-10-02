var his_array
function load_data(historical_data){
	var quoteData = [];
	$.each(historical_data.query.results.quote, function(index, value) {
	    var theTime = value.Date;
	    var milliTime = new Date(theTime);
	    milliTime = milliTime.getTime();
	    
	    var results = [milliTime, parseFloat(value.Adj_Close)];

	    quoteData.push(results);
	});
	    his_array = quoteData.reverse();
    
}

$(document).on('ready page:load', function(){
	//Setting day range for YQL
	var now = new Date();
	var dd = now.getDate();
	var mm = now.getMonth()+1;    
	var yyyy = now.getFullYear();
	if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 
    var end_date = yyyy + "-" + mm + "-" + dd;
    var start_date = (yyyy-1) + "-" + mm + "-" + dd;


	//parsing YQL query
	var historical_url = "http://query.yahooapis.com/v1/public/yql?" +
	"q=select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol%20%3D%20%22"
	+ qticker + "%22%20and%20startDate%20%3D%20%22" + start_date + "%22%20and%20endDate%20%3D%20%22"
	+ end_date + "%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=load_data"
	
	$.getScript(historical_url).done(function (){

	// Create the chart
	    $('#container').highcharts('StockChart', {


	    	rangeSelector : {
	    		selected : 1
	    	},

	    	title : {
	    		text : qticker + ' Stock Price'
	    	},
	    	

	    	rangeSelector: {
	    	    enabled: true,
	    	    inputEnabled: false
	    	},

	    	navigator : {
	    	                enabled : false
	    	            },

	    	series : [{
	    		name : qticker + ' Stock Price',
	    		data : his_array,
	    		type : 'area',
	    		threshold : null,
	    		tooltip : {
	    			valueDecimals : 2
	    		},

	    		fillColor : {
	    			linearGradient : {
	    				x1: 0,
	    				y1: 0,
	    				x2: 0,
	    				y2: 1
	    			},
	    			stops : [
	    			[0, Highcharts.getOptions().colors[0]],
	    			[1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
	    			]
	    		}
	    		
	    	}]

		});    
	});
});




