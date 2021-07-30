<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
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
									<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/ShareTxt">
									</xsl:value-of>
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
					<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/OtherCollectionTxt">
					</xsl:value-of>
				</div>
				<div class="collection-detail-2-slide relative">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="NewsRelated" mode="Before"></xsl:apply-templates>
						</div>
					</div>
					<div class="arrow-button black-arrow">
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div>
				</div>
				<div class="collection-detail-2-responsive">
					<div class="row">
						<xsl:apply-templates select="NewsRelated" mode="After"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</section>
		<section class="pages-collection-detail-3 section">
			<div class="container">
				<h2 class="block-title text-center">
					<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/OtherCollectionTxt">
					</xsl:value-of>
				</h2>
				<div class="collection-detail-3-slide relative">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="ProductOther" mode="clt_detail_3_before"></xsl:apply-templates>
						</div>
					</div>
					<div class="arrow-button black-arrow">
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div>
				</div>
				<div class="collection-detail-3-responsive">
					<div class="row">
						<xsl:apply-templates select="ProductOther" mode="clt_detail_3_after"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="ProductOther" mode="clt_detail_3_before">
		<div class="swiper-slide">
			<xsl:apply-templates select="." mode="boxImgCollectDetail3"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="ProductOther" mode="clt_detail_3_after">
		<div class="col-sm-6 col-6">
			<xsl:apply-templates select="." mode="boxImgCollectDetail3"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="NewsRelated" mode="Before">
		<div class="swiper-slide">
			<xsl:apply-templates select="." mode="BoxImg"></xsl:apply-templates>
			<div class="download-img">
				<a class="fcc">
					<xsl:attribute name="href">
						<xsl:value-of select="ThumbnailUrl[1]"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="download">
					</xsl:attribute>
					<span>
						<xsl:text disable-output-escaping="yes">Download</xsl:text>
					</span>
					<em class="material-icons">vertical_align_bottom</em>
				</a>
			</div>
			<div class="hidden">
				<xsl:apply-templates select="NewsImages" mode="HiddenBefore"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="NewsRelated" mode="After">
		<div class="col-sm-6">
			<div class="item">
				<xsl:apply-templates select="." mode="BoxImg"></xsl:apply-templates>
			</div>
			<div class="download-img">
				<a class="fcc">
					<xsl:attribute name="href">
						<xsl:value-of select="ThumbnailUrl[1]"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="download">
					</xsl:attribute>
					<span>
						<xsl:text disable-output-escaping="yes">Download</xsl:text>
					</span>
					<em class="material-icons">vertical_align_bottom</em>
				</a>
			</div>
			<div class="hidden">
				<xsl:apply-templates select="NewsImages" mode="HiddenAfter"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="NewsRelated" mode="BoxImg">
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
	</xsl:template>

	<xsl:template match="NewsImages" mode="HiddenBefore">
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
	<xsl:template match="NewsImages" mode="HiddenAfter">
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
	<xsl:template match="ProductOther" mode="boxImgCollectDetail3">
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
					<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/ViewDetailTxt"></xsl:value-of>
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
	</xsl:template>

</xsl:stylesheet>