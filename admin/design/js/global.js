function toggle(id){
	var obj=$('#'+id);
	if(obj.css('display')=='none')
	{
		obj.show('slow');
	}
	else
	{
		obj.hide(500);
	}

}