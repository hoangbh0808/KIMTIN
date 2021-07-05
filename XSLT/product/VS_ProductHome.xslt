<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/ProductList">
        <xsl:apply-templates select="Product"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Product">
        <div class="row">
            <div class="col-lg-7">
                <div class="box-img zoom-img">
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
            <div class="col-lg-5">
                <div class="box-content">
                    <div class="ctn text-main f-14 fw-5 text-upp">
                        <xsl:text disable-output-escaping="yes">sản phẩm mới</xsl:text>
                    </div>
                    <div class="block-title">
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <div class="table">
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
                            <span class="hvr"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
