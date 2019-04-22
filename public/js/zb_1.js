(function ($) {
        $.fn.zBanner=function(options) {
          var dft={
          speed1: 400,
          speed2: 400,
          interval: 15000,
          obj1:'nav',
          obj2:'con',
          trigger:'c',
          animate:'',
          addClick:1
        };
        var ops = $.extend(dft,options);
        var box = $(this);
       
        var con=box.find('[class~='+ops.obj2+']').find('li');
        var width=con.width();
        var num=con.length;
        //璁剧疆瀵艰埅鎸夐挳
        var navBtn='';
        for (var i = 0; i < num; i++) {
          navBtn+='<a></a>';
       };
        box.find('[class~='+ops.obj1+']').append(navBtn);
        var nav=$('.'+ops.obj1).find('a');
        //鍒濆鍖朿ss
        nav.eq(0).addClass('current');
        var lightbtn=box.find('.light');
        lightbtn.css({'left':nav.eq(0).offset().left});
        //濡傛灉涓烘粦鍔�
         // con.hide().css({'opacity':'0'}).eq(0).show().css({'opacity':'1'});
         con.eq(0).css({'z-index':'2'});
        var ztimer=null,
        target=0,
        cur=0;
        //瀵艰埅璺宠浆
        ops.trigger=='c'?ops.trigger='click':ops.trigger='mouseenter';
         nav.on(ops.trigger,function () {
           target=$(this).index();
          if (con.is(":animated")||target==cur) {
            return false;
          };
          clearTimeout(ztimer);
          zmove ();
           ztimer=setInterval(zslide,ops.interval);
         });
         //鐐瑰嚮璺宠浆
         if (ops.addClick==1) {
	         box.find('.next').click(function () {
	          if (con.is(":animated")) {
	            return false;
	          };
	           clearTimeout(ztimer);
	          zslide();
	           ztimer=setInterval(zslide,ops.interval);
	         });

	          box.find('.prev').click(function () {
	          if (con.is(":animated")) {
	            return false;
	          };
	           clearTimeout(ztimer);
	           target=target-1; 
	           zmove();
	           ztimer=setInterval(zslide,ops.interval);
	         });
	    }      

        function zslide () {
          target+=1;
          if (target==num) {target=0};
          zmove(1);
        }
        //婊戝姩
        function zmove (flag) {
          cur=getcur(box.find('.'+ops.obj1));
          if (flag==1) {
            moveNext();
          }
          else {
            if (cur<target&&target!=-1) {
                 moveNext();
            }
            else {
               if (target==-1) {target=num-1};
                 moveBack();
            };

          };  

          function moveNext() {
            nav.eq(target).addClass('current').siblings('a').removeClass('current');
            var txpos=nav.eq(target).offset().left;
            box.find('.light').animate({'left':txpos},300);      
            if (ops.animate=='slide') {
              con.eq(cur).stop().animate({'left':-width+'px'},ops.speed1).css({'z-index':'1'});
              con.eq(target).css({'left':width+'px','z-index':'2'}).stop().animate({'left':'0px'},ops.speed1);
            }else {
              con.eq(cur).animate({'opacity':'0'},300).hide();
              con.eq(target).css({'opacity':'0.6'}).animate({'opacity':'1'},200).show();
            };
            cur=getcur(box.find('.'+ops.obj1));
          }
          function moveBack () {
            nav.eq(target).addClass('current').siblings('a').removeClass('current');
            var txpos=nav.eq(target).offset().left;
            box.find('.light').animate({'left':txpos},300); 
            if (ops.animate=='slide') {
               con.eq(cur).stop().animate({'left':width+'px'},ops.speed2).css({'z-index':'1'});
              con.eq(target).css({'left':-width+'px','z-index':'2'}).stop().animate({'left':'0px'},ops.speed2);
            }
            else {
             con.eq(cur).animate({'opacity':'0'},300).hide();
              con.eq(target).css({'opacity':'0.6'}).animate({'opacity':'1'},200).show();
            };
           
            cur=getcur(box.find('.'+ops.obj1));
          }
          
        }
        //鑾峰彇鐩墠鎵€鍦ㄧ殑浣嶇疆
        function getcur(obj) {
        var curClass='current';
        var curNode=obj.find("[class~="+ curClass+"]");
        if (curNode.length>0) {var index=curNode.index();};
        return index;

        }
       ztimer=setInterval(zslide,ops.interval);
      }
      })(jQuery);


(function ($) {
      $.fn.zslide=function(options) {
        var dft={
          obj:'slidecon',
          s:0,
          e:2,
          cur:0,
          per:0,
          x:0
        };
        var ops = $.extend(dft,options);
        var box = $(this);
        var con=box.find('[class~='+ops.obj+']');
        var tarXpos;
  
        box.find('.next').click(function () {
          if (ops.cur==ops.e) {return false;};
          ops.cur+=1; 
          tarXpos=ops.x-ops.cur*ops.per;
          con.animate({'left':tarXpos+'px'},300);

        });
        box.find('.prev').click(function () {
          if (ops.cur==ops.s) {return false;};
          ops.cur-=1; 
          tarXpos=ops.x-ops.cur*ops.per;
          con.animate({'left':tarXpos+'px'},300);

        });
      }  
    })(jQuery);