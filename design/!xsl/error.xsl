<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>

<xsl:template name="cnt">


<h1><xsl:value-of select="content/page/title"/></h1>
<xsl:value-of select="content/page/text"/>


</xsl:template>
</xsl:stylesheet>

