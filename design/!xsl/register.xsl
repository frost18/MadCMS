<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="global.xsl"/>
<xsl:template name="cnt">

	<form method="POST" action="/ru/register">
		<p><span class="fl">ФИО:</span> <input type="text" class="fr" name="fio">
	        <xsl:attribute name="value">
                <xsl:value-of select="POST/fio" /> <!-- Добавление занчений в атрибут-->
            </xsl:attribute>
        </input></p>

		<p><span class="fl">login:</span> <input class="fr" type="text" name="username">
            <xsl:attribute name="value">
                <xsl:value-of select="POST/username" /> <!-- Добавление занчений в атрибут-->
            </xsl:attribute>
        </input></p>

		<p><span class="fl">Пароль:</span> <input class="fr" type="password" name="password" value=""/><br /></p>
		<p><span class="fl">Повторите пароль:</span> <input class="fr" type="password" name="password2" value=""/><br /></p>
        <input type="submit" name="submit" value="Регистрация"/><br />
    </form>

</xsl:template>
</xsl:stylesheet>

