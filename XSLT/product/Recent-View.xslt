<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductList">
		<section class="section home-product bg-grey">
			<div class="container">
				<div class="section-title">
					<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
				</div>
				<div class="wrapper-slide">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="swiper-inner">
									<div class="img">
										<a>
											<xsl:attribute name="href">
												<xsl:value-of select="Url"></xsl:value-of>
											</xsl:attribute>
											<xsl:attribute name="title">
												<xsl:value-of select="Title"></xsl:value-of>
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
									</div>
									<div class="caption">
										<div class="title">
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
										<div class="wraper-price d-flex aligin-center">
											<span class="price">
												<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
											</span>
											<span class="oldprice">
												<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
											</span>
										</div>
									</div>
									<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
										<div class="option yellow">
											<div class="desc">M???i</div>
										</div>
									</xsl:if>
									<xsl:if test="DiscountPercentage!=''">
										<div class="option red">
											<div class="desc">
												<xsl:text disable-output-escaping="yes">-</xsl:text>
												<xsl:value-of select="DiscountPercentage"></xsl:value-of>
												<xsl:text disable-output-escaping="yes">%</xsl:text>
											</div>
										</div>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<div class="wrap-button">
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
</xsl:stylesheet>