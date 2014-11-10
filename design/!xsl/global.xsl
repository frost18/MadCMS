<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" method="xml"
                        encoding="utf-8" indent="yes" />



<xsl:template match="site">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>MADCms: <xsl:value-of select="content/title" /></title>
		<link type="text/css" rel="stylesheet" href="/design/css/global.css" />
	</head>

	<body>

		<div>Шапка <xsl:value-of select="content/name" /> страницы</div>

		<div>
			<xsl:call-template name="cnt"/>
		</div>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>















