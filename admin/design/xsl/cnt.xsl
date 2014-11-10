<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>
<xsl:import href="splash.xsl"/>

<xsl:template name="cnt">


    <xsl:call-template name="splash" />
<link href="design/style/map.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="design/js/map.js"></script>
<script>
function removeItem(id){	if(confirm("Удалить"))
	{  		 $.ajax({
			type: 'POST',
			url: '/admin/ajax/map.remove.php',
			data: 'id='+id,
			success: function(data) {
			if(data=='ok'){				$('#item'+id).hide('slow');
//   				 $('#item'+id).remove();
   			}else
   			{   				alert('Произошла ошибка! Попробуйте обновить страницу!');   			}

				  }
			});	}
}

</script>
<div style="display:">
<form action="ajax/cnt.add.php"  method="post">
Название раздела
<input name="title" type="text" value=""/> <br/>
Описание
<input name="desc" type="text" value=""/> <br/>


<input type="submit" value="Добавить"/>
</form>  <br/> <br/> <br/>
</div>
















<a onclick="add()">Добавить</a>
<table width="100%" border="1" bgcolor="#ffffff">
<tr style="background-color:#cecece;">
<td>id</td>
<td>Привязка</td>
<td>Заголовок</td>
<td>Описание</td>
<td>Действия</td>
</tr>

	<xsl:for-each select="cnt/item">
	<tr>
	<xsl:attribute name="id">
 		<xsl:text>item</xsl:text><xsl:value-of select="@id" />
 	</xsl:attribute>
	 <xsl:variable name="id">
             	<xsl:value-of select="@id" />
	</xsl:variable>

	<td width="80"><xsl:value-of select="@id" /></td>
		<td><xsl:value-of select="@id_route_map" /></td>
	<td><xsl:value-of select="title"/>    </td>
	<td><xsl:value-of select="desription"/>    </td>

	<td>
	<a>
 	<xsl:attribute name="onclick">
 		<xsl:text>removeItem(</xsl:text><xsl:value-of select="@id" /><xsl:text>)</xsl:text>
 	</xsl:attribute>
	Удалить
	</a>
</td>

       </tr>
    </xsl:for-each>
</table>

</xsl:template>

</xsl:stylesheet>

