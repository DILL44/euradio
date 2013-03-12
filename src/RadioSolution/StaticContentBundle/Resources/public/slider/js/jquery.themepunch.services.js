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




