$(function(){
	pubuliu();
    //随着窗口的大小变化重新执行函数
	// $(window).resize(function() {
	// 	pubuliu();
	// });
	setInterval(function(){
		pubuliu();
	},10)
	
})
function pubuliu(){
	var li=$(".mryt .box2 .ul2 li"),num=3,arr=[];
    //获取每个li所占据的宽度
	var liW=li.outerWidth(true);

	//遍历每个li
li.each(function(index,val){
		var scrW=window.innerWidth
		if(scrW<550){
			num=2;
			li.css("width","48%")
		}else{
			num=3;
			li.css("width","31%")
		}
			
		if(index<num){
			$(val).css({
				top:0,
				left:liW*index+"px"
			})
			liH=li.outerHeight(true)
			arr[index]=$(this).outerHeight(true)
		}else{
			var minHeight=arr[0],mindex=0;
       //遍历数组
			arr.forEach(function(val,index){
				if(minHeight>val){
					minHeight=val;
					mindex=index;
				}
			})
			$(this).css({
				top:minHeight,
				left:liW*mindex+"px"
			})
			arr[mindex]=minHeight+$(this).outerHeight(true)
		}
	})	
}