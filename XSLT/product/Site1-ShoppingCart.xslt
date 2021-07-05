<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="checkout-section cart-display">
			<div class="container">
				<div class="checkout-wrapper">
					<xsl:choose>
						<xsl:when test="count(/ShoppingCart/CartItem)=0">
							<div class="empty-cart-text">
								<div class="row checkout-title">
									<div class="col">
										<h3>
											<span class="fas fa-shopping-cart"></span>
											<span>
												<xsl:value-of select="/ShoppingCart/CartEmptyText"></xsl:value-of>
											</span>
										</h3>
									</div>
								</div>
								<div class="cart-button-checkout">
									<div class="col">
										<a class="btn btn-view-all green" href="/">
											<span class="mdi mdi-chevron-left"></span>
											<span>
												<xsl:value-of disable-output-escaping="yes"
													select="/ShoppingCart/BackText">
												</xsl:value-of>
											</span>
										</a>
									</div>
								</div>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="checkout-title">
								GIỎ HÀNG CỦA BẠN(
								<span class="number-quantity">
									<xsl:value-of select="/ShoppingCart/TotalProducts" disable-output-escaping="yes">
									</xsl:value-of>
								</span>
								Sản phẩm )
							</div>
							<div class="content-wrapper">
								<div class="cart-table-wrapper">
									<table class="carttable" cellspacing="0" cellpadding="0">
										<thead>
											<tr>
												<th>Sản phẩm</th>
												<th>Giá</th>
												<th>Số lượng</th>
												<th>Tổng</th>
											</tr>
										</thead>
										<tbody>
											<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
										</tbody>
									</table>
								</div>
							</div>
							<!-- <xsl:if test="/ShoppingCart/GiftDescription!=''">
								<div class="product-detail-promo leading-snug">
									<strong class="block text-blue mb-1">Quà tặng</strong>
									<div class="fz-14 text-dark-grey mb-1">
										<xsl:value-of select="/ShoppingCart/GiftDescription" disable-output-escaping="yes"> </xsl:value-of>
									</div>
								</div>
							</xsl:if> -->
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="count(/ShoppingCart/CartItem)>0">
						<div class="wrap-discount-button">
							<div class="wrap-total-cart">
								<div class="temp-total-price">
									<div class="price-wrapper">
										<table>
											<tr>
												<td>Tạm tính</td>
												<td>
													<xsl:value-of select="/ShoppingCart/SubTotal"/>
												</td>
											</tr>
											<tr>
												<td>Giảm giá</td>
												<td>
													<xsl:value-of select="/ShoppingCart/DiscountTotal"/>
												</td>
											</tr>
											<tr>
												<td>Tổng cộng</td>
												<td>
													<div class="total-money">
														<xsl:value-of select="/ShoppingCart/Total"/>
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="wrap-button-next-cart">
									<a class="btn btn-shopping">
										<xsl:attribute name="href">
											<xsl:value-of select="/ShoppingCart/ContinueShoppingUrl"></xsl:value-of>
										</xsl:attribute>
										<xsl:text disable-output-escaping="yes">Tiếp tục mua hàng</xsl:text>
									</a>
									<a class="btn btn-checkout">
										<xsl:attribute name="href">
											<xsl:value-of select="/ShoppingCart/CheckoutUrl"/>
										</xsl:attribute>
										<span>
											<xsl:text disable-output-escaping="yes">Tiến hành thanh toán</xsl:text>
										</span>
									</a>
								</div>
								<div class="vat-text">
									<xsl:value-of disable-output-escaping="yes" select="/ShoppingCart/VatText">
								</xsl:value-of>
								</div>
							</div>
						</div>
					</xsl:if>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="CartItem">
		<tr>
			<td>
				<div class="product-item">
					<div class="image">
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
								<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
							</a>
						</div>
						<a class="remove-item" onclick="AjaxCart.removefromcart(this);return false;">
							<xsl:attribute name="data-itemguid">
								<xsl:value-of select="ItemGuid"></xsl:value-of>
							</xsl:attribute>
							<em class="lnr lnr-cross-circle"></em>
							<span>
								Bỏ sản phẩm
							</span>
						</a>
					</div>
				</div>
				<!-- <xsl:if test="GiftDescription!=''">
					<div class="product-detail-promo leading-snug">
						<strong class="block text-blue mb-1">Quà tặng</strong>
						<div class="fz-14 text-dark-grey mb-1">
							<xsl:value-of select="GiftDescription" disable-output-escaping="yes"/>
						</div>
					</div>
				</xsl:if> -->
			</td>
			<td>
				<div class="mobile-title">Giá</div>
				<div class="discount-wrap">
					<span class="now-price">
						<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
					</span>
					<xsl:if test="OldPrice!=''">
						<span class="old-price">
							<xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of>
						</span>
					</xsl:if>
				</div>
			</td>
			<td>
				<div class="mobile-title">Số lượng</div>
				<div class="quantity-wrap">
					<div class="input-amount">
						<a class="btn-dec" href="javascript:;">
							<em
								class="ri-subtract-line"></em>
						</a>
						<input class="amount" type="text" maxlength="3" onchange="AjaxCart.updatecart(this);return false;">
							<xsl:attribute name="name">
								<xsl:text>itemquantity</xsl:text>
								<xsl:value-of select="ItemGuid"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="Quantity"></xsl:value-of>
							</xsl:attribute>
						</input>
						<a class="btn-inc" href="javascript:;">
							<em class="ri-add-line"></em>
						</a>
					</div>
					<!-- <div class="item-quantity">
						<div class="input-group">
							<div class="input-group-btn">
								<div class="qty-minus btn-number">
									<em class="mdi mdi-minus"></em>
								</div>
							</div>
							<input type="text" maxlength="10" class="product-details-quantity form-control input-number"
								onchange="AjaxCart.updatecart();return false;">
							<xsl:attribute name="name">
								<xsl:text>itemquantity</xsl:text>
								<xsl:value-of select="ItemGuid"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="Quantity"></xsl:value-of>
							</xsl:attribute>
							</input>
							<div class="input-group-btn">
								<div class="qty-plus btn-number">
									<em class="mdi mdi-plus"></em>
								</div>
							</div>
						</div>
					</div> -->
				</div>
			</td>
			<td>
				<div class="mobile-title">Tổng tiền</div>
				<div class="total">
					<xsl:value-of disable-output-escaping="yes" select="ItemTotal"></xsl:value-of>
				</div>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>