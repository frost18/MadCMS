<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" method="xml"
                        encoding="utf-8" indent="yes" />



<xsl:template match="site">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title> <xsl:value-of select="content/page/title" /></title>
		<link type="text/css" rel="stylesheet" href="/design/css/global.css" />

		<meta name="keywords">
			<xsl:attribute name="content">
                <xsl:value-of select="content/page/keyw" />
             </xsl:attribute>
		</meta>
		<meta name="description">
			<xsl:attribute name="content">
                <xsl:value-of select="content/page/desc" />
             </xsl:attribute>
		</meta>
	</head>

	<body>

		<div>Шапка <xsl:value-of select="content/page/title" /> страницы</div>

		<div class="top-menu">
			<ul>
				<xsl:for-each select="content/menus/item[@position='top']">
					<li>
						<xsl:attribute name="class">
							<xsl:if test="@selected=1">
								<xsl:text> topselected</xsl:text>
							</xsl:if>
						</xsl:attribute>
						<a>
							<xsl:attribute name="href">
								<xsl:if test="link != '' ">
									<xsl:value-of select="link"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:value-of select="title"/>
						</a>
					</li>
				</xsl:for-each>
			</ul>
			<div class="clear"> </div>
		</div>


		<div>
			<xsl:call-template name="cnt"/>
		</div>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>















