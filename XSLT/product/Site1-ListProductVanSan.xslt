<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductList">
		<div class="hero-product ajaxresponse">
			<div class="block_name_category d-flex">
				<div class="name_category">
					<h2>
						<xsl:value-of disable-output-escaping="yes" select="ZoneTitle"></xsl:value-of>
					</h2>
				</div>
				<div class="wrap-left d-flex">
					<div class="sort-wrap d-flex">
						<p>Sắp xếp: </p>
						<select class='ajaxsort'>
							<xsl:apply-templates select="/ProductList/SortBy"></xsl:apply-templates>
						</select>
					</div>
					<div class="option-wrap d-flex">
						<p>Hiển thị:</p>
						<select class="ajaxsort" id="view">
							<xsl:apply-templates select="/ProductList/PageSize" />
						</select>
					</div>
				</div>
			</div>
			<div class="block-product ajaxresponsewrap">
				<xsl:apply-templates select="Product"></xsl:apply-templates>
			</div>
		</div>
		<div class="wrap-fixed-menu">
			<div class="button-flex button-dmsp">Danh mục sản phẩm</div>
			<div class="button-flex button-blsp">Bộ lọc sản phẩm</div>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="product-item">
			<div class="pro-img">
				<a >
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
					<img class="hover lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of disable-output-escaping="yes" select="ThumbnailUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
					<xsl:apply-templates select="ProductImages"></xsl:apply-templates>
				</a>
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
					<xsl:if test="OldPrice != ''">
						<span class="price-old">
							<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
						</span>
					</xsl:if>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="SortBy">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="PageSize">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
</xsl:stylesheet>