<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>
<xsl:import href="login.xsl"/>
<xsl:import href="images.xsl"/>

<xsl:template name="cnt">


<h1><xsl:value-of select="content/page/title"/></h1>
<xsl:value-of select="content/page/text"/>

<div class="images">
	<xsl:call-template name="images"/>
</div>

<p><a href="/en/about">English</a></p>
<p><a href="/ru/about">Russian</a></p>


</xsl:template>
</xsl:stylesheet>

