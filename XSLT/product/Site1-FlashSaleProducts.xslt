<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductList">
		<h2 class="section-title line">
			<xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
		</h2>
		<div class="wrap-product-slide">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select="Product"></xsl:apply-templates>
				</div>
			</div>
			<div class="wrap-button-slide">
				<div class="btn-prev">
					<em class="lnr lnr-chevron-left"></em>
				</div>
				<div class="btn-next">
					<em class="lnr lnr-chevron-right"></em>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="swiper-slide">
			<div class="item-product">
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
					<xsl:if test="ShowOption > 0">
						<div class="wrap-tag">
							<div class="tag-new">
								<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
									<span>NEW</span>
								</xsl:if>
								<xsl:if test="floor(ShowOption div 2) mod 2 = 1">
									<span>Hot</span>
								</xsl:if>
							</div>
							<xsl:if test="GiftDescription2!=''">
								<div class="tag-gift">
									<xsl:value-of disable-output-escaping="yes" select="GiftDescription2">
									</xsl:value-of>
								</div>
							</xsl:if>
						</div>
					</xsl:if>
					<xsl:if test="DiscountPercentage!=''">
						<div class="tag-sale">
							<xsl:text disable-output-escaping="yes">Giảm </xsl:text>
							<xsl:value-of select="DiscountPercentage"></xsl:value-of>
							<xsl:text>%</xsl:text>
						</div>
					</xsl:if>
				</div>
				<div class="wrap-text">
					<a class="p-title-small">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</a>
					<div class="wrap-price-sale">
						<div class="p-price-small">
							<del>
								<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
							</del>
							<xsl:if test="OldPrice != ''">
								<ins>
									<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
								</ins>
							</xsl:if>
						</div>
					</div>
					<div class="wrap-process">
						<div class="process-bar">
							<div class="value-hidden-text"></div>
							<!--<div class="process-bar-inner" style="width:10%"></div>-->
							<div class="process-bar-inner" style="width:10%">
								<xsl:attribute name="style">
									<xsl:text>width:</xsl:text>
									<xsl:value-of select="DealSoldPercent"/>
									<xsl:text>%</xsl:text>
								</xsl:attribute>
							</div>							
						</div>
						<!--<div class="wrap-date-quantity">
							<p class="rest">Còn lại: 50</p>
							<p class="date">1 ngày 12 : 30 : 55</p>
						</div>-->

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
									<!--<xsl:value-of select="DealEndDay"/> ngày <xsl:value-of select="DealEndHour"/> : <xsl:value-of select="DealEndMinute"/> : <xsl:value-of select="DealEndSecond"/>-->
								</p>
							</xsl:if>
						</div>
					</div>
				</div>
				<div class="buy-now-list">
					<xsl:choose>
						<xsl:when test="StockQuantity > 0">
							<div class="input-amount">
								<a class="btn-dec" href="javascript:;">
									<em class="ri-subtract-line"></em>
								</a>
								<input class="amount" type="text" value="1" name="">
									<xsl:attribute name="name">
										<xsl:text>addtocart_</xsl:text>
										<xsl:value-of select="ProductId" disable-output-escaping="yes" />
										<xsl:text>.EnteredQuantityCatalog</xsl:text>
									</xsl:attribute>
								</input>
								<a class="btn-inc" href="javascript:;">
									<em class="ri-add-line"></em>
								</a>
							</div>
							<a class="buy-now" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
								<xsl:attribute name="data-productid">
									<xsl:value-of select="ProductId"></xsl:value-of>
								</xsl:attribute>
								<img src="/Data/Site/1/media/img/icon/cart-white.png" alt="" />
								<span>Mua ngay</span>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<a class="buy-now" href='javascript:;'>
								<span>Hết hàng</span>
							</a>
						</xsl:otherwise>
					</xsl:choose>
					<a class="xem-chi-tiet">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						Xem chi tiết
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>