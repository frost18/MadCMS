<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="editor">

<div class="Window" style="display:none;">
 <div id="topline" class="tout">Панель форматирования</div>
 <div id="panel">
<a onCLick="document.execCommand('undo',null,false);"><img src="/zed/ico/undo.gif"/></a>
<a onCLick="document.execCommand('redo',null,false);"><img src="/zed/ico/redo.gif"/></a>
          &nbsp;  <img src="/zed/ico/sep.gif"/>   &nbsp;
<a onCLick="document.execCommand('bold',null,false);"><img src="/zed/ico/bold.gif"/></a>
<a onCLick="document.execCommand('italic',null,false);"><img src="/zed/ico/italic.gif"/></a>
<a onCLick="document.execCommand('underline',null,false);"><img src="/zed/ico/underline.gif"/></a>
<a onCLick="document.execCommand('strikethrough',null,false);"><img src="/zed/ico/s.gif"/></a>


          &nbsp;  <img src="/zed/ico/sep.gif"/>   &nbsp;
<a onCLick="document.execCommand('justifyfull',null,false);"><img src="/zed/ico/align_justify.gif"/></a>
<a onCLick="document.execCommand('justifyleft',null,false);"><img src="/zed/ico/align_left.gif"/></a>
<a onCLick="document.execCommand('justifyright',null,false);"><img src="/zed/ico/align_right.gif"/></a>
<a onCLick="document.execCommand('justifycenter',null,false);"><img src="/zed/ico/align_center.gif"/></a>
&nbsp;  <img src="/zed/ico/sep.gif"/>   &nbsp;

<a onCLick="document.execCommand('insertorderedlist',null,false);"><img src="/zed/ico/n_list.gif"/></a>
<a onCLick="document.execCommand('insertunorderedlist',null,false);"><img src="/zed/ico/c_list.gif"/></a>
          &nbsp;  <img src="/zed/ico/sep.gif"/>   &nbsp;
<a onCLick="document.execCommand('subscript',null,false);"><img src="/zed/ico/sub.gif"/></a>
<a onCLick="document.execCommand('superscript',null,false);"><img src="/zed/ico/sup.gif"/></a>
 <div id="spacing"></div>
          <a onCLick="text2html('content');"><img src="/zed/ico/html.gif"/></a>
<a onCLick="document.execCommand('RemoveFormat',null,false);"><img src="/zed/ico/f.gif"/></a>
&nbsp;  <img src="/zed/ico/sep.gif"/>   &nbsp;


                        <span id="sts">
<a id="texts"><img src="/zed/ico/text_color.gif"/></a>
<a id="colors"><img src="/zed/ico/backcolor.gif"/></a>
          &nbsp;  <img src="/zed/ico/sep.gif"/>   &nbsp;



<a id="tables" ><img src="/zed/ico/table.gif"/></a>
<a id="images" ><img src="/zed/ico/picture.gif"/></a>
<a id="links" ><img src="/zed/ico/link.gif"/></a>
<a id="aspan" onClick="document.execCommand('inserthorizontalrule',null,false);"><img src="/zed/ico/hr.gif"/></a>
          &nbsp;  <img src="/zed/ico/sep.gif"/>   &nbsp;

          <a id="prfonts" >F</a>

</span> <div id="spacing"></div>
       <div id="prfontsb" >
         <fieldset style="margin: 7px;"><legend>Свойства шрифта</legend>
          <select class="op" size="1" id="fn">
                       <option value="0" selected="true" >- шрифт не выбран</option>
          <option value="Andale Mono">Andale Mono</option><option value="Arial" >Arial</option><option value="Arial Black">Arial Black</option><option value="Book Antiqua">Book Antiqua</option><option value="Century Gothic">Century Gothic</option><option value="Comic Sans MS">Comic Sans MS</option><option value="Courier New">Courier New</option><option value="Georgia">Georgia</option><option value="Impact">Impact</option><option value="Tahoma">Tahoma</option><option value="Times New Roman">Times New Roman</option><option value="Trebuchet MS">Trebuchet MS</option><option value="Script MT Bold">Script MT Bold</option><option value="Stencil">Stencil</option><option value="Verdana" >Verdana</option><option value="Lucida Console">Lucida Console</option></select>
          &nbsp;

 <select size="1" id="fs" class="op">
             <option value="0" selected="true" >- размер не выбран</option>
  <option value="1" >8 px</option>
    <option value="2">10 px</option>
      <option value="3" >12 px</option>
        <option value="4">14 px</option>
                <option value="5" >18 px</option>
                <option value="6">24 px</option>
                        <option value="7" >36px</option>
</select>
 &nbsp;  <select size="1"  id="fb"  class="op">
            <option value="0" selected="true" >- Стиль не выбран</option>
  <option value="address" >Адрес</option>
    <option value="blockquote">Блок</option>
      <option value="h1" >Заголовок 1</option>
        <option value="h2">Заголовок 2</option>
                <option value="h3" >Заголовок 3</option>
                <option value="h4">Заголовок 4</option>

</select>    <center><br/>
<input type="button" value="Прменить настройки шрифта" onClick="apply(1)" /></center>
</fieldset>  </div>
 <div id="tablesb" >
           <fieldset style="margin: 7px;width:425px;"><legend>Свойства таблицы</legend>
        <form name="" action="" method="post">
 <table border="0" cellpadding="0" cellspacing="0"  align="left" >
 <tr><td colspan="3" align="center"></td></tr>
 <tr><td>
 <ul >
 <li ><input name="wd_add" type="text" value="300"/>
 <select size="1" name="ed_wd_add" style="width:40px;border:1px solid #acacb9;color:#2e2e6b;">
  <option value="px">px</option>
    <option value="per">%</option>
</select>
 &nbsp;&nbsp;Ширина</li>
 <li ><input name="he_add" type="text" value="300"/>
  <select size="1" name="ed_he_add"  style="width:40px;border:1px solid #acacb9;color:#2e2e6b;">
  <option value="px">px</option>
    <option value="per">%</option>
</select>

 &nbsp;&nbsp;Высота </li>
</ul>
</td><td >
 <ul>
<li  ><input name="col_add" type="text" value="2"/>&nbsp;&nbsp;Столбцов </li>
 <li ><input name="row_add" type="text" value="2"/>&nbsp;&nbsp;Строк</li>
  </ul>
  </td>
  <td >
 <ul>
<li  ><input name="border_add" type="text" value="1"/> рамка</li>
 <li ><select size="1" name="align_add">
  <option value="left">Слева</option>
    <option value="right">Справа</option>
      <option value="center">По центру</option>
</select>&nbsp;&nbsp;Расположение</li>
  </ul>
  <br/>
  <input type="button" value="Вставить" style="width:100px;" onclick="iTtable(this.form)" />
  </td>
  </tr>
 </table> </form>  </fieldset>
  </div>
<div id="imagesb">
           <fieldset style="margin: 7px;width:425px;"><legend>Укажите параметры изображения</legend>

URL&nbsp;<input id="image_url" name="image_url" type="text" value=""/>&nbsp;&nbsp;&nbsp;
Расположение
<select size="1" name="align" id="img_align">
  <option value="right">Справа</option>
    <option value="left" selected="true">Слева</option>
</select>
&nbsp;&nbsp;&nbsp;                        Отступ
<input type="input" value="5" style="width:20px;" id="img_padding" />
       <br/> <a onclick="window.open('/fm.php?vv=image_url','new','width=300,height=200,toolbar=0')" style="line-height:25px;text-decoration:underline;">Посмотреть на сервере</a><br/>
       <input type="button" value="Вставить" onclick="imgs()" />
</fieldset>

</div>
<div id="linksb">
           <fieldset style="margin: 7px;width:425px;"><legend>Укажите параметры ссылки</legend>

URL&nbsp;<input id="link_url" name="link_url" type="text" value=""/>&nbsp;&nbsp;&nbsp;открывать в новом окне <input name="target" id="target" type="checkbox" value="ON" checked="true" />
       <br/> <a onclick="window.open('/fm.php?vv=link_url','new','width=300,height=200,toolbar=0')" style="line-height:25px;text-decoration:underline;">Посмотреть на сервере</a><br/>
       <input type="button" value="Вставить" onclick="document.execCommand('createlink',false, document.getElementById('link_url').value);" />&nbsp;&nbsp;&nbsp;<input type="button" value="Удалить" onclick="document.execCommand('unlink',false, document.getElementById('link_url').value);"/>
</fieldset>
</div>
<div id="textsb">

</div>
<div id="colorsb"></div>
<div id="btn">
<a onclick="tbsw()">Скрыть</a>
                  </div>
                   <div id="btns" align="left">     <input type="button" onclick="window.location.reload(0);" value="Отменить"/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          <input type="button" onClick="save();" value="Сохранить"/></div>
</div>
<div id="bottomline"></div>
</div>



<form name="" action="/ajax/text.save.php" method="post" id="form">
<input name="save" type="hidden" value="" id="save" />
<input name="curlang" type="hidden">
 <xsl:attribute name="value">
<xsl:value-of select="//site/service/curlang" />
      </xsl:attribute>

</input>
<input name="action" type="hidden" value="save"  />
</form>
<script type="text/javascript">
<xsl:text disable-output-escaping="yes">
              <![CDATA[



drawcolors(0);
drawcolors(1);


    $("#sts a").click(function () {
    if(this.id=='aspan'){return 0;}
    	tbsw();
    	    	var buf="#"+this.id+"b";

     $(buf).show(1000);
         	    	     $('#btn').show(1000);
    });


                                                tbsw();


function insert_file_link(c,f,ty){
document.getElementById(ty).value='/'+c+'/'+f;
}

function iTtable(frm){
var a=frm.align_add.value;
var w=frm.wd_add.value;
var h=frm.he_add.value;
var c=frm.col_add.value;
var r=frm.row_add.value;
var b=frm.border_add.value;
var we=frm.ed_wd_add.value;
var he=frm.ed_he_add.value;

tables(a,w,h,c,r,b,we,he);
}

 function apply(id){

  var fs=document.getElementById('fs').value;
  var fn=document.getElementById('fn').value;
  var fb=document.getElementById('fb').value;


if(fs!=0){
   document.execCommand('FontSize',null,fs);
}
if(fn!=0){
   document.execCommand('FontName',null,fn);
}
if(fb!=0){
   document.execCommand('FormatBlock',null,fb);
}

 }


]]>

  </xsl:text>
</script>
</xsl:template>
</xsl:stylesheet>
