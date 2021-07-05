<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ZoneList">
        <section class="pages-support-1 section" id="sec-1">
            <div class="container">
                <h1 class="block-title text-center">
                    <xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/Title"></xsl:value-of>
                    <xsl:value-of select="Zone[1]/News/EditLink" disable-output-escaping="yes"></xsl:value-of>
                </h1>
                <div class="ctn text-3 f-16 text-center mx-auto">
                    <xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/BriefContent"></xsl:value-of>
                </div>
                <xsl:value-of disable-output-escaping="yes" select="Zone[1]/News/FullContent"></xsl:value-of>
            </div>
        </section>
        <section class="pages-support-2" id="sec-2">
            <xsl:attribute name="setbackground">
                <xsl:value-of disable-output-escaping="yes" select="Zone[2]/News/SubTitle"></xsl:value-of>

            </xsl:attribute>
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="box-content">
                            <xsl:value-of select="Zone[2]/News/EditLink" disable-output-escaping="yes"></xsl:value-of>
                            <xsl:value-of disable-output-escaping="yes" select="Zone[2]/News/FullContent">
                            </xsl:value-of>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="box-img">
                            <div class="img zoom-img">
                                <img class="lazyload">
                                <xsl:attribute name="data-src">
                                    <xsl:value-of select="Zone[2]/News/ImageUrl"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="Zone[2]/News/Title"></xsl:value-of>
                                </xsl:attribute>
                                </img>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="pages-support-3" id="sec-3">
            <div class="pages-index-3">
                <div class="big-wrapper d-flex">
                    <div class="box-img">
                        <div class="container">
                            <div class="img">
                                <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="Zone[3]/News/ImageUrl"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="Zone[3]/News/Title[1]"></xsl:value-of>
                                </xsl:attribute>
                                </img>
                            </div>
                            <div class="hidden">
                                <xsl:apply-templates select="Zone[3]/News/NewsImages" mode="Zone3">
                                </xsl:apply-templates>
                            </div>
                        </div>
                    </div>
                    <div class="box-content">
                        <div class="container">
                            <xsl:value-of select="Zone[3]/News/EditLink" disable-output-escaping="yes"></xsl:value-of>
                            <h2 class="block-title" data-aos="fade-up" data-aos-offset="-80" data-aos-anchor-placement="center-bottom">
                                <xsl:value-of disable-output-escaping="yes" select="Zone[3]/News/Title"></xsl:value-of>
                            </h2>
                            <xsl:value-of disable-output-escaping="yes" select="Zone[3]/News/FullContent">
                            </xsl:value-of>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="NewsImages" mode="Zone3">
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