<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/BannerList">
		<section id="banner-home">
			<div class="banner-hero">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="Banner"></xsl:apply-templates>
					</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="swiper-slide">
			<div class="swiper-inner desktop">
				<div class="img">
					<a href="">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="wrapper-content">
					<div class="container">
						<div class="content">
							<xsl:if test="Title != ''">
								<div class="banner-title">
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								</div>
							</xsl:if>
							<xsl:if test="Description != ''">
								<div class="banner-desc">
									<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
								</div>
							</xsl:if>
							<xsl:if test="Url != ''">
								<a class="btn btn-yellow">
									<xsl:attribute name="href">
										<xsl:value-of select="Url"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:value-of select="Title"></xsl:value-of>
									</xsl:attribute>
									<span>Mua ngay</span>
									<em class="lnr lnr-arrow-right"></em>
								</a>
							</xsl:if>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-inner mobile">
				<div class="img">
					<img >
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<div class="wrapper-content">
					<div class="container">
						<div class="content">
							<div class="banner-title">
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</div>
							<div class="banner-desc">
								<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
							</div>
							<a class="btn btn-yellow">
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<span>Mua ngay</span>
								<em class="lnr lnr-arrow-right"></em>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>