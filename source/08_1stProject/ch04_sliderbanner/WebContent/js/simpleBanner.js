/*!
 * SimpleBanner v10. ~ Copyright (c) 2013 Hangun's World, http://hangunsworld.com/blog/
 * Released under MIT license, http://hangunsworld.com/license.txt
 */

$(function() {
    $( "#testDatepicker" ).datepicker({
        changeMonth: true,
        changeyear: true,
        showOn: 'button',
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
  });
});


$(function(){
	initSimpleBanner();
});



/**
 * initializes SimpleBanners
 */
function initSimpleBanner(){
	var wrap;
	var W;
	var H;
	var lis;
	var li;
	var nav_wrap;
	var nav_ul;
	var cnt;
	var i;
	var itv;
	var type;
	var nav_type;
	$(".simple_banner_wrap").each(function(idx){
		// init variables
		wrap = $(this);
		wrap.data("index", idx);
		wrap.data("current", 0);
		wrap.data("mouseenter", false);
		W = wrap.width();
		H = wrap.height();
		switch(wrap.data("type")){
			case "hslide":
			case "vslide":
			case "alpha":
				type = wrap.data("type");
			break;
			
			default:
				wrap.data("type", "alpha");
				type = "alpha";
			break;
		}
		switch(wrap.data("nav-type")){
			case "numeral":
			case "bullet":
			case "prev_next":
				nav_type = wrap.data("nav-type");
			break;
			
			default:
				wrap.data("nav-type", "bullet");
				nav_type = "bullet";
			break;
		}
		if(isNaN(wrap.data("interval"))){
			wrap.data("interval", 1000);
		}
		lis = wrap.find("ul li");
		cnt = lis.length;
		wrap.data("total", cnt);
		
		// init banners
		if(type == "hslide"){
			lis.each(function(idx, itm){
				li = $(itm);
				li.css("left", W * idx + "px");
			});
		}else if(type == "vslide"){
			lis.each(function(idx, itm){
				li = $(itm);
				li.css("top", H * idx + "px");
			});
		}else{
			lis.each(function(idx, itm){
				li = $(itm);
				if(idx == 0){
					li.css({zIndex:1, opacity:1});
				}else{
					li.css("opacity", 0);
				}
			});
		}
		
		// init navigation
		wrap.append('<div class="nav_wrap ' + nav_type + '"><ul></ul></div>');
		nav_wrap = wrap.find(".nav_wrap");
		nav_ul = wrap.find(".nav_wrap ul");
		switch(nav_type){
			case "numeral":
			case "bullet":
				for(i=0; i<cnt; i++){
					nav_ul.append('<li>'+(i+1)+'</li>');
				}
				nav_ul.find("li").bind("click", sbNavClickListener);
				nav_ul.find("li").eq(0).addClass("on");
			break;
			
			case "prev_next":
				nav_ul.append('<li>&lt;</li>');
				nav_ul.append('<li>&gt;</li>');
				nav_ul.find("li").bind("click", sbNavClickListener);
			break;
		}
		
		nav_wrap.css("left", (W - nav_wrap.width())/2 + "px" );
		
		// rest timer
		i = idx;
		itv = wrap.data("interval");
		setTimeout("sbAnimateBannerTimer("+i+")", itv);
		
		// init events
		wrap.bind("mouseenter", sbMouseEnterListener);
		wrap.bind("mouseleave", sbMouseLeaveListener);
	});
}

/**
 * mouse enter listener
 * kill timer on mouse enter
 */
function sbMouseEnterListener(e){
	var wrap = $(e.currentTarget);
	wrap.data("mouseenter", true);
	if(wrap.data("stid")){
		clearTimeout(wrap.data("stid"));
	}
}
/**
 * mouse leave listener
 * reset timer on mouse leave
 */
function sbMouseLeaveListener(e){
	var wrap = $(e.currentTarget);
	wrap.data("mouseenter", false);
	var n = wrap.data("index");
	var itv = wrap.data("interval");
	wrap.data("stid", setTimeout("sbAnimateBannerTimer("+n+")", itv));
}

/**
 * timer callback function
 */
function sbAnimateBannerTimer(idx){
	var wrap = $(".simple_banner_wrap").eq(idx);
	//console.log("timeout", idx, wrap.data("current"), wrap.data("total"), wrap.data("stid"));
	
	var c = wrap.data("current") + 1;
	if(c >= wrap.data("total")){
		c = 0;
	}
	sbAnimateBanner(wrap, c);
}

/**
 * navigation click listener
 */
function sbNavClickListener(e){
	var n;
	var nav = $(e.target);
	var wrap = nav.parents(".simple_banner_wrap");
	switch(wrap.data("nav-type")){
		case "numeral":
		case "bullet":
			n = nav.html() - 1;
		break;
		
		case "prev_next":
			var total = wrap.data("total");
			n = wrap.data("current");
			if(nav.html() == "&lt;"){
				n--;
				if(n < 0){
					n = total - 1;
				}
			}else{
				n++;
				if(n >= total){
					n = 0;
				}
			}
		break;
	}
	
	sbAnimateBanner(wrap, n);
}

/**
 * animates banners
 */
function sbAnimateBanner(wrap, cur){
	// kill timer
	if(wrap.data("stid")){
		clearTimeout(wrap.data("stid"));
	}
	
	// init variables
	wrap.data("current", cur);
	var type = wrap.data("type");
	var W = wrap.width();
	var H = wrap.height();
	var wrap_ul = wrap.children("ul");
	var wrap_lis = wrap_ul.children();
	var nav_li;
	
	// animate banner
	if(type == "hslide"){
		wrap_ul.stop(true);
		wrap_ul.animate({left:-W*cur+"px"}, 200);
	}else if(type == "vslide"){
		wrap_ul.stop(true);
		wrap_ul.animate({top:-H*cur+"px"}, 200);
	}else{
		var li;
		wrap_lis.each(function(idx, itm){
			li = $(itm);
			li.stop(true);
			if(idx == cur){
				li.css("z-index", 1);
				li.animate({opacity:1}, 200);
			}else{
				li.css("z-index", 0);
				li.animate({opacity:0}, 200);
			}
		});
	}
	
	// update navigation
	switch(wrap.data("nav-type")){
		case "numeral":
		case "bullet":
			wrap.find(".nav_wrap ul li").each(function(idx, itm){
				nav_li = $(itm);
				if(idx == cur){
					nav_li.addClass("on");
				}else{
					nav_li.removeClass("on");
				}
			});
		break;
		
		//case "prev_next":
			// do nothing
		//break;
	}
	
	// reset timer
	if(wrap.data("mouseenter") == false){
		var n = wrap.data("index");
		var itv = wrap.data("interval");
		wrap.data("stid", setTimeout("sbAnimateBannerTimer("+n+")", itv));
	}
}