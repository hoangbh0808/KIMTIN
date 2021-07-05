<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ZoneList">
        <div class="d-flex">
            <div class="box-content">
                <h1 class="block-title">
                    <xsl:value-of disable-output-escaping="yes" select="Zone/News/Title">
                    </xsl:value-of>
                    <xsl:value-of select="Zone/News/EditLink" disable-output-escaping="yes">
                    </xsl:value-of>
                </h1>
                <div class="ctn text-6 f-16">
                    <xsl:value-of disable-output-escaping="yes" select="Zone/News/FullContent">
                    </xsl:value-of>
                </div>
            </div>
            <div class="box-img lazyload">
                <div class="img zoom-img">
                    <img class="lazyload">
                    <xsl:attribute name="data-src">
                        <xsl:value-of select="Zone/News/ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Zone/News/Title"></xsl:value-of>
                    </xsl:attribute>
                    </img>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
