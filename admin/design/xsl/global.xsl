<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" method="xml"
                        encoding="utf-8" indent="yes" />

<xsl:template match="site">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=7"/>
  <meta name="description" content=""/>
  <meta name="keywords" content=""/>
 <title>Админка</title>
<link href="/admin/design/style/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/admin/design/js/jq.js"></script>
<script type="text/javascript" src="/admin/design/js/global.js"></script>

<style>
  

</style>
</head>
<body bottommargin="10" topmargin="10" leftmargin="20" rightmargin="20" >
         <xsl:call-template name="cnt" />
 </body>
</html>
</xsl:template>
</xsl:stylesheet>













