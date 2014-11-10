 ///////////////////////////////////////////////////////
var __bbred="0";


function _ed(id)
{
	if(__bbred==0)
	{
		__bbred=id;
		document.getElementById(__bbred).contentEditable="true";
		$('#'+__bbred).removeClass('_brd');
		$('#'+__bbred).addClass('_brdred');
		$('.Window').css('display','');
	}
}

function _off(id)
{

    if(document.getElementById(id).contentEditable!="true"){
		$('#'+id).removeClass('_brd');
  
	}

}

function _on(id)
{
	if(__bbred==0)
	{
	  
		$('#'+id).addClass('_brd');
        
        
	}
}

function save(){      // alert(1);
//  document.getElementById(__bbred).value=document.getElementById().innerHTML;
  // $('#'+id)('form').submit();
 
 var a=document.getElementById(__bbred).innerHTML;

$.post('/act/save.cnt.php', { sub: __bbred, data:a, curlang:'rus' } , function(data) { 
		document.getElementById(__bbred).contentEditable="false";
        $('#'+__bbred).html(data);
		$('#'+__bbred).removeClass('_brdred');
		$('.Window').css('display','none');
		__bbred=0;

});
 }




 ///////////////////////////////////////////////////////

var html2=0;
var buf='';
function text2html(){
	var obj=document.getElementById(__bbred);
 if(html2==0){
 	html2=1;
    buf=obj.innerHTML;
        if(typeof(obj.innerText)!='undefined') {
           obj.innerText=buf;
        } else {
           obj.textContent=buf;
        }
 }else{
if(typeof(obj.innerText)!='undefined') {
           obj.innerHTML=obj.innerText;
        } else {
           obj.innerHTML=obj.textContent;
        }
   buf='';
   html2=0;
 }

}
function fs(cnt){
insertHTML(cnt, '<img src="/ico/bold.gif">');

}
function imgs(){
var img=document.getElementById('image_url').value;
var img_align=document.getElementById('img_align').value;
var img_padding=document.getElementById('img_padding').value;
insertHTML('content', '<img src="'+img+'" style="padding:'+img_padding+'px; float: '+img_align+';">');
}


var isIE = /*@cc_on!@*/false;

// Если в IE не установить фокус на окне редактируемого фрейма,
// то в дальнейшем он может вставить код наверх вашей страницы, а не во фрейм ;)
function insertHTML(cnt, html){
document.getElementById(cnt).focus();
var SelectionRange = isIE ? document.selection.createRange() : window.getSelection().getRangeAt(0);

// вставим картинку

if (isIE) {
    // тут все просто
    SelectionRange.pasteHTML(html);
} else {
    // для остальных используем вспомогательный тег
    SelectionRange.deleteContents();
    var el = document.createElement("SPAN");
    document.getElementById(cnt).appendChild(el);

    // Firefox не поймет, если вы сразу замените outerHTML. В версиях ниже 3-ей такое свойство вообще у него отсутствует.
    el.innerHTML = html;
    SelectionRange.insertNode(el);
    el.outerHTML = html;
}
          }
 /////////////////////////////////////////////////////// table begin

 function tables(){


 }

 ///////////////////////////////////////////////////////
 var dx = 0; // Разница между координатами курсора мыши X и свойством left дива TopLine
var dy = 0; // Разница между координатами курсора мыши Y и свойством top дива TopLine

$(document).ready(InitHandlers);

function InitHandlers() // Прикрепляем обработчики
{
 $("#topline").mousedown(MouseDownEvent);
 $("#topline").mouseup(MouseUpEvent);
}

function MouseDownEvent(e)
{
              $("#topline").removeClass('tout').addClass('ton');
 dx = e.pageX - parseInt($(".Window").css("left"));
 dy = e.pageY - parseInt($(".Window").css("top"));
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
 $(".Window").css("left",e.pageX - dx);
 $(".Window").css("top",e.pageY - dy);
}


/////////////////////////////////////////////////////// table end

function tbsw(){
document.getElementById('prfontsb').style.display='none';
document.getElementById('tablesb').style.display='none';
document.getElementById('linksb').style.display='none';
document.getElementById('imagesb').style.display='none';
document.getElementById('colorsb').style.display='none';
document.getElementById('textsb').style.display='none';
document.getElementById('btn').style.display='none';
}

var CoTb=new Array();

function fillcolors(){
	var buf2=0;
    var cc=new Array('00','33','66','99', 'cc','ff');

for(var i =0; i<6; i++){
	for(var j =0; j<6; j++){
		for(var x =0; x<6; x++){
CoTb[buf2]='#'+cc[i]+''+cc[j]+''+cc[x];
               buf2=buf2+1;
		}
    }
}
}
                fillcolors();

function drawcolors(vr){
var buf2=0;
	var Tps=new Array();
	Tps[0]=new Array('ForeColor','textsb');
		Tps[1]=new Array('BackColor', 'colorsb');
var Tb=document.createElement('table');
     Tb.align="left";
          Tb.cellspacing="0";
                    Tb.cellspadding="0";
                                        Tb.border="1";
          Tb.className="colorkit";
          for(i=0;i<6;i++){

      var Tr=document.createElement('tr');
                for(j=0;j<36;j++){
      var Td=document.createElement('td');
Td.bgColor=CoTb[buf2];

      Td.innerHTML="<a onClick=\"document.execCommand('"+Tps[vr][0]+"', false, '"+CoTb[buf2]+"')\"   ><img src='/ico/none.png'></a>";
      buf2=buf2+1;
      Tr.appendChild(Td);

      }
      Tb.appendChild(Tr);
                }
document.getElementById(Tps[vr][1]).appendChild(Tb);

}

function tables(a,w,h,c,r,b,we,he){
var cnt=document.createElement('div');
var table=document.createElement('table');
if(we=='per'){we='%';}
if(he=='per'){he='%';}
table.width=w+""+we;
table.heigth=h+""+he;
table.border=b;
table.align=a;
table.style.borderCollapse="collapse";
for(var i=0;i<r;i++){
var tr=document.createElement('tr');
for(j=1;j<=c;j++){
var td=document.createElement('td');
td.innerHTML='&nbsp;';
tr.appendChild(td);
	}

table.appendChild(tr);
}
cnt.appendChild(table);

 insertHTML('content', cnt.innerHTML);}