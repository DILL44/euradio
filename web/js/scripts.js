jQuery(document).ready( function($) {
    //menu
    var $menu = $("#navigation");
    $menu.superfish({
        animation: {
            opacity: "show",
            height: "show"
        },
        speed: "fast",
        delay: 250
    });

    $("#footer").find(".twitter_update_list > ul").cycle({
        cleartypeNoBg: true
    });


    if( $("#main-slider").length > 0) {
        $("#main-slider").flexslider({
            'controlNav': true,
            'directionNav': false
        });
    }

    if( $("#video-slider").length > 0) {
        $("#video-slider").flexslider({
            'controlNav': false,
            'directionNav': true,
            'controlsContainer': '.vid-nav',
            'slideshow': false,
            after: function(slider) {
                var PrevSlideNo = parseInt(slider.currentSlide - 1);
                var PrevSlide = slider.slides.eq(PrevSlideNo).find('iframe');
                var PrevSlideSrc = PrevSlide.attr('src');
                PrevSlide.attr('src', PrevSlideSrc);
                console.log(PrevSlideSrc);
            }
        });
    }

    if( $(".home #locations").length > 0) {
        $(".home #locations").carouFredSel({
            direction: 'down',
            prev: '.up',
            next: '.down',
            auto: false,
            mousewheel: true,
            width: '100%',
            height: '348px',
            items: {
                visible: 4,
                height: 'auto'
            },
            scroll: {
                items: 1
            }
        });
    }

    if( $("#sidebar #locations").length > 0) {
        $("#sidebar #locations").carouFredSel({
            direction: 'down',
            prev: '.up',
            next: '.down',
            auto: false,
            mousewheel: true,
            width: '100%',
            height: '480px',
            items: {
                visible: 5,
                height: 'auto'
            },
            scroll: {
                items: 1
            }
        });
    }

    if( $("#video-slider").length > 0) {
	    $("#video-slider").fitVids();
    }

    // Responsive Menu
    // Create the dropdown base
    $("<select />").appendTo("nav");

    // Create default option "Go to..."
    $("<option />", {
       "selected": "selected",
       "value"   : "",
       "text"    : "Go to..."
    }).appendTo("nav select");

    // Populate dropdown with menu items
    $("nav a").each(function() {
     var el = $(this);
     $("<option />", {
         "value"   : el.attr("href"),
         "text"    : el.text()
     }).appendTo("nav select");
    });

    $("nav select").change(function() {
      window.location = $(this).find("option:selected").val();
    });

	//
	// Google Maps code
	//
	if( $('#map').length > 0)
	{

		var $firstChild = $('#locations li:first-child a'),
			firstLocLat = $firstChild.data('lat'),
			firstLocLong = $firstChild.data('long');
	
		var firstLocation = new google.maps.LatLng(firstLocLat, firstLocLong);
	
		//center map to first event
		var myOptions = {
			zoom: 12,
			center: firstLocation,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			streetViewControl: false,
			mapTypeControl: false
		};
		var map = new google.maps.Map(document.getElementById("map"), myOptions);
	
		//let's get our locations and store them
		var $locations = $("#locations li a:first-child");
		var markers = [];
	
		$locations.each(function(i) {
			var infoText = $(this).find('b').text(),
				latitude = $(this).data('lat'),
				longtitude = $(this).data('long'),
				point = new google.maps.LatLng(latitude, longtitude),
				marker = new google.maps.Marker({
					position: point, 
					map: map,
					title: infoText
				});
	
			//add the markers to an array for later use
			markers[i] = marker;
	
			$(this).click(function(evt) {
				$locations.parent().removeClass('selected-location');
				$(this).parent().addClass('selected-location');

                var $text = $(this).find('h4').text();
                    $text += "<br/>";
				    $text += $(this).find('b').text();
                    $text += "<br/>";
                    $text += $(this).find('time').text();
	
				setPoint(marker, i, $text);
				evt.preventDefault();
			});
		});
	
	
		function setPoint(marker, index, txt) {
			var infowindow = new google.maps.InfoWindow({
				content: txt
			});
	
			infowindow.open(map, marker);
		
			map.panTo(marker.getPosition());
		}

	} //end if( $('#map').length > 0)


  // jPlayer
  var stereoPlaylist = new jPlayerPlaylist({
    jPlayer: '#jp500',
    cssSelectorAncestor: "#jp-203" },
    [
      {
        title: "I need your template",
        artist: "DJ Igniter feat Michael Jackson",
        m4a:"http://www.jplayer.org/audio/m4a/TSP-01-Cro_magnon_man.m4a",
        oga:"http://www.jplayer.org/audio/ogg/TSP-01-Cro_magnon_man.ogg"
      }
    ],
    {
      swfPath: "js",
      supplied: "m4a, oga",
      playListOptions: {
        enableRemoveControls: true
      }
    }
  );

});