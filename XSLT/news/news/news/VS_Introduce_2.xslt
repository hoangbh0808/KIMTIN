<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/NewsList">
        <h2 class="block-title text-white text-center">
            <xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
        </h2>
        <ul class="ls-none p-0 d-flex aic jcb">
            <xsl:apply-templates select="News"></xsl:apply-templates>
        </ul>
    </xsl:template>
    <xsl:template match="News">
        <li class="text-center text-white">
            <div class="icon">
                <img class="">
                <xsl:attribute name="src">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                </img>
            </div>
            <div class="title f-16 fw-6 text-upp">
                <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
            </div>
            <div class="ctn f-14">
                <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
            </div>
        </li>
    </xsl:template>
</xsl:stylesheet>