<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>
<xsl:import href="splash.xsl"/>

<xsl:template name="cnt">
    <xsl:call-template name="splash" />
<link href="design/style/map.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="design/js/langvars.js"></script>

<style>
.dd{color:green;font-size:12px;}
.uu{color:red;font-size:12px;}

</style>
<div align="center"><a href="/admin/">&lt;&lt; На главную</a></div>
<div style="display:none;" id="adds">
<form action="ajax/langvars.modif.php"  method="POST">    <input name="action" type="hidden" value="add"/>
<input name="countL"  id="countL" type="hidden" value="1"/>
ссылка
<input name="link" id="Tlink" type="text" value=""/> <br/>
Привязка к модулю
 <select size="1" name="idmodules" id="TidModules">
<xsl:for-each select="langvars/mod">
      <option >
<xsl:attribute name="value">
<xsl:value-of select="@id" />
</xsl:attribute>
	<xsl:value-of select="@title"/>
          </option>
    </xsl:for-each>
    </select>
    <br/>
    <a onclick="more('','')">еще</a>
    <div id="more"></div>

    <br/><br/>

<input type="submit" value="Сохранить"/>
</form>  <br/> <br/> <br/>
</div>



<div style="">
<a onclick="callSplash('adds')" style="color:green;">Добавить переменную</a>

<form  action="" method="GET">

Выбрать модуль:
<select name="idmod" style="width:300px;" >
	<xsl:for-each select="langvars/mod">
	<option>
	 <xsl:attribute name="value">
		<xsl:value-of select="@id" />
	</xsl:attribute>
	<xsl:if test="@selected">
	<xsl:attribute name="selected">
		<xsl:text>true</xsl:text>
	</xsl:attribute>
	</xsl:if>
	<xsl:value-of select="@title"/>
		    </option>
    </xsl:for-each>

</select>
<input type="submit" value="показать"/>
</form>
</div>
        <br/>
<table border="1" background-color="#ffffff" width="100%" cellspacing="2" cellpadding="4" style="border-collapse:collapse;"  bordercolor="grey" >
	<tr style="background-color:#cecece;height:20px;">
		<td>ID</td>
		<td>Переменная</td>
		<td>значение</td>
		<td width="120" >действие</td>
	</tr>
	<xsl:for-each select="//site/langvars/mod[@selected]/item">
	<tr>
		<td><xsl:value-of select="@id" /></td>
		<td><xsl:value-of select="link" /></td>
		<td><xsl:value-of select="val" /></td>
     	<td>
     		<a class="e dd" >
				<xsl:attribute name="onclick">
					<xsl:text>details('</xsl:text><xsl:value-of select="link" /><xsl:text>'</xsl:text>,<xsl:value-of select="../@id" /><xsl:text>)</xsl:text>
				</xsl:attribute>
				редактировать
			</a> /
			<a class="e uu">
				<xsl:attribute name="onclick">
					<xsl:text>deletel(</xsl:text><xsl:value-of select="@id" /><xsl:text>)</xsl:text>
				</xsl:attribute>
				Удалить
			</a>
	    </td>
    </tr>
    </xsl:for-each>
</table>

</xsl:template>

</xsl:stylesheet>
