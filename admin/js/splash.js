 ///////////////////////////////////////////////////////
 var dx = 0; // Разница между координатами курсора мыши X и свойством left дива TopLine
var dy = 0; // Разница между координатами курсора мыши Y и свойством top дива TopLine

$(document).ready(InitHandlers);

function InitHandlers() // Прикрепляем обработчики
{
 $("#dragLine").mousedown(MouseDownEvent);
 $("#dragLine").mouseup(MouseUpEvent);
}

function MouseDownEvent(e)
{
              $("#dragLine").removeClass('tout').addClass('ton');
 dx = e.pageX - parseInt($("#splash").css("left"));
 dy = e.pageY - parseInt($("#splash").css("top"));
 $("body").bind("mousemove",MouseMoveEvent);
 $(this).css("cursor","move");

}

function MouseUpEvent()
{
 $("body").unbind("mousemove",MouseMoveEvent);
      $(this).removeClass('ton').addClass('tout');

}

function MouseMoveEvent(e)
{
 $("#splash").css("left",e.pageX - dx);
 $("#splash").css("top",e.pageY - dy);
}


/////////////////////////////////////////////////////// table end

   function closeSplash(){
  	$("#splash").hide();
  	   clearSpIn();

}

function clearSpIn(){
    	$("#SpIn").html('');
}

function callSplash(id){

    	$("#splash").show('1000');
    	$("#SpIn").html($("#"+id).html());
    }
