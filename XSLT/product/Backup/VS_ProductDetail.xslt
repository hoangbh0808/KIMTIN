<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/ProductDetail">
        <section class="pages-collection-detail-1 section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="box-img">
                            <div class="img zoom-img">

                                <img class="lazyload">
                                <xsl:attribute name="data-src">
                                    <xsl:value-of select="ProductImages/ImageUrl"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="ProductImages/Title"></xsl:value-of>
                                </xsl:attribute>
                                </img>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="box-content">
                            <h1 class="block-title">
                                <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                            </h1>
                            <div class="content">
                                <xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
                            </div>
                            <div class="button d-flex aic">
                                <a class="btn btn-1">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="BarCode"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:attribute name="download">
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="Title"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:text disable-output-escaping="yes">Download catalogue</xsl:text>
                                    <em class="material-icons">vertical_align_bottom</em>
                                    <span class="hvr"></span>
                                </a>
                                <a class="btn btn-1">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="SubTitle"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="Title"></xsl:value-of>
                                    </xsl:attribute>
                                    <xsl:text disable-output-escaping="yes">Shop Online</xsl:text>
                                    <span class="hvr"></span>
                                </a>
                            </div>
                            <div class="share d-flex aic zoom-img"><span>
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
                                <a class="pinterest-icon">
                                    <xsl:attribute name="href">
                                        <xsl:text disable-output-escaping="yes">
                                            https://www.pinterest.com/pin/create/button/?url=</xsl:text>
                                        <xsl:value-of disable-output-escaping="yes" select="FullUrl">
                                        </xsl:value-of>
                                    </xsl:attribute>
                                    <i class="fab fa-pinterest"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="pages-collection-detail-2 section">
            <div class="container">
                <div class="top-title text-3 f-20 fw-7 text-upp">
                    <xsl:text disable-output-escaping="yes">Sản phẩm bộ sưu tập 1</xsl:text>
                </div>
                <div class="collection-detail-2-slide relative">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <xsl:apply-templates select="NewsRelated"></xsl:apply-templates>
                        </div>
                    </div>
                    <div class="arrow-button black-arrow">
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="pages-collection-detail-3 section">
            <div class="container">
                <h2 class="block-title text-center">
                    <xsl:text disable-output-escaping="yes">Bộ sưu tập khác</xsl:text>
                </h2>
                <div class="collection-detail-3-slide relative">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <xsl:apply-templates select="ProductOther"></xsl:apply-templates>
                        </div>
                    </div>
                    <div class="arrow-button black-arrow">
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="ProductOther">
        <div class="swiper-slide">
            <div class="box-img-index-2">
                <div class="img zoom-img hvr-img-overlay">
                    <img class="lazyload">
                    <xsl:attribute name="data-src">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    </img>
                </div>
                <div class="title absolute f-20 fw-5 text-main text-upp text-center tran point-none">
                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                </div>
                <div class="button absolute">
                    <a class="btn btn-2">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:text disable-output-escaping="yes">xem chi tiết</xsl:text>
                        <em class="material-icons">chevron_right</em>
                    </a>
                </div>
                <div class="button absolute">
                    <a class="btn btn-2">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:text disable-output-escaping="yes">Shop Online</xsl:text>
                        <em class="material-icons">chevron_right</em>
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="NewsRelated">
        <div class="swiper-slide">
            <div class="box-img hvr-img-overlay-last">
                <div class="img">
                    <a class="">
                        <xsl:attribute name="href">
                            <xsl:value-of select="ImageUrl[1]"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="data-fancybox">
                            <xsl:text disable-output-escaping="yes">gallery-</xsl:text>
                            <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                        </xsl:attribute>
                        <img class="lazyload">
                        <xsl:attribute name="data-src">
                            <xsl:value-of select="ImageUrl[1]"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title[1]"></xsl:value-of>
                        </xsl:attribute>
                        </img>
                        <img class="lazyload">
                        <xsl:attribute name="data-src">
                            <xsl:value-of select="ThumbnailUrl[1]"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="NewsImages/Title"></xsl:value-of>
                        </xsl:attribute>
                        </img>
                    </a>
                </div>
                <div class="title text-white f-20 fw-7 text-center absolute point-none">
                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                </div>
            </div>
            <div class="hidden">
                <xsl:apply-templates select="NewsImages"></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="NewsImages">
        <xsl:if test="position() &gt;1">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="data-fancybox">
                    <xsl:text disable-output-escaping="yes">gallery-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
                </xsl:attribute>
                <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                </img>
            </a>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
