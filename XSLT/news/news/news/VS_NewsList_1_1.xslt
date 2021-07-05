<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/NewsList">

        <h1 class="block-title">
            <xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
        </h1>
        <div class="row">
            <xsl:apply-templates select="News" mode="Big"></xsl:apply-templates>
            <div class="col-lg-6 small">
                <div class="row">
                    <xsl:apply-templates select="News" mode="Small"></xsl:apply-templates>
                </div>
            </div>
        </div>

    </xsl:template>
    <xsl:template match="News" mode="Big">
        <xsl:if test="position()=1">
            <div class="col-lg-6 big">
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
                    <div class="title text-3 fw-6 f-20">
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
                    <div class="ctn f-13 text-6">
                        <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                    </div>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode="Small">
        <xsl:if test="position() &gt;1 and position() &lt;6 ">

            <div class="col-lg-6 col-6">
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
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
