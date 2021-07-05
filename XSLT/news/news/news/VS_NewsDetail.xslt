<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/NewsDetail">
        <section class="pages-news-detail section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <div class="article-section">
                            <div class="article-header">
                                <div class="title f-24 text-main fw-6">
                                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                                    <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                                </div>
                                <div class="wrapper d-flex aic">
                                    <div class="item d-flex aic"> <span>
											<xsl:text disable-output-escaping="yes">Ngày đăng: </xsl:text>
										</span>
                                        <div class="date">
                                            <xsl:value-of disable-output-escaping="yes" select="CreatedDate">
                                            </xsl:value-of>
                                        </div>
                                    </div>
                                    <div class="item d-flex aic zoom-img"><span>
											<xsl:text disable-output-escaping="yes">Chia sẻ</xsl:text>
										</span>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:text disable-output-escaping="yes">
                                                    https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
                                                <xsl:value-of disable-output-escaping="yes" select="FullUrl">
                                                </xsl:value-of>
                                            </xsl:attribute>
                                            <img class="lazyload" data-src="/Data/Sites/2/skins/timbee/img/news/fb.png" />
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="article-body">
                                <div class="full-content">
                                    <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="stun-news">
                            <div class="top-title text-white f-16 fw-7 text-upp">
                                <xsl:text disable-output-escaping="yes">Tin tức nổi bật</xsl:text><em class="material-icons">keyboard_arrow_down</em>
                            </div>
                            <ul class="ls-none p-0">
                                <xsl:apply-templates select="NewsRelated"></xsl:apply-templates>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <xsl:if test="count(NewsOther)">
            <section class="pages-other-news section">
                <div class="container">
                    <h2 class="block-title text-center">
                        <xsl:text disable-output-escaping="yes">Tin tức khác</xsl:text>
                    </h2>
                    <div class="other-news-slide relative">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <xsl:apply-templates select="NewsOther"></xsl:apply-templates>
                            </div>
                        </div>
                        <div class="arrow-button gray-arrow">
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </div>
                    </div>
                </div>
            </section>
        </xsl:if>
    </xsl:template>
    <xsl:template match="NewsOther">
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
                    <p>
                        <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                    </p>
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
                    <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="NewsRelated">
        <li>
            <div class="box-news d-flex aic">
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
                <div class="wrapper">
                    <div class="date">
                        <xsl:value-of disable-output-escaping="yes" select="CreatedDate">
                        </xsl:value-of>
                    </div>
                    <div class="title text-3 f-13 fw-6 hvr-tmain">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="Url"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:value-of disable-output-escaping="yes" select="Title">
                            </xsl:value-of>
                        </a>
                    </div>
                </div>
            </div>
        </li>
    </xsl:template>
</xsl:stylesheet>