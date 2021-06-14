<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/SearchResults">
		<xsl:choose>
			<xsl:when test="count(Product)>0">
				<section class="search-product-wrapper section page-langding count-product-15">
					<div class="title-search-product">
						Có
						<xsl:value-of select="TotalProducts"></xsl:value-of>
						kết quả với từ khóa <strong>“<xsl:value-of select="Keyword"></xsl:value-of>”</strong>
					</div>
					<div class="searchsummary clearfix">
						<xsl:value-of select="SearchSumary" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="wrap-flex-product">
						<xsl:apply-templates select="Product"></xsl:apply-templates>
					</div>
					<div class="button d-flex justify-center mt-20">
						<div class="btn btn-defaul showItem">
							<span>Xem thêm</span>
							<em class="lnr lnr-plus-circle"></em>
						</div>
					</div>
				</section>
			</xsl:when>
			<xsl:otherwise>
				<div class="noresults">
					<xsl:value-of select="NoResults" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-product">
			<div class="product-item">
				<a class="pro-img">
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
				<div class="pro-infor">
					<div class="pro-title">
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
					<div class="pro-price d-flex">
						<span class="price">
							<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
						</span>
						<span class="price-old">
							<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
						</span>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>