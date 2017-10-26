var yongju=yongju || {};
yongju.common=(()=>{
   var init=(ctx)=>{
      onCreate();
      yongju.session.init(ctx);
      yongju.index.init();
   };
   var onCreate=()=>{
      setContentView();
   };
   var setContentView=()=>{};
   return {init:init};
})();

yongju.index=(()=>{
   var ctx,img,js;
   var init=()=>{
      js=$$('j');
      img=$$('i');
      ctx=$$('x');
      
      onCreate();
   };
   var onCreate=()=>{
        setContentView();
   };
   var setContentView=()=>{
        $('<div/>')
        .appendTo('#content')
        .attr('id', 'yj-container')
        .css({'width':'100%','height':'100%'});
        $('<div/>')
        .appendTo('#yj-container')
        .attr('id','yj-content')
        .css({'width':'65%','float': 'left','margin-top':'4%','margin-left':'1.1%'});
        /*google map*/
        $('<div></div>')
        .appendTo('#yj-container')
        .attr('id','gmap')
        .css({'width':'33%','float': 'right','top':'0','background-color': 'pink','height':'100%'}).text('Google API');
        $.ajax({
           url : ctx+'/put/listimg',
           method : 'post',
           dataType:'json',
           contentType : 'application/json',
           success : list=>{
              alert(list[1].member_id);
 
              var row='';
                $.each(list,(i,j)=>{
                   row +='<div style="float:left;width:300px;height:280px;margin-right:40px;">' 
                      +'<a style="text-decoration:none;">'
                       +'<img src="'+j.info_img+'" style="width:321.58px;height:214.38px">'
                        +'<span >'+j.price+'</span></br>'
                        +'<span > '+j.residence_name+' </span>'
                        +'<span > 침대 3개</span></br>'
                        +'<span><span class="glyphicon glyphicon-star" style="color: #006666"></span>'
                     +'<span class="glyphicon glyphicon-star" style="color: #006666"></span>'
                     +'<span class="glyphicon glyphicon-star" style="color: #006666"></span>'
                     +'<span class="glyphicon glyphicon-star" style="color: #006666"></span>'
                     +'<span class="glyphicon glyphicon-star" style="color: #006666"></span></span>'
                        +'</a>'
                        +'</div>';
                });
                $('#yj-content').append(row);
            }
        });
     
   };
   return {init:init};
})();

yongju.session={
      init : (x)=>{
         sessionStorage.setItem('x',x);
         sessionStorage.setItem('j',x+'/resources/js');
         sessionStorage.setItem('c',x+'/resources/css');
         sessionStorage.setItem('i',x+'/resources/img');
      },
      getPath : (x)=>{
         return sessionStorage.getItem(x);
      }
};
var $$= function(x){return yongju.session.getPath(x);};