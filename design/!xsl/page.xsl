<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>
<xsl:import href="login.xsl"/>

<xsl:template name="page">


<h1><xsl:value-of select="content/page/title"/></h1>
<xsl:value-of select="content/page/text"/>

<p><a href="/en/page/about">English</a></p>
<p><a href="/ru/page/about">Russian</a></p>

<xsl:call-template name="login"/>


</xsl:template>
</xsl:stylesheet>

