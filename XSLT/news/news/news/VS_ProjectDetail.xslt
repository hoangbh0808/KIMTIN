<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/NewsDetail">
		<section class="pages-project-detail section">
			<div class="container">
				<div class="project-header">
					<h1 class="title text-main f-24 fw-6">
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h1>
					<div class="share text-6 f-14 fw-6">
						<span>
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
				<div class="project-body">
					<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
					<div class="picture">
						<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
					</div>

				</div>
			</div>
		</section>
		<xsl:if test="count(NewsOther)">
			<section class="pages-other-project section">
				<div class="container">
					<h2 class="block-title text-center">
						<xsl:text disable-output-escaping="yes">Dự án khác</xsl:text>
					</h2>
					<div class="other-project-slide relative">
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
				<div class="content">
					<div class="title text-main f-20 fw-5">
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
					<div class="button">
						<a class="btn btn-1">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:text disable-output-escaping="yes">Xem chi tiết</xsl:text>
							<em class="material-icons">arrow_right_alt
								<span></span>
							</em>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsImages">

		<img class="lazyload w-100">
		<xsl:attribute name="data-src">
			<xsl:value-of select="ImageUrl"></xsl:value-of>
		</xsl:attribute>
		<xsl:attribute name="alt">
			<xsl:value-of select="Title"></xsl:value-of>
		</xsl:attribute>
		</img>
	</xsl:template>

</xsl:stylesheet>
