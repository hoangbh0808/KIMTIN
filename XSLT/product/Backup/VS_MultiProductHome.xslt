<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ZoneList">
        <div class="index-2-slide relative">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <xsl:apply-templates select="Zone/Product"></xsl:apply-templates>
                </div>
            </div>
            <div class="arrow-button gray-arrow">
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>

    </xsl:template>
    <xsl:template match="Product">
        <div class="swiper-slide">
            <div class="box-img-index-2">
                <div class="img zoom-img hvr-img-overlay">

                    <img class="lazyload">
                    <xsl:attribute name="data-src">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    </img>
                </div>
                <div class="title absolute f-20 fw-5 text-main text-upp text-center tran point-none">
                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                </div>
                <div class="button absolute">
                    <a class="btn btn-2">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:text disable-output-escaping="yes">xem chi tiết</xsl:text>
                        <em class="material-icons">chevron_right</em>
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
