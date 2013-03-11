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


    if( $("#sidebar #programs").length > 0) {
        $("#sidebar #programs").carouFredSel({
            direction: 'down',
            prev: '.up',
            next: '.down',
            auto: false,
            mousewheel: true,
            width: '100%',
            height: '830px',
            items: {
                visible: 5,
                height: 'auto'
            },
            scroll: {
                items: 1
            }
        });
    }
	
	if( $("#sidebar #blogs").length > 0) {
        $("#sidebar #blogs").carouFredSel({
            direction: 'down',
            prev: '.up',
            next: '.down',
            auto: false,
            mousewheel: true,
            width: '100%',
            height: '490px',
            items: {
                visible: 3,
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


  // jPlayer
  /*var stereoPlaylist = new jPlayerPlaylist({
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
  );*/

});