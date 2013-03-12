Copyright 2010, Brandon Aaron (http://brandonaaron.net/)
 
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
/**************************************\
 *  cssAnimate 1.1.5 for jQuery       *
 *  (c) 2012 - Clemens Damke          *
 *  Licensed under MIT License        *
 *  Works with jQuery >=1.4.3         *
\**************************************/
(function (a) {
    var b = ["Webkit", "Moz", "O", "Ms", "Khtml", ""];
    var c = ["borderRadius", "boxShadow", "userSelect", "transformOrigin", "transformStyle", "transition", "transitionDuration", "transitionProperty", "transitionTimingFunction", "backgroundOrigin", "backgroundSize", "animation", "filter", "zoom", "columns", "perspective", "perspectiveOrigin", "appearance"];
    a.fn.cssSetQueue = function (b, c) {
        v = this;
        var d = v.data("cssQueue") ? v.data("cssQueue") : [];
        var e = v.data("cssCall") ? v.data("cssCall") : [];
        var f = 0;
        var g = {};
        a.each(c, function (a, b) {
            g[a] = b
        });
        while (1) {
            if (!e[f]) {
                e[f] = g.complete;
                break
            }
            f++
        }
        g.complete = f;
        d.push([b, g]);
        v.data({
            cssQueue: d,
            cssRunning: true,
            cssCall: e
        })
    };
    a.fn.cssRunQueue = function () {
        v = this;
        var a = v.data("cssQueue") ? v.data("cssQueue") : [];
        if (a[0]) v.cssEngine(a[0][0], a[0][1]);
        else v.data("cssRunning", false);
        a.shift();
        v.data("cssQueue", a)
    };
    a.cssMerge = function (b, c, d) {
        a.each(c, function (c, e) {
            a.each(d, function (a, d) {
                b[d + c] = e
            })
        });
        return b
    };
    a.fn.cssAnimationData = function (a, b) {
        var c = this;
        var d = c.data("cssAnimations");
        if (!d) d = {};
        if (!d[a]) d[a] = [];
        d[a].push(b);
        c.data("cssAnimations", d);
        return d[a]
    };
    a.fn.cssAnimationRemove = function () {
        var b = this;
		if (b.data("cssAnimations") !=undefined) {
			var c = b.data("cssAnimations");
			var d = b.data("identity");
			a.each(c, function (a, b) {
				c[a] = b.splice(d + 1, 1)
			});
			b.data("cssAnimations", c)
		}
    };
	
	
    a.css3D = function (c) {
        a("body").data("cssPerspective", isFinite(c) ? c : c ? 1e3 : 0).cssOriginal(a.cssMerge({}, {
            TransformStyle: c ? "preserve-3d" : "flat"
        }, b))
    };
    a.cssPropertySupporter = function (d) {
        a.each(c, function (c, e) {
            if (d[e]) a.each(b, function (a, b) {
                var c = e.substr(0, 1);
                d[b + c[b ? "toUpperCase" : "toLowerCase"]() + e.substr(1)] = d[e]
            })
        });
        return d
    };
    a.cssAnimateSupport = function () {
        var c = false;
        a.each(b, function (a, b) {
            c = document.body.style[b + "AnimationName"] !== undefined ? true : c
        });
        return c
    };
    a.fn.cssEngine = function (c, d) {
        function f(a) {
            return String(a).replace(/([A-Z])/g, "-$1").toLowerCase()
        }
        var e = this;
        var e = this;
        if (typeof d.complete == "number") e.data("cssCallIndex", d.complete);
        var g = {
            linear: "linear",
            swing: "ease",
            easeIn: "ease-in",
            easeOut: "ease-out",
            easeInOut: "ease-in-out"
        };
        var h = {};
        var i = a("body").data("cssPerspective");
        if (c.transform) a.each(b, function (a, b) {
            var d = b + (b ? "T" : "t") + "ransform";
            var g = e.cssOriginal(f(d));
            var j = c.transform;
            if (!g || g == "none") h[d] = "scale(1)";
            c[d] = (i && !/perspective/gi.test(j) ? "perspective(" + i + ") " : "") + j
        });
        c = a.cssPropertySupporter(c);
        var j = [];
        a.each(c, function (a, b) {
            j.push(f(a))
        });
        var k = false;
        var l = [];
        var m = [];
	
	
	
	
	
	
	
		if (j !=undefined) {
			for (var n = 0; n < j.length; n++) {
				l.push(String(d.duration / 1e3) + "s");
				var o = g[d.easing];
				m.push(o ? o : d.easing)
			}
		
			l = e.cssAnimationData("dur", l.join(", ")).join(", ");
			m = e.cssAnimationData("eas", m.join(", ")).join(", ");
			var p = e.cssAnimationData("prop", j.join(", "));
			e.data("identity", p.length - 1);
			p = p.join(", ");
			var q = {
				TransitionDuration: l,
				TransitionProperty: p,
				TransitionTimingFunction: m
			};
			var r = {};
			r = a.cssMerge(r, q, b);
			var s = c;
			a.extend(r, c);
			if (r.display == "callbackHide") k = true;
			else if (r.display) h["display"] = r.display;
			e.cssOriginal(h);
		}
	
        setTimeout(function () {
            e.cssOriginal(r);
            var b = e.data("runningCSS");
            b = !b ? s : a.extend(b, s);
            e.data("runningCSS", b);
            setTimeout(function () {
                e.data("cssCallIndex", "a");
                if (k) e.cssOriginal("display", "none");
             


				
				e.cssAnimationRemove();
                if (d.queue) e.cssRunQueue();
                if (typeof d.complete == "number") {
                    e.data("cssCall")[d.complete].call(e);
                    e.data("cssCall")[d.complete] = 0
                } else d.complete.call(e)
            }, d.duration)
        }, 0)
    };
	
    a.str2Speed = function (a) {
        return isNaN(a) ? a == "slow" ? 1e3 : a == "fast" ? 200 : 600 : a
    };
	
    a.fn.cssAnimate = function (b, c, d, e) {
        var f = this;
        var g = {
            duration: 0,
            easing: "swing",
            complete: function () {},
            queue: true
        };
        var h = {};
        h = typeof c == "object" ? c : {
            duration: c
        };
        h[d ? typeof d == "function" ? "complete" : "easing" : 0] = d;
        h[e ? "complete" : 0] = e;
        h.duration = a.str2Speed(h.duration);
        a.extend(g, h);
        if (a.cssAnimateSupport()) {
            f.each(function (c, d) {
                d = a(d);
                if (g.queue) {
                    var e = !d.data("cssRunning");
                    d.cssSetQueue(b, g);
                    if (e) d.cssRunQueue()
                } else d.cssEngine(b, g)
            })
        } else f.animate(b, g);
        return f
    };
    a.cssPresetOptGen = function (a, b) {
        var c = {};
        c[a ? typeof a == "function" ? "complete" : "easing" : 0] = a;
        c[b ? "complete" : 0] = b;
        return c
    };
    a.fn.cssFadeTo = function (b, c, d, e) {
        var f = this;
        opt = a.cssPresetOptGen(d, e);
        var g = {
            opacity: c
        };
        opt.duration = b;
        if (a.cssAnimateSupport()) {
            f.each(function (b, d) {
                d = a(d);
                if (d.data("displayOriginal") != d.cssOriginal("display") && d.cssOriginal("display") != "none") d.data("displayOriginal", d.cssOriginal("display") ? d.cssOriginal("display") : "block");
                else d.data("displayOriginal", "block");
                g.display = c ? d.data("displayOriginal") : "callbackHide";
                d.cssAnimate(g, opt)
            })
        } else f.fadeTo(b, opt);
        return f
    };
    a.fn.cssFadeOut = function (b, c, d) {
        if (a.cssAnimateSupport()) {
            if (!this.cssOriginal("opacity")) this.cssOriginal("opacity", 1);
            this.cssFadeTo(b, 0, c, d)
        } else this.fadeOut(b, c, d);
        return this
    };
    a.fn.cssFadeIn = function (b, c, d) {
        if (a.cssAnimateSupport()) {
            if (this.cssOriginal("opacity")) this.cssOriginal("opacity", 0);
            this.cssFadeTo(b, 1, c, d)
        } else this.fadeIn(b, c, d);
        return this
    };
    a.cssPx2Int = function (a) {
        return a.split("p")[0] * 1
    };
    a.fn.cssStop = function () {
        var c = this,
            d = 0;
        c.data("cssAnimations", false).each(function (f, g) {
            g = a(g);
            var h = {
                TransitionDuration: "0s"
            };
            var i = g.data("runningCSS");
            var j = {};
            if (i) a.each(i, function (b, c) {
                c = isFinite(a.cssPx2Int(c)) ? a.cssPx2Int(c) : c;
                var d = [0, 1];
                var e = {
                    color: ["#000", "#fff"],
                    background: ["#000", "#fff"],
                    "float": ["none", "left"],
                    clear: ["none", "left"],
                    border: ["none", "0px solid #fff"],
                    position: ["absolute", "relative"],
                    family: ["Arial", "Helvetica"],
                    display: ["none", "block"],
                    visibility: ["hidden", "visible"],
                    transform: ["translate(0,0)", "scale(1)"]
                };
                a.each(e, function (a, c) {
                    if ((new RegExp(a, "gi")).test(b)) d = c
                });
                j[b] = d[0] != c ? d[0] : d[1]
            });
            else i = {};
            h = a.cssMerge(j, h, b);
            g.cssOriginal(h);
            setTimeout(function () {
                var b = a(c[d]);
                b.cssOriginal(i).data({
                    runningCSS: {},
                    cssAnimations: {},
                    cssQueue: [],
                    cssRunning: false
                });
                if (typeof b.data("cssCallIndex") == "number") b.data("cssCall")[b.data("cssCallIndex")].call(b);
                b.data("cssCall", []);
                d++
            }, 0)
        });
        return c
    };
    a.fn.cssDelay = function (a) {
        return this.cssAnimate({}, a)
    };
    a.fn.cssOriginal = a.fn.css;
   
})(jQuery)
/*
 * jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
 *
 * Uses the built in easing capabilities added In jQuery 1.1
 * to offer multiple easing options
 *
 * TERMS OF USE - jQuery Easing
 * 
 * Open source under the BSD License. 
 * 
 * Copyright © 2008 George McGinley Smith
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
*/

// t: current time, b: begInnIng value, c: change In value, d: duration
jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutQuad',
	swing: function (x, t, b, c, d) {
		//alert(jQuery.easing.default);
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeInQuad: function (x, t, b, c, d) {
		return c*(t/=d)*t + b;
	},
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeInOutQuad: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t + b;
		return -c/2 * ((--t)*(t-2) - 1) + b;
	},
	easeInCubic: function (x, t, b, c, d) {
		return c*(t/=d)*t*t + b;
	},
	easeOutCubic: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t + 1) + b;
	},
	easeInOutCubic: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
	},
	easeInQuart: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t + b;
	},
	easeOutQuart: function (x, t, b, c, d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	},
	easeInOutQuart: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
	},
	easeInQuint: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t*t + b;
	},
	easeOutQuint: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t*t*t + 1) + b;
	},
	easeInOutQuint: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
	},
	easeInSine: function (x, t, b, c, d) {
		return -c * Math.cos(t/d * (Math.PI/2)) + c + b;
	},
	easeOutSine: function (x, t, b, c, d) {
		return c * Math.sin(t/d * (Math.PI/2)) + b;
	},
	easeInOutSine: function (x, t, b, c, d) {
		return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
	},
	easeInExpo: function (x, t, b, c, d) {
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeInOutExpo: function (x, t, b, c, d) {
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	},
	easeInCirc: function (x, t, b, c, d) {
		return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
	},
	easeOutCirc: function (x, t, b, c, d) {
		return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
	},
	easeInOutCirc: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
		return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
	},
	easeInElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
	},
	easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158; 
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	},
	easeInBounce: function (x, t, b, c, d) {
		return c - jQuery.easing.easeOutBounce (x, d-t, 0, c, d) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	},
	easeInOutBounce: function (x, t, b, c, d) {
		if (t < d/2) return jQuery.easing.easeInBounce (x, t*2, 0, c, d) * .5 + b;
		return jQuery.easing.easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
	}
});

/*
 *
 * TERMS OF USE - EASING EQUATIONS
 * 
 * Open source under the BSD License. 
 * 
 * Copyright © 2001 Robert Penner
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
 */
/*! Copyright (c) 2011 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
 * Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
 * Thanks to: Seamus Leahy for adding deltaX and deltaY
 *
 * Version: 3.0.6
 * 
 * Requires: 1.2.2+
 */
(function(a){function d(b){var c=b||window.event,d=[].slice.call(arguments,1),e=0,f=!0,g=0,h=0;return b=a.event.fix(c),b.type="mousewheel",c.wheelDelta&&(e=c.wheelDelta/120),c.detail&&(e=-c.detail/3),h=e,c.axis!==undefined&&c.axis===c.HORIZONTAL_AXIS&&(h=0,g=-1*e),c.wheelDeltaY!==undefined&&(h=c.wheelDeltaY/120),c.wheelDeltaX!==undefined&&(g=-1*c.wheelDeltaX/120),d.unshift(b,e,g,h),(a.event.dispatch||a.event.handle).apply(this,d)}var b=["DOMMouseScroll","mousewheel"];if(a.event.fixHooks)for(var c=b.length;c;)a.event.fixHooks[b[--c]]=a.event.mouseHooks;a.event.special.mousewheel={setup:function(){if(this.addEventListener)for(var a=b.length;a;)this.addEventListener(b[--a],d,!1);else this.onmousewheel=d},teardown:function(){if(this.removeEventListener)for(var a=b.length;a;)this.removeEventListener(b[--a],d,!1);else this.onmousewheel=null}},a.fn.extend({mousewheel:function(a){return a?this.bind("mousewheel",a):this.trigger("mousewheel")},unmousewheel:function(a){return this.unbind("mousewheel",a)}})})(jQuery)

/**************************************************************************
 * jquery.themepunch.showbiz.js - jQuery Plugin for showbiz Services Plugin
 * @version: 1.0 (09.11.2011)
 * @requires jQuery v1.2.2 or later
 * @author Krisztian Horvath
**************************************************************************/




(function($,undefined){



	////////////////////////////
	// THE PLUGIN STARTS HERE //
	////////////////////////////

	$.fn.extend({


		// OUR PLUGIN HERE :)
		services: function(options) {



		////////////////////////////////
		// SET DEFAULT VALUES OF ITEM //
		////////////////////////////////
		var defaults = {
			width:980,
			height:345,
			slideAmount:5,
			slideSpacing:20,
			touchenabled:"on",
			transition:1,
			mouseWheel:"on",
			slideshow:1000,
			hovereffect:"on",
			callback:null
		};

			options = $.extend({}, $.fn.services.defaults, options);


			return this.each(function() {

				var opt=options;
				var top_container=$(this);
				opt.topcontainer=top_container;
				//top_container.append('<div class="paradigm-preloader"></div>');

				prepareSlidesContainer(top_container,opt);
				prepareSlides(top_container,opt);
				prepareMovements(top_container,opt);


				if (opt.timer>0)
					startTimer(top_container,opt);

				// TOUCH ENABLED SCROLL
				if (opt.touchenabled=="on")

						top_container.swipe( {data:top_container,
										swipeLeft:function()
												{
													var top=$(this);
													var toolbar = top.find('.toolbar');
													var right=toolbar.find('.right');
													right.click();

												},
										swipeRight:function()
												{
													var top=$(this);
													var toolbar = top.find('.toolbar');
													var left=toolbar.find('.left');
													left.click();


												},
									allowPageScroll:"auto"} );


				// IF MOUSEWHEEL BEEN USED
				if (opt.mouseWheel=="on") {
					top_container.bind('mousewheel', function(event, delta) {

						var top=$(this);
						var toolbar = top.find('.toolbar');
						var left=toolbar.find('.left');
						var right=toolbar.find('.right');

						clearTimeout(top.data('mw'));
						if (delta<0)
							top.data('mw',setTimeout(function() {right.click();},100));
						 else
							 top.data('mw',setTimeout(function() {left.click();},100));


						return false;
					});
			}

			top_container.hover(
				function() {
					var $this=$(this);
					$this.addClass("nowIsOver");
				},
				function() {
					var $this=$(this);
					$this.removeClass("nowIsOver");
				}
			);


			if (opt.slideshow>0)
				setInterval(function() {

										var toolbar = top_container.find('.toolbar');
										var left=toolbar.find('.left');
										var right=toolbar.find('.right');

										if (!top_container.hasClass("nowIsOver") && !(opt.actSlide>=0))
												right.click();
										},(opt.slideshow));


		})
	}
})


		///////////////////////////////
		//  --  LOCALE FUNCTIONS -- //
		///////////////////////////////


					/////////////////////////
					//	--	MOVEMENTS	-- //
					/////////////////////////
					function prepareMovements(top,opt) {
						var toolbar = top.find('.toolbar');
						var left=toolbar.find('.left');
						var right=toolbar.find('.right');

						/////////////////////////
						// LEFT CLICK ON ITEMS //
						////////////////////////
						right.click(function() {

									if (!top.hasClass('DuringAnimation')) {
										top.addClass('DuringAnimation');
										setTimeout(function() {top.removeClass('DuringAnimation')},500);



									////////////////////////////////////////////////////
									//  DEPENDING ON IF THE VIEW MORE INFO IS TO SEE  //
									////////////////////////////////////////////////////


									if (opt.actSlide>=0) {

										var nextitem=null;
										var actindex = opt.actSlide;
										var slidearray=top.parent().find('ul:first >li .slide');

										for (var i=0;i<slidearray.length;i++) {
											actindex++;
											if (actindex==slidearray.length) actindex=0;
											var pm=top.parent().find('ul:first >li').eq(actindex).find('.slide').data('pagemore');
											if (nextitem==null && pm.length>0) nextitem=top.parent().find('ul:first >li').eq(actindex).find('.slide');
										}

										if (nextitem!=null) {
												top.parent().find('.page-more').css({'left':'0px'}).addClass("page-more-old").removeClass("page-more");
												top.parent().find('.page-more-old').cssAnimate({'left':(-150)+'px',opacity:0.0},{duration:300,queue:false});
												openReadMorePart(nextitem,opt,1);
												setTimeout(function() {
													top.parent().find('.page-more-old').remove();
												},500);
											}

									}

									///////////////////////////////////////
									// SLIDE ALL ITEMS NOW TO THE LEFT //
									///////////////////////////////////////
									if (opt.maxitem > opt.slideAmount) {
										if ((parseInt(top.find('ul:first >li .slide:first-child').data('id'),0)!=opt.slideAmount && opt.carousel=="off") || (opt.carousel!="off")) {
											left.css({'display':'block'});
											top.find('ul:first >li .slide').each(function() {

												var $this = $(this);

												$this.data('id',$this.data('id')-1)
												if ($this.data('id')<0) $this.data('id',opt.maxitem-1);

											});
											reSlideItems(top,opt,0);
											if (parseInt(top.find('ul:first >li .slide:first-child').data('id'),0)==opt.slideAmount && opt.carousel=="off")
											 right.css({'display':'none'});
										}
									}


							}
						});


						////////////////////////////
						// RIGHT CLICK ON ITEMS  //
						////////////////////////////
						left.click(function() {
								if (!top.hasClass('DuringAnimation')) {
									top.addClass('DuringAnimation');
									setTimeout(function() {top.removeClass('DuringAnimation')},500);

									////////////////////////////////////////////////////
									//  DEPENDING ON IF THE VIEW MORE INFO IS TO SEE  //
									////////////////////////////////////////////////////

									if (opt.actSlide>=0) {
										var nextitem=null;
										var actindex = opt.actSlide;
										var slidearray=top.parent().find('ul:first >li .slide');

										for (var i=0;i<slidearray.length;i++) {
											actindex--;
											if (actindex==-1) actindex=slidearray.length-1;
											var pm=top.parent().find('ul:first >li').eq(actindex).find('.slide').data('pagemore');
											if (nextitem==null && pm.length>0) nextitem=top.parent().find('ul:first >li').eq(actindex).find('.slide');
										}

										if (nextitem!=null) {
												top.parent().find('.page-more').css({'left':'0px'}).addClass("page-more-old").removeClass("page-more");
												top.parent().find('.page-more-old').cssAnimate({'left':(150)+'px',opacity:0.0},{duration:300,queue:false});
												openReadMorePart(nextitem,opt,2);
												setTimeout(function() {
													top.parent().find('.page-more-old').remove();
												},500);
											}
									}

									///////////////////////////////////////
									// SLIDE ALL ITEMS NOW TO THE RIGHT //
									///////////////////////////////////////
									if (opt.maxitem > opt.slideAmount) {
										if ((parseInt(top.find('ul:first >li .slide:first-child').data('id'),0)!=0 && opt.carousel=="off") || (opt.carousel!="off")) {
											right.css({'display':'block'});
											top.find('ul:first >li .slide').each(function() {
												var $this = $(this);
												$this.data('id',$this.data('id')+1)
												if ($this.data('id')==opt.maxitem) $this.data('id',0);
											});
											reSlideItems(top,opt,1);
											if (parseInt(top.find('ul:first >li .slide:first-child').data('id'),0)==0 && opt.carousel=="off") left.css({'display':'none'});
										}
									}
								}
						});
					}



					/////////////////////////////////////////
					// TURN ON or TURN OF the SIDE BUTTONS //
					/////////////////////////////////////////
					function sideButtons(opt,onoff) {

									var toolbar = opt.topcontainer.find('.toolbar');
									if (onoff=="none") {
										toolbar.css({'visibility':"hidden"});
									 } else	{
										toolbar.css({'visibility':"visible"});
									}


					}

					////////////////////////////////////////////////////////
					// OPEN THE READ MORE PART OF THE ITEM ON CLICK EVENT //
					////////////////////////////////////////////////////////
					function openReadMorePart(slide,opt,dir) {

										var $this=$(this);

										// TURN ON SLIDE BUTTONS
										sideButtons(opt,"visible")

										opt.top.animate({'top':(opt.height*1.5)+"px"},{duration:500,queue:false});
										opt.actSlide=slide.parent().index();
										opt.top.parent().append('<div class="page-more" style="position:absolute;z-index:9999;width:'+opt.width+'px;height:'+opt.height+'px">'+slide.data('pagemore')+'</div>');

										var pm = opt.top.parent().find('.page-more');
										pm.css({'visibility':'visible'});

										if (dir==2) {
												pm.css({'left':"-150px","opacity":'0.0'});
												pm.animate({'left':'0px',"opacity":'1.0'},{duration:500,queue:false});
										} else {
										if (dir==1) {
												pm.css({'left':"150px","opacity":'0.0'});
												pm.animate({'left':'0px',"opacity":'1.0'},{duration:500,queue:false});

										} else {
												pm.css({'top':(0-(opt.height*1.5))+"px"});
												pm.animate({'top':'0px'},{duration:500,queue:false});
										}}

										pm.parent().css({'overflow':'visible'});
										opt.top.parent().find('.page-more').find('.closer').click(
											function() {

												var pm=$(this).closest('.page-more');
												opt.top.animate({'top':"0px"},{duration:500,queue:false});
												pm.animate({'top':(0-opt.height)+'px'},{duration:500,queue:false});
												setTimeout(function() {pm.remove()},500);
												pm.parent().css({'overflow':'hidden'});
												opt.actSlide=-1;
												// TURN OFF SLIDE BUTTONS
												if (opt.maxitem <= opt.slideAmount)
													sideButtons(opt,"none")
											});

										if (opt.callBack!=null) {

											opt.callBack.call();
										};
								}




					////////////////////////////////////////////
					//	SLIDE THE ITEMS IN THE RIGHT POSITION //
					///////////////////////////////////////////
					function reSlideItems(top,opt,direction) {

										var minusslide = 0 - (opt.slidewidths + opt.slideSpacing) + opt.slideSpacing;
										var overslide = (opt.slidewidths + opt.slideSpacing)*opt.slideAmount + opt.slideSpacing;
										opt.transition=1;

										top.find('ul:first >li .slide').each(function(i) {
											var $this=$(this);


											// IF THE DIRECTION IS LEFT
											if (direction==0) {


												// IF THE ITEM IS AT THE END NOW OF THE ROW, THAN IT COME FROM THE FIRST POSITION
												if ($this.data("id") == opt.maxitem-1) {

													$this.cssAnimate({'left':(1*minusslide)+"px"},{duration:300,queue:false});
												} else {

													// CHECK IF THE SLIDE IS ALREADY OUTSIDE LEFT OF THE WINDOW?
													if ($this.position().left<0) {
														$this.cssAnimate({'left':overslide+"px"},{duration:1});
													} else {

															setTimeout(function() {

																$this.cssAnimate({'left':opt.positionArray[$this.data('id')]+"px"},{duration:300,queue:false});
																},100);//+$this.data('id')*10);
													}
												}
											} else {
												// IF THE ITEM IS AT THE END NOW OF THE ROW, THAN IT COME FROM THE FIRST POSITION
												if ($this.data("id") == opt.slideAmount) {
													$this.cssAnimate({'left':overslide+"px"},{duration:500,queue:false});
												} else {

													// CHECK IF THE SLIDE IS ALREADY OUTSIDE LEFT OF THE WINDOW?
													if ($this.position().left>=opt.positionArray[opt.maxitem-1]) {
														$this.cssAnimate({'left':minusslide+"px"},{duration:2});
														//$this.css({'left':minusslide+"px"},{duration:1});
													}
													setTimeout(function() {
														$this.cssAnimate({'left':opt.positionArray[$this.data('id')]+"px"},{duration:300,queue:false});
														},100);//+(opt.slideAmount+1-$this.data('id'))*10);

												}
											}
										});

					};








					///////////////////////////////////////////
					//	--	Set the Containers of Slides --	 //
					///////////////////////////////////////////
					function prepareSlides(top,opt) {

						opt.slidewidths = (opt.width - ((opt.slideAmount-1)*opt.slideSpacing)) / opt.slideAmount;
						opt.positionArray =[];
						opt.positionArray[0] = 0 - opt.slidewidths;

						top.find('ul:first').wrap('<div style="position:absolute;top:0px;left:0px" class="services-wrapper-top"></div>');
						opt.top = top.find('.services-wrapper-top');
						opt.maxitem =0;


						top.find('ul:first > li').each(function(i) {
							opt.maxitem=opt.maxitem+1;
							var $this=$(this);

							// SAVE THE PADDING AND BORDER SIZES
							opt.positionArray[i] = (opt.slidewidths + opt.slideSpacing)* i ;

							//PREPARE THE "LI" WITH WRAPPING INTO SOME NEW DIVS
							$this.wrapInner('<div class="slide" style="position:absolute;overflow:hidden;width:'+opt.slidewidths+'px;top:0px;left:'+opt.positionArray[i]+'px;"></div>');

							// CATCH THE ITEMS BY THEIR CLASSES
							var slide=$this.find('.slide');
							slide.css({'left':opt.positionArray[i]+'px','position':'absolute'});

							slide.data('pagemore',"");

							// IF THERE IS A PAGE MORE INFO ???
							slide.find('.page-more').each(function() {
								var $this=$(this);
								if (slide.find('.morebutton').length>0) {
									if (slide.find('.morebutton').attr('href').length>1)
										slide.data('link',true);
								}

								slide.data('pagemore',$this.html());
								$this.remove();


								slide.find('.morebutton').click(
									function() {
										if ($(this).attr('href')=="#" || $(this).attr('href').length==0) {
											openReadMorePart(slide,opt);
											return false;
										}
								});

							});

							slide.data('id',i);
							var img = slide.find('img');
							img.wrap('<div class="imgholder" style="cursor:pointer;position:relative"></div>');
							var imgpar=slide.find('.imgholder');



							// CALCULATE THE BW IMG OFFSET
							var bl=parseInt(img.css('border-left-width'),0);
							var pl=parseInt(img.css('paddingLeft'),0);
							var ml=parseInt(img.css('marginLeft'),0);;

							if (!bl>0) bl=0;
							if (!pl>0) pl=0;
							if (!ml>0) ml=0;

							var loffset =bl+pl+ml;

							var bt=parseInt(img.css('border-top-width'),0);
							var pt=parseInt(img.css('paddingTop'),0);
							var mt=parseInt(img.css('marginTop'),0);

							if (!bt>0) bt=0;
							if (!pt>0) pt=0;
							if (!mt>0) mt=0;

							var toffset = bt+pt+mt;



							// WRAP THE MAGE INSIDE DIV WITH NEW BW IMG

							if (slide.data('pagemore').length>0)
								slide.find('.imgholder').click(
								function() {
										if (slide.find('.morebutton').attr('href')=="#" || slide.find('.morebutton').attr('href').length==0) {
											openReadMorePart(slide,opt);
											return false;
										} else {
											var utarget="_top";
											if (slide.find('.morebutton').attr('target')!=undefined)
												utarget=slide.find('.morebutton').attr('target');
											 window.open(slide.find('.morebutton').attr('href'),utarget);
										}
									})



							if (opt.hovereffect=="on") {
										// IF WE ROLL OVER THE SLIDE, WE SHOULD ADD SOME COOL EFFECTS (FOR FF)
										slide.hover(
											function () {
												var $this = $(this);
												var item=$this;
												var overlay=item.find('.imgholder');
												overlay.css({'overflow':'hidden'});
												$this.addClass("mouseover");

											//	 ADD PLUS OR BLOG SYMBOL HERE
												if (item.data('link')==true) {
													if (item.find('.hover-blog-link-sign').length==0)  {
														overlay.append('<div class="hover-blog-link-sign" style="z-index:999;margin-left:-25px;margin-top:-25px"></div>');
														var plus=item.find('.hover-blog-link-sign');
														plus.css({'left':overlay.width()/2+"px",'top':(overlay.height()/2+25)+"px",'opacity':'0.0'});
													} else {
														var plus=item.find('.hover-blog-link-sign');
														clearTimeout(plus.data('out'));
													}
												} else {
													if (item.find('.hover-more-sign').length==0)  {
														overlay.append('<div class="hover-more-sign"></div>');
														var plus=item.find('.hover-more-sign');
														plus.css({'z-index':'99999','left':overlay.width()/2+"px",'top':(overlay.height()/2+25)+"px",'opacity':'0.0'});

													} else {
														var plus=item.find('.hover-more-sign');
														clearTimeout(plus.data('out'));
													}
												}


												plus.cssAnimate({'left':overlay.width()/2+"px",'top':(overlay.height()/2)+"px",'opacity':'1.0'},{duration:500,queue:false});
												plus.data('item',item);

												$this.parent().parent().find('li').each(function(i) {
													var $this=$(this);
													if (!$this.find('.slide').hasClass("mouseover")) {
														$this.find('.slide .imgholder .bw').stop();
														$this.find('.slide *').stop();
														$this.find('.slide .imgholder .bw').animate({'opacity':'1.0'},{duration:400,queue:false});
														if ($.browser.msie && $.browser.version < 8) {

													//		IE7 FAILURES
														} else {

															$this.find('.slide *').each(function() {
																		var $this=$(this);

																			if (opt.hoverAlpha=="on") {

																				if (!$this.hasClass("buttonlight") && !$this.hasClass('imgholder'))
																					$this.animate({'opacity':'0.5'},{duration:400,queue:false});		//ALPHA TEXT
																				if ($this.hasClass("thumb"))
																					$this.animate({'opacity':'0.0'},{duration:400,queue:false});
																			}

																	});
														}
														clearTimeout($this.data('to'));
													} else {
														clearTimeout($this.data('to'));
														$this.find('.slide .imgholder .bw').stop();
														$this.find('.slide *').stop();
														$this.find('.slide  .imgholder .bw').animate({'opacity':'0.0'},{duration:400,queue:false});
														if ($.browser.msie && $.browser.version < 8) {

												//			IE7 FAILURES
														} else {
															$this.find('.slide *').each(function() {
																		var $this=$(this);
																		if (opt.hoverAlpha=="on") {
																			if (!$this.hasClass("buttonlight") && !$this.hasClass('imgholder') && !$this.hasClass('bw'))
																				$this.animate({'opacity':'1.0'},{duration:400,queue:false});
																		}

																	});
														}
													}
												});
											},
											function () {
												var $this = $(this);
												var item = $this;
												var overlay = item.find('.imgholder');
												if ($this.data('link')==true)
													var plus=item.find('.hover-blog-link-sign');
												else
													var plus=item.find('.hover-more-sign')

												plus.cssStop(true,true);

												plus.cssAnimate({'left':overlay.width()/2+"px",'top':((overlay.height()/2)+20)+"px",'opacity':'0.0'},{duration:300,queue:false});
												plus.data('out',setTimeout(function() {$this.find('.hover-blog-link-sign').remove();$this.find('.hover-more-sign').remove();},300));

												$this.removeClass("mouseover");
												$this.parent().parent().find('li').each(function(i) {
													var $this=$(this);
													$this.data('to',setTimeout(
															function() {
																$this.find('.slide .imgholder .bw').stop();
																$this.find('.slide *').stop();
																$this.find('.slide .imgholder .bw').animate({'opacity':'0.0'},{duration:400,queue:false});
																if ($.browser.msie && $.browser.version < 8) {

																//	IE7 FAILURES
																} else {
																	$this.find('.slide *').each(function() {
																		var $this=$(this);
																		if (!$this.hasClass("buttonlight") && !$this.hasClass('imgholder') && !$this.hasClass('bw'))
																			$this.animate({'opacity':'1.0'},{duration:400,queue:false});
																	});
																}
															},250));
												});
											});
										}
									});

						opt.positionArray[opt.maxitem+1] = (opt.slidewidths + opt.slideSpacing)* (opt.maxitems+1) + opt.slideSpacing;

						sideButtons(opt,"visible")
						if (opt.maxitem <= opt.slideAmount) sideButtons(opt,"none")
						top.find('ul:first').css({'visibility':'visible'});
					}


					////////////////////////////////////////////////
					//	--	BACKGROUND AND DEFAULT VALUES --	 //
					//////////////////////////////////////////////
					function prepareSlidesContainer(top,opt) {
						top.find('ul:first').wrap('<div class="main-container" style="z-index:7;position:absolute;top:0px;left:0px;width:'+opt.width+'px;height:'+opt.height+'px;overflow:hidden"><div class="slider_holder" style="position:relative;width:'+opt.width+'px;height:'+opt.height+'px;overflow:hidden"></div></div>');

						var bg=top.find('.maincontainer');
						opt.padtop=parseInt(bg.css('paddingTop'),0);
						opt.padleft=parseInt(bg.css('paddingLeft'),0);
						opt.padright=parseInt(bg.css('paddingRight'),0);
						opt.padbottom=parseInt(bg.css('paddingBottom'),0);
					}






					/////////////////////////////////////////////
					// - START THE ROTATION OF THE BANNER HERE //
					/////////////////////////////////////////////
					function startRotation(item,opt) {
						if ( $.browser.msie ) {
							item.find('.paradigm-preloader').animate({'opacity':'0.0'},{duration:300,queue:false});

						} else {
							item.find('.paradigm-preloader').animate({'opacity':'0.0'},{duration:300,queue:false});
						}
						setTimeout(function() {item.find('.paradigm-preloader').remove();},300);


					}






				////////////////////////////////////
				// AUTOMATIC COUNTDOWN FOR SLIDER //
				////////////////////////////////////
				function startTimer(top,opt) {

					// HIER COMES THE INTERVAL ES IT SHOULD
					setInterval(function() {

					},100);
				}


})(jQuery);






(function($,undefined){$.fn.extend({services:function(options){var defaults={width:980,height:345,slideAmount:5,slideSpacing:20,touchenabled:"on",transition:1,mouseWheel:"on",slideshow:1000,hovereffect:"on",callback:null};options=$.extend({},$.fn.services.defaults,options);return this.each(function(){var opt=options;var top_container=$(this);opt.topcontainer=top_container;prepareSlidesContainer(top_container,opt);prepareSlides(top_container,opt);prepareMovements(top_container,opt);if(opt.timer>0)
startTimer(top_container,opt);if(opt.touchenabled=="on")
top_container.swipe({data:top_container,swipeLeft:function()
{var top=$(this);var toolbar=top.find('.toolbar');var right=toolbar.find('.right');right.click();},swipeRight:function()
{var top=$(this);var toolbar=top.find('.toolbar');var left=toolbar.find('.left');left.click();},allowPageScroll:"auto"});if(opt.mouseWheel=="on"){top_container.bind('mousewheel',function(event,delta){var top=$(this);var toolbar=top.find('.toolbar');var left=toolbar.find('.left');var right=toolbar.find('.right');clearTimeout(top.data('mw'));if(delta<0)
top.data('mw',setTimeout(function(){right.click();},100));else
top.data('mw',setTimeout(function(){left.click();},100));return false;});}
top_container.hover(function(){var $this=$(this);$this.addClass("nowIsOver");},function(){var $this=$(this);$this.removeClass("nowIsOver");});if(opt.slideshow>0)
setInterval(function(){var toolbar=top_container.find('.toolbar');var left=toolbar.find('.left');var right=toolbar.find('.right');if(!top_container.hasClass("nowIsOver")&&!(opt.actSlide>=0))
right.click();},(opt.slideshow));})}})
function prepareMovements(top,opt){var toolbar=top.find('.toolbar');var left=toolbar.find('.left');var right=toolbar.find('.right');right.click(function(){if(!top.hasClass('DuringAnimation')){top.addClass('DuringAnimation');setTimeout(function(){top.removeClass('DuringAnimation')},500);if(opt.actSlide>=0){var nextitem=null;var actindex=opt.actSlide;var slidearray=top.parent().find('ul:first >li .slide');for(var i=0;i<slidearray.length;i++){actindex++;if(actindex==slidearray.length)actindex=0;var pm=top.parent().find('ul:first >li').eq(actindex).find('.slide').data('pagemore');if(nextitem==null&&pm.length>0)nextitem=top.parent().find('ul:first >li').eq(actindex).find('.slide');}
if(nextitem!=null){top.parent().find('.page-more').css({'left':'0px'}).addClass("page-more-old").removeClass("page-more");top.parent().find('.page-more-old').cssAnimate({'left':(-150)+'px',opacity:0.0},{duration:300,queue:false});openReadMorePart(nextitem,opt,1);setTimeout(function(){top.parent().find('.page-more-old').remove();},500);}}
if(opt.maxitem>opt.slideAmount){if((parseInt(top.find('ul:first >li .slide:first-child').data('id'),0)!=opt.slideAmount&&opt.carousel=="off")||(opt.carousel!="off")){left.css({'display':'block'});top.find('ul:first >li .slide').each(function(){var $this=$(this);$this.data('id',$this.data('id')-1)
if($this.data('id')<0)$this.data('id',opt.maxitem-1);});reSlideItems(top,opt,0);if(parseInt(top.find('ul:first >li .slide:first-child').data('id'),0)==opt.slideAmount&&opt.carousel=="off")
right.css({'display':'none'});}}}});left.click(function(){if(!top.hasClass('DuringAnimation')){top.addClass('DuringAnimation');setTimeout(function(){top.removeClass('DuringAnimation')},500);if(opt.actSlide>=0){var nextitem=null;var actindex=opt.actSlide;var slidearray=top.parent().find('ul:first >li .slide');for(var i=0;i<slidearray.length;i++){actindex--;if(actindex==-1)actindex=slidearray.length-1;var pm=top.parent().find('ul:first >li').eq(actindex).find('.slide').data('pagemore');if(nextitem==null&&pm.length>0)nextitem=top.parent().find('ul:first >li').eq(actindex).find('.slide');}
if(nextitem!=null){top.parent().find('.page-more').css({'left':'0px'}).addClass("page-more-old").removeClass("page-more");top.parent().find('.page-more-old').cssAnimate({'left':(150)+'px',opacity:0.0},{duration:300,queue:false});openReadMorePart(nextitem,opt,2);setTimeout(function(){top.parent().find('.page-more-old').remove();},500);}}
if(opt.maxitem>opt.slideAmount){if((parseInt(top.find('ul:first >li .slide:first-child').data('id'),0)!=0&&opt.carousel=="off")||(opt.carousel!="off")){right.css({'display':'block'});top.find('ul:first >li .slide').each(function(){var $this=$(this);$this.data('id',$this.data('id')+1)
if($this.data('id')==opt.maxitem)$this.data('id',0);});reSlideItems(top,opt,1);if(parseInt(top.find('ul:first >li .slide:first-child').data('id'),0)==0&&opt.carousel=="off")left.css({'display':'none'});}}}});}
function sideButtons(opt,onoff){var toolbar=opt.topcontainer.find('.toolbar');if(onoff=="none"){toolbar.css({'visibility':"hidden"});}else{toolbar.css({'visibility':"visible"});}}
function openReadMorePart(slide,opt,dir){var $this=$(this);sideButtons(opt,"visible")
opt.top.animate({'top':(opt.height*1.5)+"px"},{duration:500,queue:false});opt.actSlide=slide.parent().index();opt.top.parent().append('<div class="page-more" style="position:absolute;z-index:9999;width:'+opt.width+'px;height:'+opt.height+'px">'+slide.data('pagemore')+'</div>');var pm=opt.top.parent().find('.page-more');pm.css({'visibility':'visible'});if(dir==2){pm.css({'left':"-150px","opacity":'0.0'});pm.animate({'left':'0px',"opacity":'1.0'},{duration:500,queue:false});}else{if(dir==1){pm.css({'left':"150px","opacity":'0.0'});pm.animate({'left':'0px',"opacity":'1.0'},{duration:500,queue:false});}else{pm.css({'top':(0-(opt.height*1.5))+"px"});pm.animate({'top':'0px'},{duration:500,queue:false});}}
pm.parent().css({'overflow':'visible'});opt.top.parent().find('.page-more').find('.closer').click(function(){var pm=$(this).closest('.page-more');opt.top.animate({'top':"0px"},{duration:500,queue:false});pm.animate({'top':(0-opt.height)+'px'},{duration:500,queue:false});setTimeout(function(){pm.remove()},500);pm.parent().css({'overflow':'hidden'});opt.actSlide=-1;if(opt.maxitem<=opt.slideAmount)
sideButtons(opt,"none")});if(opt.callBack!=null){opt.callBack.call();};}
function reSlideItems(top,opt,direction){var minusslide=0-(opt.slidewidths+opt.slideSpacing)+opt.slideSpacing;var overslide=(opt.slidewidths+opt.slideSpacing)*opt.slideAmount+opt.slideSpacing;opt.transition=1;top.find('ul:first >li .slide').each(function(i){var $this=$(this);if(direction==0){if($this.data("id")==opt.maxitem-1){$this.cssAnimate({'left':(1*minusslide)+"px"},{duration:300,queue:false});}else{if($this.position().left<0){$this.cssAnimate({'left':overslide+"px"},{duration:1});}else{setTimeout(function(){$this.cssAnimate({'left':opt.positionArray[$this.data('id')]+"px"},{duration:300,queue:false});},100);}}}else{if($this.data("id")==opt.slideAmount){$this.cssAnimate({'left':overslide+"px"},{duration:500,queue:false});}else{if($this.position().left>=opt.positionArray[opt.maxitem-1]){$this.cssAnimate({'left':minusslide+"px"},{duration:2});}
setTimeout(function(){$this.cssAnimate({'left':opt.positionArray[$this.data('id')]+"px"},{duration:300,queue:false});},100);}}});};function prepareSlides(top,opt){opt.slidewidths=(opt.width-((opt.slideAmount-1)*opt.slideSpacing))/opt.slideAmount;opt.positionArray=[];opt.positionArray[0]=0-opt.slidewidths;top.find('ul:first').wrap('<div style="position:absolute;top:0px;left:0px" class="services-wrapper-top"></div>');opt.top=top.find('.services-wrapper-top');opt.maxitem=0;top.find('ul:first > li').each(function(i){opt.maxitem=opt.maxitem+1;var $this=$(this);opt.positionArray[i]=(opt.slidewidths+opt.slideSpacing)*i;$this.wrapInner('<div class="slide" style="position:absolute;overflow:hidden;width:'+opt.slidewidths+'px;top:0px;left:'+opt.positionArray[i]+'px;"></div>');var slide=$this.find('.slide');slide.css({'left':opt.positionArray[i]+'px','position':'absolute'});slide.data('pagemore',"");slide.find('.page-more').each(function(){var $this=$(this);if(slide.find('.morebutton').length>0){if(slide.find('.morebutton').attr('href').length>1)
slide.data('link',true);}
slide.data('pagemore',$this.html());$this.remove();slide.find('.morebutton').click(function(){if($(this).attr('href')=="#"||$(this).attr('href').length==0){openReadMorePart(slide,opt);return false;}});});slide.data('id',i);var img=slide.find('img');img.wrap('<div class="imgholder" style="cursor:pointer;position:relative"></div>');var imgpar=slide.find('.imgholder');var bl=parseInt(img.css('border-left-width'),0);var pl=parseInt(img.css('paddingLeft'),0);var ml=parseInt(img.css('marginLeft'),0);;if(!bl>0)bl=0;if(!pl>0)pl=0;if(!ml>0)ml=0;var loffset=bl+pl+ml;var bt=parseInt(img.css('border-top-width'),0);var pt=parseInt(img.css('paddingTop'),0);var mt=parseInt(img.css('marginTop'),0);if(!bt>0)bt=0;if(!pt>0)pt=0;if(!mt>0)mt=0;var toffset=bt+pt+mt;imgpar.append('<img class="bw" src="'+img.data("bw")+'">');imgpar.find('.bw').css({'position':'absolute','z-index':'1000','opacity':'0.0','left':loffset+'px','top':toffset+'px'});if(slide.data('pagemore').length>0)
slide.find('.imgholder').click(function(){if(slide.find('.morebutton').attr('href')=="#"||slide.find('.morebutton').attr('href').length==0){openReadMorePart(slide,opt);return false;}else{var utarget="_top";if(slide.find('.morebutton').attr('target')!=undefined)
utarget=slide.find('.morebutton').attr('target');window.open(slide.find('.morebutton').attr('href'),utarget);}})
if(opt.hovereffect=="on"){slide.hover(function(){var $this=$(this);var item=$this;var overlay=item.find('.imgholder');overlay.css({'overflow':'hidden'});$this.addClass("mouseover");if(item.data('link')==true){if(item.find('.hover-blog-link-sign').length==0){overlay.append('<div class="hover-blog-link-sign" style="z-index:999;margin-left:-25px;margin-top:-25px"></div>');var plus=item.find('.hover-blog-link-sign');plus.css({'left':overlay.width()/2+"px",'top':(overlay.height()/2+25)+"px",'opacity':'0.0'});}else{var plus=item.find('.hover-blog-link-sign');clearTimeout(plus.data('out'));}}else{if(item.find('.hover-more-sign').length==0){overlay.append('<div class="hover-more-sign"></div>');var plus=item.find('.hover-more-sign');plus.css({'z-index':'99999','left':overlay.width()/2+"px",'top':(overlay.height()/2+25)+"px",'opacity':'0.0'});}else{var plus=item.find('.hover-more-sign');clearTimeout(plus.data('out'));}}
plus.cssAnimate({'left':overlay.width()/2+"px",'top':(overlay.height()/2)+"px",'opacity':'1.0'},{duration:500,queue:false});plus.data('item',item);$this.parent().parent().find('li').each(function(i){var $this=$(this);if(!$this.find('.slide').hasClass("mouseover")){$this.find('.slide .imgholder .bw').stop();$this.find('.slide *').stop();$this.find('.slide .imgholder .bw').animate({'opacity':'1.0'},{duration:400,queue:false});if($.browser.msie&&$.browser.version<8){}else{$this.find('.slide *').each(function(){var $this=$(this);if(opt.hoverAlpha=="on"){if(!$this.hasClass("buttonlight")&&!$this.hasClass('imgholder'))
$this.animate({'opacity':'0.5'},{duration:400,queue:false});if($this.hasClass("thumb"))
$this.animate({'opacity':'0.0'},{duration:400,queue:false});}});}
clearTimeout($this.data('to'));}else{clearTimeout($this.data('to'));$this.find('.slide .imgholder .bw').stop();$this.find('.slide *').stop();$this.find('.slide  .imgholder .bw').animate({'opacity':'0.0'},{duration:400,queue:false});if($.browser.msie&&$.browser.version<8){}else{$this.find('.slide *').each(function(){var $this=$(this);if(opt.hoverAlpha=="on"){if(!$this.hasClass("buttonlight")&&!$this.hasClass('imgholder')&&!$this.hasClass('bw'))
$this.animate({'opacity':'1.0'},{duration:400,queue:false});}});}}});},function(){var $this=$(this);var item=$this;var overlay=item.find('.imgholder');if($this.data('link')==true)
var plus=item.find('.hover-blog-link-sign');else
var plus=item.find('.hover-more-sign')
plus.cssStop(true,true);plus.cssAnimate({'left':overlay.width()/2+"px",'top':((overlay.height()/2)+20)+"px",'opacity':'0.0'},{duration:300,queue:false});plus.data('out',setTimeout(function(){$this.find('.hover-blog-link-sign').remove();$this.find('.hover-more-sign').remove();},300));$this.removeClass("mouseover");$this.parent().parent().find('li').each(function(i){var $this=$(this);$this.data('to',setTimeout(function(){$this.find('.slide .imgholder .bw').stop();$this.find('.slide *').stop();$this.find('.slide .imgholder .bw').animate({'opacity':'0.0'},{duration:400,queue:false});if($.browser.msie&&$.browser.version<8){}else{$this.find('.slide *').each(function(){var $this=$(this);if(!$this.hasClass("buttonlight")&&!$this.hasClass('imgholder')&&!$this.hasClass('bw'))
$this.animate({'opacity':'1.0'},{duration:400,queue:false});});}},250));});});}});opt.positionArray[opt.maxitem+1]=(opt.slidewidths+opt.slideSpacing)*(opt.maxitems+1)+opt.slideSpacing;sideButtons(opt,"visible")
if(opt.maxitem<=opt.slideAmount)sideButtons(opt,"none")
top.find('ul:first').css({'visibility':'visible'});}
function prepareSlidesContainer(top,opt){top.find('ul:first').wrap('<div class="main-container" style="z-index:7;position:absolute;top:0px;left:0px;width:'+opt.width+'px;height:'+opt.height+'px;overflow:hidden"><div class="slider_holder" style="position:relative;width:'+opt.width+'px;height:'+opt.height+'px;overflow:hidden"></div></div>');var bg=top.find('.maincontainer');opt.padtop=parseInt(bg.css('paddingTop'),0);opt.padleft=parseInt(bg.css('paddingLeft'),0);opt.padright=parseInt(bg.css('paddingRight'),0);opt.padbottom=parseInt(bg.css('paddingBottom'),0);}
function startRotation(item,opt){if($.browser.msie){item.find('.paradigm-preloader').animate({'opacity':'0.0'},{duration:300,queue:false});}else{item.find('.paradigm-preloader').animate({'opacity':'0.0'},{duration:300,queue:false});}
setTimeout(function(){item.find('.paradigm-preloader').remove();},300);}
function startTimer(top,opt){setInterval(function(){},100);}})(jQuery);
/*
 * touchSwipe - jQuery Plugin
 * http://plugins.jquery.com/project/touchSwipe
 * http://labs.skinkers.com/touchSwipe/
 *
 * Copyright (c) 2010 Matt Bryson (www.skinkers.com)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * $version: 1.2.5
 *
 * Changelog
 * $Date: 2010-12-12 (Wed, 12 Dec 2010) $
 * $version: 1.0.0 
 * $version: 1.0.1 - removed multibyte comments
 *
 * $Date: 2011-21-02 (Mon, 21 Feb 2011) $
 * $version: 1.1.0 	- added allowPageScroll property to allow swiping and scrolling of page
 *					- changed handler signatures so one handler can be used for multiple events
 * $Date: 2011-23-02 (Wed, 23 Feb 2011) $
 * $version: 1.2.0 	- added click handler. This is fired if the user simply clicks and does not swipe. The event object and click target are passed to handler.
 *					- If you use the http://code.google.com/p/jquery-ui-for-ipad-and-iphone/ plugin, you can also assign jQuery mouse events to children of a touchSwipe object.
 * $version: 1.2.1 	- removed console log!
 *
 * $version: 1.2.2 	- Fixed bug where scope was not preserved in callback methods. 
 *
 * $Date: 2011-28-04 (Thurs, 28 April 2011) $
 * $version: 1.2.4 	- Changed licence terms to be MIT or GPL inline with jQuery. Added check for support of touch events to stop non compatible browsers erroring.
 *
 * $Date: 2011-27-09 (Tues, 27 September 2011) $
 * $version: 1.2.5 	- Added support for testing swipes with mouse on desktop browser (thanks to https://github.com/joelhy)

 * A jQuery plugin to capture left, right, up and down swipes on touch devices.
 * You can capture 2 finger or 1 finger swipes, set the threshold and define either a catch all handler, or individual direction handlers.
 * Options:
 * 		swipe 		Function 	A catch all handler that is triggered for all swipe directions. Handler is passed 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
 * 		swipeLeft	Function 	A handler that is triggered for "left" swipes. Handler is passed 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
 * 		swipeRight	Function 	A handler that is triggered for "right" swipes. Handler is passed 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
 * 		swipeUp		Function 	A handler that is triggered for "up" swipes. Handler is passed 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
 * 		swipeDown	Function 	A handler that is triggered for "down" swipes. Handler is passed 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
 *		swipeStatus Function 	A handler triggered for every phase of the swipe. Handler is passed 4 arguments: event : The original event object, phase:The current swipe face, either "start?, "move?, "end? or "cancel?. direction : The swipe direction, either "up?, "down?, "left " or "right?.distance : The distance of the swipe.
 *		click		Function	A handler triggered when a user just clicks on the item, rather than swipes it. If they do not move, click is triggered, if they do move, it is not.
 *
 * 		fingers 	int 		Default 1. 	The number of fingers to trigger the swipe, 1 or 2.
 * 		threshold 	int  		Default 75.	The number of pixels that the user must move their finger by before it is considered a swipe.
 *		triggerOnTouchEnd Boolean Default true If true, the swipe events are triggered when the touch end event is received (user releases finger).  If false, it will be triggered on reaching the threshold, and then cancel the touch event automatically.
 *		allowPageScroll String Default "auto". How the browser handles page scrolls when the user is swiping on a touchSwipe object. 
 *										"auto" : all undefined swipes will cause the page to scroll in that direction.
 *										"none" : the page will not scroll when user swipes.
 *										"horizontal" : will force page to scroll on horizontal swipes.
 *										"vertical" : will force page to scroll on vertical swipes.
 *
 * This jQuery plugin will only run on devices running Mobile Webkit based browsers (iOS 2.0+, android 2.2+)
 */
(function($) 
{
	
	
	
	$.fn.swipe = function(options) 
	{
		if (!this) return false;
		
		// Default thresholds & swipe functions
		var defaults = {
					
			fingers 		: 1,								// int - The number of fingers to trigger the swipe, 1 or 2. Default is 1.
			threshold 		: 75,								// int - The number of pixels that the user must move their finger by before it is considered a swipe. Default is 75.
			
			swipe 			: null,		// Function - A catch all handler that is triggered for all swipe directions. Accepts 2 arguments, the original event object and the direction of the swipe : "left", "right", "up", "down".
			swipeLeft		: null,		// Function - A handler that is triggered for "left" swipes. Accepts 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
			swipeRight		: null,		// Function - A handler that is triggered for "right" swipes. Accepts 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
			swipeUp			: null,		// Function - A handler that is triggered for "up" swipes. Accepts 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
			swipeDown		: null,		// Function - A handler that is triggered for "down" swipes. Accepts 3 arguments, the original event object, the direction of the swipe : "left", "right", "up", "down" and the distance of the swipe.
			swipeStatus		: null,		// Function - A handler triggered for every phase of the swipe. Handler is passed 4 arguments: event : The original event object, phase:The current swipe face, either "start?, "move?, "end? or "cancel?. direction : The swipe direction, either "up?, "down?, "left " or "right?.distance : The distance of the swipe.
			click			: null,		// Function	- A handler triggered when a user just clicks on the item, rather than swipes it. If they do not move, click is triggered, if they do move, it is not.
			
			triggerOnTouchEnd : true,	// Boolean, if true, the swipe events are triggered when the touch end event is received (user releases finger).  If false, it will be triggered on reaching the threshold, and then cancel the touch event automatically.
			allowPageScroll : "auto" 	/* How the browser handles page scrolls when the user is swiping on a touchSwipe object. 
											"auto" : all undefined swipes will cause the page to scroll in that direction.
 											"none" : the page will not scroll when user swipes.
 											"horizontal" : will force page to scroll on horizontal swipes.
 											"vertical" : will force page to scroll on vertical swipes.
										*/
		};
		
		
		//Constants
		var LEFT = "left";
		var RIGHT = "right";
		var UP = "up";
		var DOWN = "down";
		var NONE = "none";
		var HORIZONTAL = "horizontal";
		var VERTICAL = "vertical";
		var AUTO = "auto";
		
		var PHASE_START="start";
		var PHASE_MOVE="move";
		var PHASE_END="end";
		var PHASE_CANCEL="cancel";
		
	    var hasTouch = 'ontouchstart' in window,
        START_EV = hasTouch ? 'touchstart' : 'mousedown',
        MOVE_EV = hasTouch ? 'touchmove' : 'mousemove',
        END_EV = hasTouch ? 'touchend' : 'mouseup',
        CANCEL_EV = 'touchcancel';
		
		var phase="start";
		
		if (options.allowPageScroll==undefined && (options.swipe!=undefined || options.swipeStatus!=undefined))
			options.allowPageScroll=NONE;
		
		if (options)
			$.extend(defaults, options);
		
		
		/**
		 * Setup each object to detect swipe gestures
		 */
		return this.each(function() 
		{
            var that = this;
			var $this = $(this);
			
			var triggerElementID = null; 	// this variable is used to identity the triggering element
			var fingerCount = 0;			// the current number of fingers being used.	
			
			//track mouse points / delta
			var start={x:0, y:0};
			var end={x:0, y:0};
			var delta={x:0, y:0};
			
			
			/**
			* Event handler for a touch start event. 
			* Stops the default click event from triggering and stores where we touched
			*/
			function touchStart(event) 
			{
                var evt = hasTouch ? event.touches[0] : event; 
				phase = PHASE_START;
		
                if (hasTouch) {
                    // get the total number of fingers touching the screen
                    fingerCount = event.touches.length;
                }
				
				//clear vars..
				distance=0;
				direction=null;
				
				// check the number of fingers is what we are looking for
				if (fingerCount == defaults.fingers || !hasTouch) 
				{
					// get the coordinates of the touch
					start.x = end.x = evt.pageX;
					start.y = end.y = evt.pageY;
					
					if (defaults.swipeStatus)
						triggerHandler(event, phase);
				} 
				else 
				{
					//touch with more/less than the fingers we are looking for
					touchCancel(event);
				}

				that.addEventListener(MOVE_EV, touchMove, false);
				that.addEventListener(END_EV, touchEnd, false);
			}

			/**
			* Event handler for a touch move event. 
			* If we change fingers during move, then cancel the event
			*/
			function touchMove(event) 
			{
				if (phase == PHASE_END || phase == PHASE_CANCEL)
					return;
                
                var evt = hasTouch ? event.touches[0] : event; 
				
				end.x = evt.pageX;
				end.y = evt.pageY;
					
				direction = caluculateDirection();
                if (hasTouch) {
                    fingerCount = event.touches.length;
                }
				
				phase = PHASE_MOVE
				
				//Check if we need to prevent default evnet (page scroll) or not
				validateDefaultEvent(event, direction);
		
				if ( fingerCount == defaults.fingers || !hasTouch) 
				{
					distance = caluculateDistance();
					
					if (defaults.swipeStatus)
						triggerHandler(event, phase, direction, distance);
					
					//If we trigger whilst dragging, not on touch end, then calculate now...
					if (!defaults.triggerOnTouchEnd)
					{
						// if the user swiped more than the minimum length, perform the appropriate action
						if ( distance >= defaults.threshold ) 
						{
							phase = PHASE_END;
							triggerHandler(event, phase);
							touchCancel(event); // reset the variables
						}
					}
				} 
				else 
				{
					phase = PHASE_CANCEL;
					triggerHandler(event, phase); 
					touchCancel(event);
				}
			}
			
			/**
			* Event handler for a touch end event. 
			* Calculate the direction and trigger events
			*/
			function touchEnd(event) 
			{
				event.preventDefault();
				
				distance = caluculateDistance();
				direction = caluculateDirection();
						
				if (defaults.triggerOnTouchEnd)
				{
					phase = PHASE_END;
					// check to see if more than one finger was used and that there is an ending coordinate
					if ( (fingerCount == defaults.fingers  || !hasTouch) && end.x != 0 ) 
					{
						// if the user swiped more than the minimum length, perform the appropriate action
						if ( distance >= defaults.threshold ) 
						{
							triggerHandler(event, phase);
							touchCancel(event); // reset the variables
						} 
						else 
						{
							phase = PHASE_CANCEL;
							triggerHandler(event, phase); 
							touchCancel(event);
						}	
					} 
					else 
					{
						phase = PHASE_CANCEL;
						triggerHandler(event, phase); 
						touchCancel(event);
					}
				}
				else if (phase == PHASE_MOVE)
				{
					phase = PHASE_CANCEL;
					triggerHandler(event, phase); 
					touchCancel(event);
				}
				that.removeEventListener(MOVE_EV, touchMove, false);
				that.removeEventListener(END_EV, touchEnd, false);
			}
			
			/**
			* Event handler for a touch cancel event. 
			* Clears current vars
			*/
			function touchCancel(event) 
			{
				// reset the variables back to default values
				fingerCount = 0;
				
				start.x = 0;
				start.y = 0;
				end.x = 0;
				end.y = 0;
				delta.x = 0;
				delta.y = 0;
			}
			
			
			/**
			* Trigger the relevant event handler
			* The handlers are passed the original event, the element that was swiped, and in the case of the catch all handler, the direction that was swiped, "left", "right", "up", or "down"
			*/
			function triggerHandler(event, phase) 
			{
				//update status
				if (defaults.swipeStatus)
					defaults.swipeStatus.call($this,event, phase, direction || null, distance || 0);
				
				
				if (phase == PHASE_CANCEL)
				{
					if (defaults.click && (fingerCount==1 || !hasTouch) && (isNaN(distance) || distance==0))
						defaults.click.call($this,event, event.target);
				}
				
				if (phase == PHASE_END)
				{
					//trigger catch all event handler
					if (defaults.swipe)
				{
						
						defaults.swipe.call($this,event, direction, distance);
						
				}
					//trigger direction specific event handlers	
					switch(direction)
					{
						case LEFT :
							if (defaults.swipeLeft)
								defaults.swipeLeft.call($this,event, direction, distance);
							break;
						
						case RIGHT :
							if (defaults.swipeRight)
								defaults.swipeRight.call($this,event, direction, distance);
							break;

						case UP :
							if (defaults.swipeUp)
								defaults.swipeUp.call($this,event, direction, distance);
							break;
						
						case DOWN :	
							if (defaults.swipeDown)
								defaults.swipeDown.call($this,event, direction, distance);
							break;
					}
				}
			}
			
			
			/**
			 * Checks direction of the swipe and the value allowPageScroll to see if we should allow or prevent the default behaviour from occurring.
			 * This will essentially allow page scrolling or not when the user is swiping on a touchSwipe object.
			 */
			function validateDefaultEvent(event, direction)
			{
				if( defaults.allowPageScroll==NONE )
				{
					event.preventDefault();
				}
				else 
				{
					var auto=defaults.allowPageScroll==AUTO;
					
					switch(direction)
					{
						case LEFT :
							if ( (defaults.swipeLeft && auto) || (!auto && defaults.allowPageScroll!=HORIZONTAL))
								event.preventDefault();
							break;
						
						case RIGHT :
							if ( (defaults.swipeRight && auto) || (!auto && defaults.allowPageScroll!=HORIZONTAL))
								event.preventDefault();
							break;

						case UP :
							if ( (defaults.swipeUp && auto) || (!auto && defaults.allowPageScroll!=VERTICAL))
								event.preventDefault();
							break;
						
						case DOWN :	
							if ( (defaults.swipeDown && auto) || (!auto && defaults.allowPageScroll!=VERTICAL))
								event.preventDefault();
							break;
					}
				}
				
			}
			
			
			
			/**
			* Calcualte the length / distance of the swipe
			*/
			function caluculateDistance()
			{
				return Math.round(Math.sqrt(Math.pow(end.x - start.x,2) + Math.pow(end.y - start.y,2)));
			}
			
			/**
			* Calcualte the angle of the swipe
			*/
			function caluculateAngle() 
			{
				var X = start.x-end.x;
				var Y = end.y-start.y;
				var r = Math.atan2(Y,X); //radians
				var angle = Math.round(r*180/Math.PI); //degrees
				
				//ensure value is positive
				if (angle < 0) 
					angle = 360 - Math.abs(angle);
					
				return angle;
			}
			
			/**
			* Calcualte the direction of the swipe
			* This will also call caluculateAngle to get the latest angle of swipe
			*/
			function caluculateDirection() 
			{
				var angle = caluculateAngle();
				
				if ( (angle <= 45) && (angle >= 0) ) 
					return LEFT;
				
				else if ( (angle <= 360) && (angle >= 315) )
					return LEFT;
				
				else if ( (angle >= 135) && (angle <= 225) )
					return RIGHT;
				
				else if ( (angle > 45) && (angle < 135) )
					return DOWN;
				
				else
					return UP;
			}
			
			

			// Add gestures to all swipable areas if supported
			try
			{

				this.addEventListener(START_EV, touchStart, false);
				this.addEventListener(CANCEL_EV, touchCancel);
			}
			catch(e)
			{
				//touch not supported
			}
				
		});
	};
	
	
	
	
})(jQuery);