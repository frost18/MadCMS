var CC=0;
   function more(lang,val,ids){

   CC=CC-1+2;
   if(lang=='')
   {
		{
		}
		if(CC==2)
		{
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
    $.each(json, function(i,item){
}
 });*/


callSplash('adds');

 $.getJSON('ajax/langvars.details.php',{ 'link': link,'mod': mods}, function(data) {
  var items = [];

  $.each(data, function(key, val) {
  		$('#TidModules').val(val['idmodules']);
	  more(val['lang'],val['val'],val['id']);
  });


});
}

function deletel(id)
{
	{
}