<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="images">
	<xsl:for-each select="content/page/images/item">
		<div class="image-box">
			<div class="image">
				<a>
					<xsl:attribute name="href">
						<xsl:if test="link != '' ">
							<xsl:value-of select="link"/>
						</xsl:if>
					</xsl:attribute>
					<xsl:value-of select="title"/>
					<img>
						<xsl:attribute name="src">
							<xsl:if test="link != '' ">
								<xsl:value-of select="link"/>
							</xsl:if>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div class="date"><xsl:value-of select="date" /></div>
		</div>
	</xsl:for-each>


</xsl:template>
</xsl:stylesheet>

