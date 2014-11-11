var CC=0;
   function more(lang,val,ids){

   CC=CC-1+2;
   if(lang=='')
   {		if(CC==1)
		{			lang="rus";
		}
		if(CC==2)
		{			lang="eng";
		}
	}
   var more=document.getElementById('more');
 var tmp = document.createElement('DIV');
 id='tmp-'+CC
 tmp.id=id;
  tmp.innerHTML = '<input name="ids[]" type="hidden" value="'+ids+'"/><input name="lang[]" type="text" value="'+lang+'"/><textarea name="val[]">'+val+'</textarea><a onclick=\'remove("'+id+'")\' >скрыть</a>';
   more.appendChild(tmp);

   }
   function remove(id){
    var more=document.getElementById('more');
     var __this=document.getElementById(id);
     more.removeChild(__this);
     }

function details(link,mods){
   /*
$.getJSON("ajax/langvars.details.php",{ 'link': link}, function(json) {
   alert("JSON Data: " + json);
    $.each(json, function(i,item){    	alert(i)
}
 });*/


callSplash('adds');

 $.getJSON('ajax/langvars.details.php',{ 'link': link,'mod': mods}, function(data) {
  var items = [];

  $.each(data, function(key, val) {  	if(key==0){  		$('#Tlink').val(val['link']);
  		$('#TidModules').val(val['idmodules']);  	}
	  more(val['lang'],val['val'],val['id']);
  });


});
}

function deletel(id)
{	if(confirm("Будут удалены значение это переменной во всех языковых врсиях сайта!"))
	{		window.location.href="ajax/langvars.modif.php?action=delete&id="+id;	}
}
