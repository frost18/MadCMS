var amp="&";

function inc(){

    var el=document.getElementById('quan');
    el.value=el.value-1+2;    
    
}

function dec(){
    
    var el=document.getElementById('quan');
    if(el.value > 1){
        el.value=el.value-1;
        }    
    
}

function adn(str){
    
    return str+'&';
}



function tgl(id){ 
    if(document.getElementById(id).style.display=='none'){
		document.getElementById(id).style.display='';
	}else{
		document.getElementById(id).style.display='none';
	}
}





function main_listing(id){
    
    
  
    
 var q=1;//$('#quan'+id).val();
act='xadd';  

$('#ob'+id+' img').attr("src",'/design/img/loading.gif');
$.get('/act/listing.php', { action: act, id: id, q: q } , function(data) {
 
if(data){
   if(data!='already'){
    
    lnum=lnum-1+2;           
   // $('#informer').show(400);
    $('#ob'+id+' img').attr("src",'/design/img/checked.png');
    var a=$('#lnum').html();
        $('#lnum').html(a-1+2);
        } else{
               lnum=lnum-1;            
        $('#lnum').html(lnum);
        $('#ob'+id+' img').attr("src",'/design/img/unchecked.png');    
  //      $('#delinformer').show(400);
        }             
    }

});
/*
setTimeout(function () {
 $('#informer').hide(400);
         $('#delinformer').hide(400);
}, 2000);  
*/    
  
}





function GetChar (event,id){

            var chCode = ('charCode' in event) ? event.charCode : event.keyCode;
            if(event.keyCode==13)
            {
            	if(id !='id_str')
            	{
            		SignIn();
	            }
	            else
	            {
             	id_str()
             	}
            }

        }




function sh(id,v){
    
     
    $('#sh'+id).html("<img src='/design/img/loading.gif'/>");
 
     $.get('/act/showhide.php', { id: id, vtype: v} , function(data) {
       // alert(data);
        
       
       $('#sh'+id).html("<span  onclick='sh("+id+","+data+")'><img src='/admin/design/img/"+data+".png'/></span>");
        
        
        });


    
} 
   
 
  
    

    
    
    function delalbum(id){
    
      if(confirm("Удалить?")){
    //$('#sh'+id).html("<img src='/design/img/loading.gif'/>");
 
     $.get('/act/items.delete.php', { id: id} , function(data) {
       // alert(data);
        if(data=='ok'){
       $('#item'+id).hide(300);
       }
       //$('#sh'+id).html("<span  onclick='sh("+id+","+data+")'><img src='/admin/design/img/"+data+".png'/></span>");
        
        
        });
  }

    
}





function SignIn(){
    var data=$('#loginform').serialize();
 $.ajax({
   type: 'POST',
   url: '/act/login.php',
   data: data,
   success: LoginRes
 });

 }



 function  LoginRes(msg){

	if(msg=='ok'){
		window.location.href="/";
	}else{
		$('#ler').show();
		$('#auth').addClass('xred');
	}

}


 function replace(subject){
 			var search= ["<![","CDATA[","]]>"];
 			var replace="";
           var ra = replace instanceof Array,
                   sa = subject instanceof Array,
                   l = (search = [].concat(search)).length,
                   replace = [].concat(replace),
                   i = (subject = [].concat(subject)).length;
           while(j = 0, i--)
                   while(subject[i] = subject[i].split(search[j]).join(ra ? replace[j] || "" : replace[0]), ++j < l);
           return sa ? subject : subject[0];
    }
    
    
    

function delfromcart(id,fr){
 sum=0;
  $.get('/act/listing.php', { action: 'del', id: id} , function(data) {
    
    if(data=='del'){
        for(i=0;i<i_id.length;i++){            
            if(i_id[i]==id){
        i_id.splice(i,1);
        i_obj.splice(i,1);

           
        }

            
       
        }
        



    $('#obj'+id).hide(150);
   $('#lnum').html(i_obj.length);
   $('.lnum').html(i_obj.length);
   if(fr){
      $('#delinformer').show(400);
   $('#xdel').hide();
   $('#xart').show();
   setTimeout(function () {
 $('#delinformer').hide(400);
}, 2000);
   }
  }
  
  if(fr==1){
 $('#lnum').html(lnum-1);  
  }
  
  
  });
  
}

function editq(id){
    sum=0;
 var q=$('#quan'+id).val();
  $.get('/act/listing.php', { action: 'edit', id: id,q:q} , function(data) {
    
    if(data){
    $('#quan'+id).val(data);
    for(i=0;i<i_id.length;i++){
        
        if(i_id[i]==id){
            i_obj[i]=q;
        }

           
    }

  
  }
  });
  
  
}

function listing2(){

$.get('/act/listing.php', { action: 'all', id: '0' } , function(data) {
   $('#lnum').html(0);
   testc();
   });
}

function listing(id)
{
   
     

    
 var q=1;//$('#quan'+id).val();
act='add';  

$('#already'+id).html("<img src='/design/img/loading.gif'/>");
$.get('/act/listing.php', { action: act, id: id, q: q } , function(data) {
 
if(data){
   if(data=='already'){
    alert('Товар уже в корзине. Вы можете отредактировать количество или удалить товар зайдя в раздел корзина!');
   }else{
    lnum=lnum-1+2;
       $('#xdel').show();
    $('#xart').hide();
    $('#informer').show(400);
    var a=$('#lnum').html();
        $('#lnum').html(a-1+2);
        }
        
      
    }


});

setTimeout(function () {
 $('#informer').hide(400);
}, 2000);

 }
 
 
 function tpl(id,q){
    
var tpl="В корзине <span class='already_quan' id='already_quan"+id+"'>"+q+"</span> упак.";    
    
return tpl;    
 }
 
 
 
 
 
 
 
 
 function discount(e)
{
   
var a=$('#discount'+e).val();   
var sum= $('.sum').html();
 
xsum=sum/100*a;
xsum=sum-xsum;
xsum=xsum.toFixed(2);
if(xsum<=0){
    alert("Вы серьёзно?");
   
    exit();
}

$('.sum').css('text-decoration','line-through');


var z="<div style='padding:20px 0;'><font style='font-size:90%;'>Сумма со скидкой: <font color='red' style='font-size:130%;'>"+xsum+"</font> тенге</font><br><br/><input type='button' onclick='reset()' value='Отменить скидку' style='width:170px;background-color:red;color:white;border:1px solid brown;' /></div>";

$('.dtxt').html(z);
$('.dtxt2').hide();

$('.dtxt').show();



/*
$.get('/act/listing.php', { action: 'discount', a: a, sum:sum} , function(data) {
 
if(data){
    alert(data));
    
   if(data=='already'){
    alert('Товар уже в корзине. Вы можете отредактировать количество или удалить товар зайдя в раздел корзина!');
   }else{
       $('#xdel').show();

        }
        
      
    }


});
*/

 }
 
 
 
 
 
 function resd(){
    $('.dtxt2').show();
    $('.dtxt1').hide();
    
    
 }
 
 function reset(){
    $('.dtxt').hide();
    $('.dtxt2').hide();
    $('.dtxt1').show();
    $('.sum').css('text-decoration','none');
    
    $('#discount1').val('');
    $('#discount2').val('');
 } 
 
 
 

 
 