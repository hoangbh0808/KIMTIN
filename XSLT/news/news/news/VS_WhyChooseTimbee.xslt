<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/NewsList">
        <xsl:apply-templates select="News"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="News">
        <div class="big-wrapper d-flex">
            <div class="box-img">
                <div class="container">
                    <div class="img">
                        <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        </img>
                    </div>
                    <div class="hidden">
                        <xsl:apply-templates select="NewsImages"></xsl:apply-templates>
                    </div>
                </div>
            </div>
            <div class="box-content">
                <div class="container">
                    <h2 class="block-title" data-aos="fade-up" data-aos-offset="0" data-aos-anchor-placement="center-bottom">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </h2>
                    <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="NewsImages">
        <img>
        <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        </img>
    </xsl:template>
</xsl:stylesheet>
