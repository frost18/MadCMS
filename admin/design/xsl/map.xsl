<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>
<xsl:import href="splash.xsl"/>

<xsl:template name="cnt">



    <xsl:call-template name="splash" />
<link href="design/style/map.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="design/js/map.js"></script>
<script>
function removeItem(id){
	if(confirm("Удалить"))
	{
  		 $.ajax({
			type: 'POST',
			url: '/admin/ajax/map.remove.php',
			data: 'id='+id,
			success: function(data) {
			if(data=='ok'){
				$('#item'+id).hide('slow');
//   				 $('#item'+id).remove();
   			}else
   			{
   				alert('Произошла ошибка! Попробуйте обновить страницу!');
   			}

				  }
			});
	}
}
    $(document).ready(function(){
$('#badd').click(function(){
		$('#add').show();
	});


	  });


        function _close(){
		$('#add').hide();
	}
</script>


    <hr/><div align="center"><a href="/admin/"> На главную</a></div>

   <!--div>
    <a href="/admin/map.php">
    <xsl:if test="xshow='none'">
    <xsl:attribute name="style">
 		<xsl:text>background-color:yellow;</xsl:text>
 	</xsl:attribute>
    </xsl:if>

    Все разделы</a> | <a href="/admin/map.php?show=nav">
     <xsl:if test="xshow='nav'">
    <xsl:attribute name="style">
 		<xsl:text>background-color:yellow;</xsl:text>
 	</xsl:attribute>
    </xsl:if>
    Только меню сайта</a> | <a href="/admin/map.php?show=notnav">
     <xsl:if test="xshow='notnav'">
    <xsl:attribute name="style">
 		<xsl:text>background-color:yellow;</xsl:text>
 	</xsl:attribute>
    </xsl:if>
    Только сервисные разделы</a>
   </div-->
   



 
<hr/>
 
 
<xsl:if test="service/@sec!=0">

<h3 style="margin-bottom:0px;"><xsl:value-of select="service/@sec"/></h3>
<a href="/admin/sections.php" style="font-size:80%;">- назад к выбору меню</a>
</xsl:if>
<br/><br/>



<div style="height:25px;width:100%" align="left">
<a id="badd" style="border-bottom:1px dashed blue;color:blue;cursor:pointer; font-size:90%;">Добавить страницу</a>
 <br/>
 </div>
 <br/>
<div style="display:none;" id="add">
<h3>Добавление нового раздела</h3>
<form action="ajax/map.add.php"  method="post">

<xsl:if test="//site/service/@left=1">
    <input type="hidden" name="left" value="ok" />
</xsl:if>
<ul>

<li>
Название раздела:   <input name="title" type="text" value=""/> 
</li>
<li>
Модуль: 
<select size="1" name="module">
<xsl:for-each select="mods/item">
	<option>
				<xsl:attribute name="value" >
             	<xsl:value-of select="name" />
              </xsl:attribute>
                   <xsl:if test="name = 'text_content'">
                   <xsl:attribute name="selected" >
             	<xsl:text>true</xsl:text>
              </xsl:attribute>
                   </xsl:if>
	<xsl:value-of select="title"/>
    </option>
    </xsl:for-each>
</select>    </li>
<li>
Ссылка: <input name="link" type="text" value=""/> 
</li>
<li>
Привязываем текстовое поле к странице? <input name="cnt" type="checkbox" value="ON" checked="true"/></li> 
<li> Свой номер <input name="cntnum" type="text" value="-"/>
</li>
Видимость страницы <select size="1" name="status">
  
    <option value="0" selected="true" >Скрыт</option>
    <option value="1">Включен</option>
</select>    <br/>

    <input type="hidden" name="id_navi" >
    <xsl:attribute  name="value">
        <xsl:value-of select="service/@navi" />
    
    </xsl:attribute>
    </input>
    
    
    <input type="hidden" name="id_sections" >
    <xsl:attribute  name="value">
        <xsl:text>2</xsl:text>
    
    </xsl:attribute>
    </input>
        
    
<!--
Относится к навигации? <select size="1" name="id_navi">
  <option value="1">да</option>
    <option value="0">нет</option>
</select>    <br/-->
<li>
Родительский раздел

<select size="1" name="parent">
  <option value="0">---</option>
<xsl:for-each select="map/item[@parent=0 or @mag='www']">
	 <xsl:variable name="id">
             	<xsl:value-of select="@id" />
	</xsl:variable>
	<option>
				<xsl:attribute name="value" >
             	<xsl:value-of select="@id" />
              </xsl:attribute>

	<xsl:value-of select="title"/>
    </option>
 <xsl:if test="count(//site/map/item[@parent=$id]) != 0" >
		<xsl:call-template name="childop">
    		 <xsl:with-param name="id" >
             	<xsl:value-of select="@id" />
              </xsl:with-param>
              <xsl:with-param name="pref" >
             	<xsl:text> - </xsl:text>
              </xsl:with-param>
		</xsl:call-template>
	</xsl:if>

    </xsl:for-each>
</select>    </li>
<li>

<input type="submit" value="Добавить"/>
<input type="button" value="Закрыть" onClick="_close()"/>
</li>
</ul>
</form> 
</div>

<ul>
	<xsl:for-each select="map/item[@parent=0 or @mag='www']">
	<li>
	<xsl:attribute name="id">
 		<xsl:text>item</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
	 <xsl:variable name="id">
             	<xsl:value-of select="@id" />
	</xsl:variable>
	<xsl:variable name="lnk">
             	<xsl:text>/</xsl:text><xsl:value-of select="link" />
	</xsl:variable>
	<img src="/admin/design/img/ar.png"/><xsl:text> </xsl:text><xsl:value-of select="title"/>



         <xsl:choose>
     <xsl:when test="@idcnt != 0" >
     <a style="color:green;font-size:12px;">
     <xsl:attribute name="href">
 		<xsl:text>/admin/ajax/map.cnt.remove.php?id_route=</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
    
    (<xsl:value-of select="@idcnt"/>)
     
     
     </a>
     </xsl:when>
     <xsl:otherwise>
     <a style="color:brown;" class="icons_link">
     <xsl:attribute name="href">
 		<xsl:text>/admin/ajax/map.cnt.add.php?id_route=</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
     <img src="/admin/design/img/link.gif"/></a>
     </xsl:otherwise>
</xsl:choose>
                  <span>   </span>
                        <a class="icons_link" target="_balnk" >
                <xsl:attribute name="href">
<xsl:value-of select="$lnk" />
 	</xsl:attribute>
               <img src="/admin/design/img/for.png"/></a>

            <span>   </span>

             <a>
                  <xsl:attribute name="href">
 	<xsl:text>/admin/details.php?id=</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
     <img src="/admin/design/img/edit.png" style="width:16px;" align="texttop"/></a>
                   <span>   </span>
     
<a style="cursor:pointer;">
                    <xsl:attribute name="href">
                        <xsl:text>/admin/ajax/showhide.php?id=</xsl:text><xsl:value-of select="@id"/><xsl:text>&amp;vtype=</xsl:text><xsl:value-of select="@vis"/>                   
                    </xsl:attribute>
                        <img >
                            <xsl:attribute name="src">
                                <xsl:text>/design/img/</xsl:text><xsl:value-of select="@vis"/><xsl:text>.png</xsl:text>                   
                            </xsl:attribute>
                        </img>
                         
                    </a>
<span>   </span>

	<a class="icons_link">
 	<xsl:attribute name="onclick">
 		<xsl:text>removeItem(</xsl:text><xsl:value-of select="@id" /><xsl:text>)</xsl:text>
 	</xsl:attribute>
<img src="/admin/design/img/del.png"/>
	</a>




	<xsl:if test="count(//site/map/item[@parent=$id]) != 0" >
    
		<xsl:call-template name="child">
    		 <xsl:with-param name="id" >
             	<xsl:value-of select="@id" />
              </xsl:with-param>
               <xsl:with-param name="lnk" >
             	<xsl:value-of select="$lnk" />
              </xsl:with-param>
		</xsl:call-template>
	</xsl:if>
    </li>
    </xsl:for-each>
</ul>
<p>
<br/>
</p>
<p>
<br/>
</p>
</xsl:template>

<xsl:template name="child">
    <xsl:param name="id" select="$id"/>
        <xsl:param name="lnk" select="$lnk"/>

<ul style="margin-top:15px;">
	<xsl:for-each select="//site/map/item[@parent=$id]">
	<li>
	<xsl:attribute name="id">
 		<xsl:text>item</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
	<img src="/admin/design/img/artop.png"/><xsl:text> </xsl:text> <xsl:value-of select="title"/>


<xsl:choose>
     <xsl:when test="@idcnt != 0" >
     <a style="color:green;font-size:12px;" class="icons_link">
     <xsl:attribute name="href">
 		<xsl:text>/admin/ajax/map.cnt.remove.php?id_route=</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
     (<xsl:value-of select="@idcnt"/>)</a>
     </xsl:when>
     <xsl:otherwise>
     <a style="color:brown;" class="icons_link">
     <xsl:attribute name="href">
 		<xsl:text>/admin/ajax/map.cnt.add.php?id_route=</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
     <img src="/admin/design/img/link.gif"/></a>
     </xsl:otherwise>
</xsl:choose>
                  <span>   </span>
               <a class="icons_link" target="_balnk" >
                <xsl:attribute name="href">
 		<xsl:value-of select="$lnk" /><xsl:text>/</xsl:text><xsl:value-of select="link" />
 	</xsl:attribute>
               <img src="/admin/design/img/for.png"/></a>
            <span>   </span>
                  <a>
                   <xsl:attribute name="href">
 	<xsl:text>/admin/details.php?id=</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
                  
                  <img src="/admin/design/img/edit.png" style="width:16px;" align="texttop"/></a>
                   <span>   </span>

<a style="cursor:pointer;">
                    <xsl:attribute name="href">
                        <xsl:text>/admin/ajax/showhide.php?id=</xsl:text><xsl:value-of select="@id"/><xsl:text>&amp;vtype=</xsl:text><xsl:value-of select="@vis"/>                   
                    </xsl:attribute>
                        <img >
                            <xsl:attribute name="src">
                                <xsl:text>/design/img/</xsl:text><xsl:value-of select="@vis"/><xsl:text>.png</xsl:text>                   
                            </xsl:attribute>
                        </img>
                         
                    </a>
<span>   </span>

	<a style="color:red;font-size:12px;" class="icons_link">
 	<xsl:attribute name="onclick">
 		<xsl:text>removeItem(</xsl:text><xsl:value-of select="@id" /><xsl:text>)</xsl:text>
 	</xsl:attribute>
	<img src="/admin/design/img/del.png"/>
	</a>



	<!--xsl:if test="@idcnt != 0" >
     	<a><xsl:value-of select="@idcnt"/></a>
     </xsl:if-->

		<xsl:call-template name="child">
    		 <xsl:with-param name="id" >
             	<xsl:value-of select="@id" />
              </xsl:with-param>
              	 <xsl:with-param name="lnk" >
             	<xsl:value-of select="$lnk" /><xsl:text>/</xsl:text><xsl:value-of select="link" />
              </xsl:with-param>
		</xsl:call-template>
    </li>
    </xsl:for-each>
</ul>

</xsl:template>



<xsl:template name="childop">
    <xsl:param name="id" select="$id"/>
    <xsl:param name="pref" select="$pref"/>
	<xsl:for-each select="//site/map/item[@parent=$id]">
		<option>
			<xsl:attribute name="value" >
             	<xsl:value-of select="@id" />
              </xsl:attribute>
			<xsl:value-of select="$pref"/><xsl:value-of select="title"/>
		</option>
		<xsl:call-template name="childop">
    		 <xsl:with-param name="id" >
             	<xsl:value-of select="@id" />
              </xsl:with-param>
              <xsl:with-param name="pref" >
             	<xsl:value-of select="$pref" /><xsl:text>- </xsl:text>
              </xsl:with-param>
		</xsl:call-template>
    </xsl:for-each>
</xsl:template>


</xsl:stylesheet>
