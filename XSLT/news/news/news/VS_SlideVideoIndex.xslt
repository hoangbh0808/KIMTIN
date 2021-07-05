<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/NewsList">
        <div class="index-4-slide relative">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <xsl:apply-templates select="News"></xsl:apply-templates>
                </div>
            </div>
            <div class="container w-100">
                <div class="arrow-button">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News">
        <div class="swiper-slide relative img-overlay" data-swiper-parallax="-30%">
            <div class="img">
                <img class="lazyload">
                <xsl:attribute name="data-src">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                </img>
                <video class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
					</xsl:attribute>
				</video>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
