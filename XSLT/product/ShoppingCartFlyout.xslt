<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="shopping-card-toggle d-flex align-center">
			<div class="cart">
				<div class="wrap-cart-icon">
					<div class="icon">
						<em class="ri-shopping-cart-2-line"></em>
					</div>
					<span class="quilt count cart-flyout-quantity">
						<xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
					</span>
				</div>
				<div class="shopping-cart-wrapper">
					<div class="head">
						<div class="cart-number">
							<p>
						Tổng cộng:
								<span>
									<xsl:value-of select="/ShoppingCart/Total" />
								</span>
							</p>
						</div>
					</div>
					<div class="body">
						<div class="scroll-wrapper cartpanel">
							<xsl:apply-templates select="/ShoppingCart/CartItem" />
						</div>
					</div>
					<div class="btn-center">
						<a class="btn btn-primary">
							<xsl:attribute name="href">
								<xsl:value-of select="/ShoppingCart/CartPageUrl" />
							</xsl:attribute>
							<span>Thanh toán </span>
							<em class="lnr lnr-arrow-right" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="CartItem">
		<div class="cart-item">
			<div class="image">
				<a href="">
					<xsl:attribute name="href">
						<xsl:value-of select="Url" />
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target" />
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" />
					</xsl:attribute>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ThumbnailUrl" />
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title" />
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div class="caption">
				<div class="title">
					<a href="">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" />
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target" />
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title" />
						</xsl:attribute>
						<xsl:value-of select="Title" />
					</a>
					<div class="price">
						<xsl:value-of select="Price" />
					</div>
				</div>
				<div class="quantity">
					Số lượng:
					<span class="number">
						<xsl:value-of select="Quantity" />
					</span>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>