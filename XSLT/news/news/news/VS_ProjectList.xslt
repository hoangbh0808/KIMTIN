<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/NewsList">
        <h2 class="text-center block-title">Dự án</h2>
        <ul class="ls-none p-0 project-list">
            <xsl:apply-templates select="News"></xsl:apply-templates>
        </ul>

    </xsl:template>
    <xsl:template match="News">
        <li class="project-item">
            <div class="sec-1 d-flex">
                <div class="box-content">
                    <div class="content-wrapper">
                        <div class="title f-20 text-main fw-5">
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="Url"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="title">
                                    <xsl:value-of select="Title"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                            </a>
                            <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                        <div class="ctn text-3 f-14">
                            <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                        </div>
                        <div class="button">
                            <a class="btn btn-1">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="Url"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="title">
                                    <xsl:value-of select="Title"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:text disable-output-escaping="yes">xem chi tiết</xsl:text>
                                <em class="material-icons">arrow_right_alt</em>
                                <span></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="box-img">
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
                </div>
            </div>
            <div class="sec-2">
                <ul class="ls-none p-0 d-flex aic jcb">
                    <xsl:apply-templates select="NewsAttributes"></xsl:apply-templates>
                </ul>
            </div>
        </li>
    </xsl:template>
    <xsl:template match="NewsAttributes">
        <li class="d-flex aic">
            <xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
        </li>
    </xsl:template>
</xsl:stylesheet>
