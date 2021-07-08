<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="col w-full lg:w-9/12 full-width-row">
			<div class="order-detail">
				<div class="admin-wrap">
					<div class="admin-title">
						<div class="text">
							<xsl:value-of select="/OrderDetail/OrderDetailTitle"/>
							<strong>
                #
								<xsl:value-of select="/OrderDetail/OrderCode"></xsl:value-of>
							</strong>
						</div>
						<div class="bottom-wrap">
							<div class="status">
								<span class="text-st">Tình trạng:</span>
								<em class="material-icons">
									<xsl:choose>
										<xsl:when test="/OrderDetail/PaymentStatus='Unpaid'">
											<xsl:text disable-output-escaping="yes">check_circle</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">cancel</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</em>
								<span>
									<xsl:value-of select="/OrderDetail/PaymentStatus"></xsl:value-of>
								</span>
							</div>
							<div class="shipping-date">
								<span class="text-st">Ngày mua</span>
								<span>
									<xsl:value-of select="/OrderDetail/OrderDateLabel"/>:
									<xsl:value-of select="/OrderDetail/CreatedDate"></xsl:value-of>
								</span>
							</div>
						</div>
					</div>
					<div class="row second-row-status">
						<div class="col w-full sm:w-1/2 lg:w-4/12">
							<div class="col-match-height">
								<div class="title">
									<xsl:value-of select="/OrderDetail/ReceiverAddressLabel"/>
								</div>
								<div class="item">
									<ul>
										<li>
											<p>
												<xsl:value-of select="/OrderDetail/OrderAddressLabel"/>
												<span class="text-st">Địa chỉ:</span>
											</p>
											<span>
												<xsl:value-of select="/OrderDetail/BillingAddress"></xsl:value-of>
												<xsl:if test="/OrderDetail/BillingDistrict!=''">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="/OrderDetail/BillingDistrict"></xsl:value-of>
												</xsl:if>
												<xsl:if test="/OrderDetail/BillingProvince!=''">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="/OrderDetail/BillingProvince"></xsl:value-of>
												</xsl:if>
											</span>
										</li>
										<li>
											<p>
												<xsl:value-of select="/OrderDetail/OrderPhoneLabel"/>
												<span class="text-st">Số điện thoại:</span>
											</p>
											<span>
												<xsl:value-of select="/OrderDetail/BillingPhone"></xsl:value-of>
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col w-full sm:w-1/2 lg:w-4/12">
							<div class="col-match-height">
								<div class="title">
									<xsl:value-of select="/OrderDetail/OrderShippingInfoTitle"/>
								</div>
								<div class="item">
									<ul>
										<li>
											<p>
												<xsl:value-of select="/OrderDetail/OrderShippingMethodLabel"/>
											</p>
											<span>
												<xsl:value-of select="/OrderDetail/ShippingMethod"></xsl:value-of>
											</span>
										</li>
										<li>
											<p>
												<xsl:value-of select="/OrderDetail/OrderShippingFeeLabel"/>
											</p>
											<xsl:choose>
												<xsl:when test="/OrderDetail/ShippingFee=/OrderDetail/ZeroShippingFee">
													<span>
														<xsl:value-of select="/OrderDetail/FreeLabel"/>
													</span>
												</xsl:when>
												<xsl:otherwise>
													<span>
														<xsl:value-of select="/OrderDetail/ShippingFee"></xsl:value-of>
													</span>
												</xsl:otherwise>
											</xsl:choose>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col w-full sm:w-1/2 lg:w-4/12">
							<div class="col-match-height">
								<div class="title">
									<xsl:value-of select="/OrderDetail/OrderPaymentMethodLabel"/>
								</div>
								<div class="item">
									<ul>
										<li>
											<span>
												<xsl:value-of select="/OrderDetail/PaymentMethod"></xsl:value-of>
											</span>
											<div class="status pending">
												<xsl:value-of select="/OrderDetail/PaymentStatus"></xsl:value-of>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="order-note">
						<div class="note-title-wrapper">
							<xsl:value-of select="/OrderDetail/OrderNoteLabel"></xsl:value-of>
						</div>
						<div class="note-body-wrapper">
							<xsl:value-of select="/OrderDetail/OrderNote"></xsl:value-of>
						</div>
					</div>
					<div class="cart-display">
						<div class="wrapper">
							<table class="carttable" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th>
											<xsl:value-of select="/OrderDetail/CartProductLabel"/>
										</th>
										<th>
											<xsl:value-of select="/OrderDetail/CartPriceLabel"/>
										</th>
										<th>
											<xsl:value-of select="/OrderDetail/CartQuantityLabel"/>
										</th>
										<th>
											<xsl:value-of select="/OrderDetail/CartSubTotalLabel"/>
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:apply-templates select="/OrderDetail/Product"></xsl:apply-templates>
								</tbody>
							</table>
						</div>
						<div class="total-wrapper">
							<table class="total-table">
								<tbody>
									<tr>
										<td>
											<xsl:value-of select="/OrderDetail/CartSubTotalLabel"/>
										</td>
										<td align="right">
											<xsl:value-of select="/OrderDetail/OrderSubTotal"></xsl:value-of>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="/OrderDetail/CartDiscountLabel"/>
										</td>
										<td align="right">
											<xsl:value-of select="/OrderDetail/OrderDiscount"></xsl:value-of>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="/OrderDetail/OrderShippingFeeLabel"/>
										</td>
										<td align="right">
											<xsl:value-of select="/OrderDetail/ShippingFee"></xsl:value-of>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="/OrderDetail/CartTotalLabel"/>
										</td>
										<td align="right">
											<xsl:value-of select="/OrderDetail/OrderTotal"></xsl:value-of>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="btn-left">
						<a class="btn btn-back" href="/Product/PurchaseHistory.aspx">
							<em class="lnr lnr-arrow-left"></em>
							<span>
								<xsl:value-of select="/OrderDetail/BackButton"/>
							</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<tr>
			<td>
				<div class="product-item">
					<div class="image">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
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
								<xsl:value-of select="Title"></xsl:value-of>
							</a>
						</div>
					</div>
				</div>
			</td>
			<td>
				<span>
					<xsl:value-of select="Price"></xsl:value-of>
				</span>
			</td>
			<td>
				<xsl:value-of select="Quantity"></xsl:value-of>
			</td>
			<td>
				<span class="total">
					<xsl:value-of select="ItemTotal"></xsl:value-of>
				</span>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="Payment">
		<div class="payment-method">
			<div class="select-group checkbox">
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
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</label>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Attributes">
		<xsl:if test="Options/Title != ''">
			<div class="size">
				<xsl:value-of select="Title"></xsl:value-of>
				<xsl:text>: </xsl:text>
				<xsl:apply-templates select="Options"></xsl:apply-templates>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Options">
		<xsl:value-of select="Title"></xsl:value-of>
	</xsl:template>
</xsl:stylesheet>