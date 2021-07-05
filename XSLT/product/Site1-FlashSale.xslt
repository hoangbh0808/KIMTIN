<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductList">
		<div class="section-title">
			<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
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
					<div class="wrap-process">
						<div class="process-bar">
							<div class="value-hidden-text"></div>
							<div class="process-bar-inner" style="width:10%">
								<xsl:attribute name="style">
									<xsl:text>width:</xsl:text>
									<xsl:value-of select="DealSoldPercent"/>
									<xsl:text>%</xsl:text>
								</xsl:attribute>
							</div>							
						</div>
						<div class="wrap-date-quantity">
							<p class="rest">Còn lại:
								<strong><xsl:value-of select="DealRemainingQty"/></strong>
							</p>
							<xsl:if test="DealEndDay!=''">
								<p class="date">
									<xsl:attribute name="data-countdown">
										<xsl:value-of select="DealEndYear"/>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="DealEndMonth"/>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="DealEndDay"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="DealEndHour"/>
										<xsl:text>:</xsl:text>
										<xsl:value-of select="DealEndMinute"/>
										<xsl:text>:</xsl:text>
										<xsl:value-of select="DealEndSecond"/>
									</xsl:attribute>
								</p>
							</xsl:if>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>