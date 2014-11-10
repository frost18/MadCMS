<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>
<xsl:import href="splash.xsl"/>

<xsl:template name="cnt">
    <xsl:call-template name="splash" />
<link href="design/style/map.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="design/js/map.js"></script>

<div align="center"><a href="/admin/">&lt;&lt; На главную</a></div>
<div style="display:">
<form action=""  method="post">    <input name="action" type="hidden" value="add"/>
Название модуля
<input name="name" type="text" value=""/> <br/>
Адрес дизайна
<input name="xsl" type="text" value=""/> <br/>
Имя класса
<input name="classname" type="text" value=""/> <br/>

<input type="submit" value="Добавить"/>
</form>  <br/> <br/> <br/>
</div>


<a onclick="add()">Добавить</a>
<ul>
	<xsl:for-each select="modules/item">
	<li>
	 <xsl:variable name="id">
             	<xsl:value-of select="@id" />
	</xsl:variable>
	<xsl:value-of select="name"/>
    </li>
    </xsl:for-each>
</ul>

</xsl:template>

</xsl:stylesheet>
