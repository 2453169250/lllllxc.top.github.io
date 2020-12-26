$(function(){
		/*backtotop*/
		$(window).scroll( function() {                    // change scroll event
		        var height = $(window).height(),          //get window height
		              top = $(document).scrollTop();       //get scroll top
		        if(top > 1 ){                                 //more than height to show
		            $(".backtotop").css({bottom:"80px"});
		        }
		        if(top < 1 ){                                   //less than height to disappear
		            $(".backtotop").css({bottom:"-80px"});
		        }
		    });
		    /*back to top click*/
		    $('.backtotop').click(function(){
		        $('html, body').animate({                     // Animation effects --> move
		            scrollTop: 0
		        }, 1000);
		    });
	/*导航栏*/
	$("nav>.nav-0>.a1").mouseenter(function(){
		$(".a1>.nav-1").stop().fadeIn(200);
	})
	$("nav>.nav-0>.a1").mouseleave(function(){
		$(".a1>.nav-1").stop().fadeOut(200);
	})
	$("nav>.nav-0>.a2").mouseenter(function(){
		$(".a2>.nav-1").stop().fadeIn(200);
	})
	$("nav>.nav-0>.a2").mouseleave(function(){
		$(".a2>.nav-1").stop().fadeOut(200);
	})
	var index = 0;
	var timer = null;
	// 点击右箭头
	$('.arrow_right').click(function(){
		clearInterval(timer);
		index++;
		if(index > 6){
			index = 0;
		}
		change();
	});
	// 点击左箭头
	$('.arrow_left').click(function(){
		clearInterval(timer);
		index--;
		if(index < 0){
			index = 6;
		}
		change();
	});

	//点击小圆点
	$("ol li").click(function(){
		clearInterval(timer);
		index = $(this).index();
		change();
	});

	//鼠标移到区域上
	$('.scroll-wrap').mouseenter(function(){
		clearInterval(timer);
	}).mouseleave(function(){
		timer = setInterval(function(){
			$('.arrow_right').click();
		},4000);
	});
	// clearInterval(timer);
	timer = setInterval(function(){
		$('.arrow_right').click();
	},4000);

	function change(){
		$('.scoller ul li:eq('+index+')').stop(true).fadeIn(500).siblings().fadeOut(500);
		$('ol li:eq('+index+')').addClass('on').siblings().removeClass('on');
	}
	
	/*选项卡*/
	$(".ul1 li").each(function(index){
		$(this).click(function(){
			$(".d0,.d1,.d2,.d3").css('display','none')
			$(".d"+index).css('display','block')
			$(".ul1 li").removeClass('cur')
			$(".ul1 li:eq("+index+")").addClass('cur')
		})
	})

	/*图片遮罩放大*/

	var imgsObj = $('.wallpaper-div img');//需要放大的图像
	if(imgsObj){
		$.each(imgsObj,function(){
		$(this).click(function(){
		var currImg = $(this);
		coverLayer(1);
		var tempContainer = $('<div class=tempContainer></div>');//图片容器
		with(tempContainer){
		appendTo("body");
		var windowWidth=$(window).width();
		var windowHeight=$(window).height();
		//获取图片原始宽度、高度
		var orignImg = new Image();
		orignImg.src =currImg.attr("src") ;
		var currImgWidth= orignImg.width;
		var currImgHeight = orignImg.height;
		if(currImgWidth<windowWidth){
			if(currImgHeight<windowHeight){
			var topHeight=(windowHeight-currImgHeight)/2;
				if(topHeight>35){
				topHeight=topHeight-35;
				css('top',topHeight);
				}else{
					css('top',0);
				}
				html('<img border=0 src=' + currImg.attr('src') + '>');
				}else{
					css('top',0);
					html('<img border=0 src=' + currImg.attr('src') + ' height='+windowHeight+'>');
			}
		}else{
				var currImgChangeHeight=(currImgHeight*windowWidth)/currImgWidth;
			if(currImgChangeHeight<windowHeight){
				var topHeight=(windowHeight-currImgChangeHeight)/2;
			if(topHeight>35){
				topHeight=topHeight-35;
				css('top',topHeight);
			}else{
				css('top',0);
			}
				html('<img border=0 src=' + currImg.attr('src') + ' width='+windowWidth+';>');
			}else{
				css('top',0);
				html('<img border=0 src=' + currImg.attr('src') + ' width='+windowWidth+'; height='+windowHeight+'>');
			}
		}
		}
			tempContainer.click(function(){
				$(this).css('opacity',0);
				$(this).css('transform','scale(0)');
				coverLayer(0);
			});
		});
		});
		}
		else{
			return false;
		}
		//使用禁用蒙层效果
		function coverLayer(tag){
			with($('.over')){
			if(tag==1){
				css('height',$(document).height());
				css('display','block');
				css('opacity',1);
				css("background-color","#FFFFFF");
				css("background-color","rgba(0,0,0,0.6)" );  //蒙层透明度
			}
			else{
				css('opacity',0);
				setTimeout(function(){
					css('display','none');
				},200)
				
				}
			}
		}
	/*选项卡切换*/
	$(".nav-1-a").each(function(i){
		$(this).click(function(){
			console.log(i)
			$(".dd0,.dd1,.dd2,.dd3").css('display','none')
			$(".dd"+(i-2)).css('display','block')
			$(".ul1-d0 li").removeClass('cur')
			$(".ul1-d0 li:eq("+(i-2)+")").addClass('cur')
		})
	})
	
	// 获取页面 A 访问的 url
	var ur =location.href;
	// 获取页面 A 访问的 url 的 = 后面的 数字 （对应着这个页面的 id）
	var type=ur.split('?')[1].split("=")[1];
	// 选项卡
	// $('.nav-1-a').click(function(event) {
	// $('.ul1-d0 li').removeClass('cur');
	// $(".ul1-d0 li:eq("+(type-1)+")").addClass('cur');
	// $('.dd0,.dd1,.dd2,.dd3').css({'display':'none'});
	// $(".dd"+(type-1)).css('display','block')
	// });
	// 使用传过来的 id 来控制该选项卡的切换
	$('.dd0,.dd1,.dd2,.dd3').css({'display':'none'});
	$('.ul1-d0 li').removeClass('cur');
	$('.ul1-d0 li').eq(type-1).addClass('cur');
	$(".dd"+(type-1)).css('display','block')
	
})
		
	