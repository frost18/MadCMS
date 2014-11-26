<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>
<xsl:import href="login.xsl"/>

<xsl:template name="cnt">


<h1><xsl:value-of select="content/page/title"/></h1>

<div class="articles">
	<xsl:for-each select="content/page/childs/item">
		<div class="article">
			<div class="title">
				<a>
					<xsl:attribute name="href">
						<xsl:if test="link != '' ">
							<xsl:value-of select="link"/>
						</xsl:if>
					</xsl:attribute>
					<xsl:value-of select="title"/>
				</a>
			</div>
			<div class="date"><xsl:value-of select="date" /></div>
			<div class="brief"><xsl:value-of select="brief" /></div>
		</div>
	</xsl:for-each>
</div>


</xsl:template>
</xsl:stylesheet>

