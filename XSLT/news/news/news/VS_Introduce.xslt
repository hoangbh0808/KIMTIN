<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ZoneList">
        <section class="pages-introduce-1 section" id="sec-1">
            <div class="container">
                <h1 class="block-title text-center">
                    <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[1]/News/Title">
                    </xsl:value-of>
                    <xsl:value-of select="Zone[IsActive='true']/Zone[1]/News/EditLink" disable-output-escaping="yes">
                    </xsl:value-of>
                </h1>
                <div class="ctn text-3 f-14 text-center mx-auto">
                    <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[1]/News/BriefContent">
                    </xsl:value-of>
                </div>
                <div class="row">
                    <div class="col-lg-7">
                        <div class="box-img">
                            <div class="img zoom-img">
                                <img class="">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="Zone[IsActive='true']/Zone[1]/News[1]/ImageUrl">
                                    </xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="Zone[IsActive='true']/Zone[1]/News[1]/Title"></xsl:value-of>
                                </xsl:attribute>
                                </img>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="box-content">
                            <xsl:value-of disable-output-escaping="yes" select="Zone[IsActive='true']/Zone[1]/News[1]/FullContent"></xsl:value-of>
                        </div>
                    </div>
                </div>
                <div class="step-img">
                    <xsl:value-of select="Zone[IsActive='true']/Zone[1]/News[2]/EditLink" disable-output-escaping="yes">
                    </xsl:value-of>
                    <img class="">
                    <xsl:attribute name="src">
                        <xsl:value-of select="Zone[IsActive='true']/Zone[1]/News[2]/ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Zone[IsActive='true']/Zone[1]/News[2]/Title"></xsl:value-of>
                    </xsl:attribute>
                    </img>

                </div>
                <div class="step-content">
                    <ul class="ls-none p-0 d-flex jcb">
                        <xsl:apply-templates select="Zone[IsActive='true']/Zone[1]/News" mode="Step_1">
                        </xsl:apply-templates>
                    </ul>
                    <ul class="ls-none p-0 d-flex aic jcb">
                        <xsl:apply-templates select="Zone[IsActive='true']/Zone[1]/News" mode="Step_2">
                        </xsl:apply-templates>
                    </ul>
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
</xsl:stylesheet>