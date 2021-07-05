<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ZoneList">
        <section class="pages-introduce-3 section" id="sec-3">
            <div class="container">
                <h2 class="block-title text-center">
                    <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[3]/News/Title">
                    </xsl:value-of>
                    <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[3]/News/EditLink">
                    </xsl:value-of>
                </h2>
                <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[3]/News/FullContent">
                </xsl:value-of>
            </div>
        </section>
        <section class="pages-introduce-4 bg-color-2" id="sec-4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="box-img">
                            <div class="img zoom-img">
                                <img class="">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="Zone[IsActive='true']/Zone[4]/News/ImageUrl"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="Zone[IsActive='true']/Zone[4]/News/Title"></xsl:value-of>
                                </xsl:attribute>
                                </img>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="box-content">
                            <h2 class="block-title">
                                <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[4]/News/Title"></xsl:value-of>
                                <xsl:value-of select="Zone[IsActive='true']/Zone[4]/News/EditLink" disable-output-escaping="yes"></xsl:value-of>
                            </h2>
                            <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[4]/News/FullContent"></xsl:value-of>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="pages-introduce-5 section" id="sec-5">
            <div class="container">
                <h2 class="block-title text-center">
                    <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[5]/News/Title">
                    </xsl:value-of>
                    <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[5]/News/EditLink">
                    </xsl:value-of>
                </h2>
                <!-- <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[5]/News/FullContent">
                </xsl:value-of> -->
                <div class="introduce-5-slide relative">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <xsl:apply-templates select="Zone[IsActive='true']/Zone[5]/News" mode="Prize">
                            </xsl:apply-templates>
                        </div>
                    </div>
                    <div class="arrow-button gray-arrow">
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="News" mode="Step_1">
        <xsl:if test="position() &gt;2  and position() &lt;8">
            <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
            <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
        </xsl:if>

    </xsl:template>
    <xsl:template match="News" mode="Step_2">
        <xsl:if test="position() &gt;7  and position() &lt;13">
            <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
            <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="Prize">
        <div class="swiper-slide">
            <div class="box-prize">
                <div class="text-center text-3">
                    <div class="icon">
                        <img class="lazyload">
                        <xsl:attribute name="data-src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        </img>
                    </div>
                    <div class="ctn f-14">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
