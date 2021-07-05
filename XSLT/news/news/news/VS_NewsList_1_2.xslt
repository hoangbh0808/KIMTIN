<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ZoneList">
        <div class="d-flex aic jcb">
            <h2 class="block-title mb-0">
                <xsl:value-of disable-output-escaping="yes" select="Zone[1]/Title"></xsl:value-of>
            </h2>
            <div class="button">
                <a class="btn btn-1">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Zone[1]/Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Zone[1]/Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:text disable-output-escaping="yes">Xem thêm</xsl:text>
                    <em class="material-icons">arrow_right_alt</em>
                    <span class="hvr"></span>
                </a>

            </div>
        </div>
        <div class="row">
            <xsl:apply-templates select="Zone[1]/News" mode="Big"></xsl:apply-templates>
            <div class="col-lg-6">
                <ul class="ls-none p-0">
                    <xsl:apply-templates select="Zone[1]/News" mode="Small"></xsl:apply-templates>
                </ul>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News" mode="Big">
        <xsl:if test="position()=1">

            <div class="col-lg-6">
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
        <xsl:if test="position() &gt;1 and position() &lt;8">
            <li>
                <div class="date mt-15">
                    <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                    <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>

                </div>
                <div class="title text-3 fw-6 f-16">
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
            </li>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>