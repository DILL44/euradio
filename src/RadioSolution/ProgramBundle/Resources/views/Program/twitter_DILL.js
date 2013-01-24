/*https://api.twitter.com/1/statuses/user_timeline/DILL_44.json*/
var json=[
		{
			"created_at" : "Thu May 17 09:53:53 +0000 2012",
			"id" : 203060763882033152,
			"id_str" : "203060763882033152",
			"text" : "@RomainCariibou j'aurais besoin du logo de #MyBelovedCity Rapidement",
			"source" : "web",
			"truncated" : false,
			"in_reply_to_status_id" : null,
			"in_reply_to_status_id_str" : null,
			"in_reply_to_user_id" : 390314800,
			"in_reply_to_user_id_str" : "390314800",
			"in_reply_to_screen_name" : "RomainCariibou",
			"user" : {
				"id" : 212138815,
				"id_str" : "212138815",
				"name" : "Nicolas Patard",
				"screen_name" : "DILL_44",
				"location" : "Nantes",
				"url" : "http:\/\/www.developpementinternetlogiciellibre.net\/",
				"description" : "d\u00e9veloppeur web ind\u00e9pendant",
				"protected" : false,
				"followers_count" : 25,
				"friends_count" : 64,
				"listed_count" : 0,
				"created_at" : "Fri Nov 05 07:22:46 +0000 2010",
				"favourites_count" : 0,
				"utc_offset" : -36000,
				"time_zone" : "Hawaii",
				"geo_enabled" : true,
				"verified" : false,
				"statuses_count" : 33,
				"lang" : "fr",
				"contributors_enabled" : false,
				"is_translator" : false,
				"profile_background_color" : "C0DCF1",
				"profile_background_image_url" : "http:\/\/a0.twimg.com\/profile_background_images\/674725439\/a6edfb7e3d68e87264874ca185a65dd1.jpeg",
				"profile_background_image_url_https" : "https:\/\/si0.twimg.com\/profile_background_images\/674725439\/a6edfb7e3d68e87264874ca185a65dd1.jpeg",
				"profile_background_tile" : false,
				"profile_image_url" : "http:\/\/a0.twimg.com\/profile_images\/1874832290\/logotweeter_normal.png",
				"profile_image_url_https" : "https:\/\/si0.twimg.com\/profile_images\/1874832290\/logotweeter_normal.png",
				"profile_link_color" : "C0DCF1",
				"profile_sidebar_border_color" : "C0DCF1",
				"profile_sidebar_fill_color" : "1C1C1C",
				"profile_text_color" : "5C91B9",
				"profile_use_background_image" : true,
				"default_profile" : false,
				"default_profile_image" : false,
				"following" : null,
				"follow_request_sent" : null,
				"notifications" : null
			},
			"geo" : null,
			"coordinates" : null,
			"place" : null,
			"contributors" : null,
			"retweet_count" : 0,
			"favorited" : false,
			"retweeted" : false
} ];
var json;
$.ajax({
    dataType: 'json',
    success: function(data) {
        json=data;
    },
    url: 'https://api.twitter.com/1/statuses/user_timeline/NicoBivi.json'
});


function parceJS(){
	return $.getJSON("http://api.twitter.com/1/statuses/user_timeline/NicoBivi.json?callback=?",
    function(json){
    txt = '{ "parcejson" :[';
   	for (var i=0;i<json.length;i++){
   		var tweetDate = new Date(json[i].created_at);
   		txt =txt+'{"startDate":"'+tweetDate.getFullYear()+','+(tweetDate.getMonth()+1)+','+tweetDate.getDate()+','+tweetDate.getHours()+','+tweetDate.getMinutes()+'",'+
   				  '"text":"'+json[i].text+'",'+
   				  '"headline":"'+json[i]['user'.name]+'",'+
   				  ' "tag":"",'+
   				  '  "asset": {'+
   				  '      "media":"",'+
   				  '      "credit":"",'+
   				  '      "caption":""}';
   		if (i+1==json.length){
   			txt =txt+'}';
   		}else{
   			txt =txt+'},';
   		}
   	}
   	txt =txt+']}';
   	return txt;
   obj = eval ("(" + txt + ")"); 
});};

function addTweet(data){
	asset=new Array();
	asset["media"]="";
	asset["credit"]="";
	asset["caption"]="";

	tweet=new Array();
	tweet["startDate"]=dateReviver(data.created_at);
	tweet["text"]=data.text;
	tweet["headline"]=data.user.name;
	tweet["tag"]="";

	test['timeline']['date'].push(tweet);
};

parceTwitter();
function parceTwitter(){
		var txt2='';
	var str=jQuery.ajax({
		   url: 'http://api.twitter.com/1/statuses/user_timeline/NicoBivi.json?callback=?',
	    dataType: 'json',
	    success: function() {
	    	txt2=test;
	    	}
	     }).responseText;
	$(document).ready(function () {
		$("#twitterJson").text(txt2);
	});
		txt = '{ "parcejson" :[';
		for (var i=0;i<json.length;i++){
			var tweetDate = new Date(json[i].created_at);
			txt =txt+'{"startDate":"'+tweetDate.getFullYear()+','+(tweetDate.getMonth()+1)+','+tweetDate.getDate()+','+tweetDate.getHours()+','+tweetDate.getMinutes()+'",'+
					  '"text":"'+json[i].text+'",'+
					  '"headline":"'+json[i]['user'.name]+'",'+
					  ' "tag":"",'+
					  '  "asset": {'+
					  '      "media":"",'+
					  '      "credit":"",'+
					  '      "caption":""}';
			if (i+1==json.length){
				txt =txt+'}';
			}else{
				txt =txt+'},';
			}
		}
		var twitter;
		var txt='test';
		$.getJSON('http://api.twitter.com/1/statuses/user_timeline/NicoBivi.json?callback=?',function(json){
			for (var i=0;i<json.length;i++){
				var tweetDate = new Date(json[i].created_at);
				txt =txt+'{"startDate":"'+tweetDate.getFullYear()+','+(tweetDate.getMonth()+1)+','+tweetDate.getDate()+','+tweetDate.getHours()+','+tweetDate.getMinutes()+'",'+
						  '"text":"'+json[i].text+'",'+
						  '"headline":"'+json[i]['user'.name]+'",'+
						  ' "tag":"",'+
						  '  "asset": {'+
						  '      "media":"",'+
						  '      "credit":"",'+
						  '      "caption":""}';
				if (i+1==json.length){
					txt =txt+'}';
				}else{
					txt =txt+'},';
				} 
			} ;
			                        
		txt =txt+']}';
		twitter=txt;
		}); 
		$(document).ready(function () {
			$("#twitterJson").text(txt);
		});	
	}; 
