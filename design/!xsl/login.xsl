<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>

<xsl:template name="cnt">
<xsl:choose>

    <xsl:when test="service/is_auth = 1">
        <h3>Вы вошли как <xsl:value-of select="user/fio" />!</h3>
	    <a href="/logout">Logout</a>
    </xsl:when>

	<xsl:otherwise>
		<form method="POST" action="/ru/login">
	        <input type="text" name="username">
	            <xsl:attribute name="value">
	                <xsl:value-of select="login/value" /> <!-- Добавление занчений в атрибут-->
	             </xsl:attribute>
	        </input>
	        <input type="password" name="password" value=""/>
	        <input type="submit" name="submit" value="Войти"/>
	    </form>
	</xsl:otherwise>
</xsl:choose>


</xsl:template>
</xsl:stylesheet>

