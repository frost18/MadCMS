<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="splash">


<link href="design/style/splash.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="design/js/splash.js"></script>

<table width="350" height="150" border="1" id="splash" style="display:none;">
<tr height="20">
<td bgcolor="#ffcc00" id="dragLine">
<input type="button" value="Закрыть" onclick="closeSplash()" />
</td>
</tr>
<tr>
<td id="SpIn" bgcolor="#fff"></td>
</tr>
<tr height="20">
<td bgcolor="#ffcc00"></td>
</tr>

</table>


</xsl:template>


</xsl:stylesheet>
