<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ZoneList">
        <h2 class="block-title text-center">
            <xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
        </h2>
        <div class="index-6-slide relative">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <xsl:apply-templates select="Zone/News"></xsl:apply-templates>
                </div>
            </div>
            <div class="arrow-button gray-arrow">
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News">
        <div class="swiper-slide">
            <div class="box-info">
                <div class="header d-flex aic">
                    <div class="img">
                        <img class="lazyload">
                        <xsl:attribute name="data-src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        </img>
                    </div>
                    <div class="wrapper d-flex flex-column">
                        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                        <div class="title text-main f-16 fw-6">
                            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                        </div>
                        <div class="ctn text-6 f-12 fw-4">
                            <xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
                        </div>
                        <div class="ctn text-6 f-12 fw-4">
                            <xsl:value-of disable-output-escaping="yes" select="BriefContent">
                            </xsl:value-of>
                        </div>
                    </div>
                </div>
                <div class="body">
                    <div class="quote"> <img class="lazyload" data-src="/Data/Sites/2/skins/timbee/img/index/quote.png" /></div>
                    <div class="ctn text-6 f-14 fw-4">
                        <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
