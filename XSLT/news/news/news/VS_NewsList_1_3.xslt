<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ZoneList">
        <div class="d-flex aic jcb">
            <h2 class="block-title mb-0">
                <xsl:value-of disable-output-escaping="yes" select="Zone[2]/Title"></xsl:value-of>
            </h2>
            <div class="button">
                <a class="btn btn-1">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Zone[2]/Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Zone[2]/Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:text disable-output-escaping="yes">Xem thêm</xsl:text>
                    <em class="material-icons">arrow_right_alt</em>
                    <span class="hvr"></span>
                </a>
            </div>
        </div>
        <div class="news-list-3-slide relative">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <xsl:apply-templates select="Zone[2]/News"></xsl:apply-templates>
                </div>
            </div>
            <div class="arrow-button black-arrow">
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News">
        <div class="swiper-slide">
            <div class="box-news">
                <div class="img zoom-img">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <img class="lazyload">
                        <xsl:attribute name="data-src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        </img>
                    </a>
                </div>
                <div class="date mt-15">
                    <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                    <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>

                </div>
                <div class="title text-3 fw-6 f-14">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
