<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="payment-info clearfix">
			<xsl:if test="count(/CheckoutMethod/Shipping)>0">
				<div class="payment-form">
					<div class="carttitle">Phương thức vận chuyển</div>
					<div class="cart-form clearfix">
						<xsl:apply-templates select="/CheckoutMethod/Shipping"></xsl:apply-templates>
					</div>
				</div>
			</xsl:if>
			<xsl:if test="count(/CheckoutMethod/Payment)>0">
				<div class="payment-form">
					<div class="carttitle">Phương thức thanh toán</div>
					<div class="cart-form clearfix">
						<xsl:apply-templates select="/CheckoutMethod/Payment"></xsl:apply-templates>
					</div>
				</div>
			</xsl:if>
		</div>
		<div class="receive-address-btn">
			<div class="btn-right cart-button clearfix btn-wrap wrap-button-next-cart">
				<a class="btn btn-shopping">
					<xsl:attribute name="href">
						<xsl:value-of select="/CheckoutMethod/CartUrl"/>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:text>Quay lại</xsl:text>
				</a>
				<a class="btn btn-checkout">
					<xsl:attribute name="href">
						<xsl:text disable-output-escaping="yes">#</xsl:text>
						<!-- <xsl:value-of select="/CheckoutMethod/NextPageUrl"></xsl:value-of> -->
					</xsl:attribute>
					<xsl:attribute name="onclick">
						<xsl:text>AjaxCheckout.saveorder(true, '</xsl:text>
						<xsl:value-of select="/CheckoutMethod/NextPageUrl"></xsl:value-of>
						<xsl:text>');return false;</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:text>Thanh toán</xsl:text>
				</a>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Shipping">
		<div class="form-group select-group qradio">
			<input type="radio" name="ShippingMethod" onchange="AjaxCheckout.loadShippingServiceList(this);return false;">
				<xsl:if test="position()=1">
					<xsl:attribute name="checked">
						<xsl:text>checked</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="provider">
					<xsl:value-of select="ShippingProvider"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>shipping_method_</xsl:text>
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
			</input>
			<label>
				<xsl:attribute name="for">
					<xsl:text>shipping_method_</xsl:text>
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title"></xsl:value-of>
				<div class="wrap">
					<xsl:if test="Description!=''">
						<div class="des">
							<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</xsl:if>
					<xsl:if test="ShippingProvider = 15 or ShippingProvider = 16">
						<div class="services">
							<select name="ShippingService" onchange="AjaxCheckout.ordercalculator()">
								<xsl:apply-templates select="Service"/>
							</select>
						</div>
					</xsl:if>
				</div>
			</label>
		</div>
	</xsl:template>
	<xsl:template match="Service">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="Value"/>
			</xsl:attribute>
			<xsl:value-of select="Name"/>
		</option>
	</xsl:template>
	<xsl:template match="Payment">
		<div class="payment-method">
			<div class="select-group qradio">
				<input type="radio" name="PaymentMethod">
					<xsl:attribute name="id">
						<xsl:value-of select="Id"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="Id"></xsl:value-of>
					</xsl:attribute>
					<xsl:if test="position()=1">
						<xsl:attribute name="checked">
							<xsl:text>checked</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="Id"></xsl:value-of>
						</xsl:attribute>
					</xsl:if>
				</input>
				<label>
					<xsl:attribute name="for">
						<xsl:value-of select="Id"></xsl:value-of>
					</xsl:attribute>
					<div class="method-info">
						<xsl:if test="Description!=''">
							<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
						</xsl:if>
					</div>
				</label>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>