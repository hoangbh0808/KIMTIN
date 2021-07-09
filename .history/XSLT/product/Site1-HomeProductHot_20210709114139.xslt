<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductList">
		<div class="section-title" data-aos="zoom-in-up" data-aos-easing="ease-in-out">
			<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
		</div>
		<div class="row">
			<xsl:apply-templates select="Product"></xsl:apply-templates>
			<!-- <div class="button d-flex justify-center">
				<a class="btn btn-defaul" href="javascript:;">
					<span>xem thêm </span>
					<em class="lnr lnr-plus-circle"></em>
				</a>
			</div> -->
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-6 col-sm-6 col-md-4 col-lg-3" data-aos="zoom-in" data-aos-delay="300">
			<div class="item-pro">
				<div class="img">
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
					<div class="price-wrap">
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
						<div class="desc">Mới</div>
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
	</xsl:template>
</xsl:stylesheet>