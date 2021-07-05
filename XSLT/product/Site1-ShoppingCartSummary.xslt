<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ShoppingCart">
		<xsl:if test="Address != ''">
			<div class="order-summary clearfix">
				<div class="order-title clearfix">
					<div class="title">
						<xsl:text disable-output-escaping="yes">Địa chỉ giao hàng</xsl:text>
					</div>
					<a class="btn-edit">
						<xsl:attribute name="href">
							<xsl:text>/checkoutaddress</xsl:text>
						</xsl:attribute>
						<xsl:text disable-output-escaping="yes">Thay đổi</xsl:text>
					</a>
				</div>
				<div class="table-responsive table-wrap clearfix">
					<table class="table order-table">
						<tbody>
							<tr class="billing-name">
								<td colspan="2">
									<xsl:value-of select="LastName" />
									<xsl:value-of select="FirstName" />
								</td>
							</tr>
							<tr class="billing-phone">
								<td>
									<span>
										<xsl:text>Số điện thoại:</xsl:text>
									</span>
								</td>
								<td>
									<xsl:value-of select="Phone" />
								</td>
							</tr>
							<tr class="billing-address">
								<td>
									<span>
										<xsl:text>Địa chỉ:</xsl:text>
									</span>
								</td>
								<td>
									<xsl:value-of select="Address" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</xsl:if>
		<section class="minicart clearfix massive-wrapper">
			<div class="carttitle">
				<p>
					<xsl:text disable-output-escaping="yes">đơn hàng của bạn</xsl:text>
					<xsl:text disable-output-escaping="yes"></xsl:text>
					<!-- <xsl:text>(</xsl:text>
                    <strong>
                        <xsl:value-of select="TotalProducts"/>
                    </strong>
                    <xsl:text></xsl:text>
                    <xsl:text disable-output-escaping="yes">sản phẩm</xsl:text>
                    <xsl:text>)</xsl:text> -->
				</p>
				<a class="btn-edit">
					<xsl:attribute name="href">
						<xsl:value-of select="CartPageUrl" />
					</xsl:attribute>
					<em class="material-icons" aria-hidden="true">border_color</em>
				</a>
			</div>
			<div class="carttable clearfix">
				<xsl:apply-templates select="CartItem" />
				<div class="bottom">
					<div class="text">
						<div class="label">
							<xsl:text>Tạm tính</xsl:text>
						</div>
						<div class="value discount-total">
							<xsl:value-of select="SubTotal" />
						</div>
					</div>
					<div class="text">
						<div class="label">
							<xsl:text>Giảm giá</xsl:text>
						</div>
						<div class="value discount-total">
							<xsl:value-of select="DiscountTotal" />
						</div>
					</div>
					<xsl:if test="CouponTotal != ''">
						<div class="text">
							<div class="label">
								<xsl:text>Coupon</xsl:text>
							</div>
							<div class="value discount-total">
								<xsl:value-of select="CouponTotal" />
							</div>
						</div>
					</xsl:if>
					<div class="text">
						<div class="label">
							<xsl:text disable-output-escaping="yes">Phí vận chuyển</xsl:text>
						</div>
						<div class="value shipping-total">
							<xsl:value-of select="ShippingTotal" />
						</div>
					</div>
					<!-- <xsl:if test="HaveGift='True'">
                        <div class="text">
                            <div class="label">
                                <xsl:text>Gói hàng</xsl:text>
                            </div>
                            <div class="value shipping-total">
                                <xsl:value-of select="GiftTotal"/>
                            </div>
                        </div>
                    </xsl:if>
                    <xsl:if test="GiftMess!=''">
                        <div class="text">
                            <div class="label">
                                <xsl:text>Quà tặng</xsl:text>
                            </div>
                            <div class="col-xs-12">
                                <xsl:value-of select="GiftMess" disable-output-escaping="yes"/>
                            </div>
                        </div>
                    </xsl:if> -->
					<div class="text">
						<div class="label">
							<xsl:text disable-output-escaping="yes">Tổng cộng</xsl:text>
						</div>
						<div class="value order-total">
							<xsl:value-of select="Total" />
						</div>
					</div>
					<!-- <xsl:if test="PointIsAvailable='true'">
                        <section class="group spending-points">
                            <div class="label">Điểm sử dụng:</div>
                            <div id="spendingPointsLabel" class="value">
                                <xsl:value-of select="SpendingPoints"/>
                            </div>
                            <div id="pointSlider" data-min="0" data-step="10">
                                <xsl:attribute name="data-max">
                                    <xsl:value-of select="TotalPoints"/>
                                </xsl:attribute>
                                <xsl:attribute name="data-value">
                                    <xsl:value-of select="SpendingPoints"/>
                                </xsl:attribute>
                            </div>
                            <div class="clearfix">
                                <input id="spendingPoints" name="spendingPoints" type="hidden">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="SpendingPoints"/>
                                    </xsl:attribute>
                                </input>
                                <span class="pull-left">0</span>
                                <span class="pull-right">
                                    <xsl:value-of select="TotalPoints"/>
                                </span>
                            </div>
                        </section>
                    </xsl:if> -->
					<xsl:if test="PointIsAvailable = 'True' ">
						<div class="checkout-wrapper card-item checkout-point-wrap">
							<div class="card-heading">
								<div class="card-title">Điểm tích lũy</div>
							</div>
							<div class="card-body leading-snug">
								<div class="point-summary">
									<p>
										<xsl:text>Điểm đã có </xsl:text>
										<xsl:value-of select="RewardPointsBalance"/>
										<xsl:text> điểm</xsl:text>
									</p>
									<p>
										<xsl:text>Điểm khả dụng </xsl:text>
										<xsl:value-of select="RewardPointsAvailable"/>
										<xsl:text> điểm</xsl:text>
									</p>
									<p>
										<xsl:value-of select="SpendingPointsInfoText"/>
									</p>
								</div>
								<div class="point-used-total text-main mt-3">
									<p>
										<xsl:text>Số điểm sử dụng: </xsl:text>
										<span id="usedPoints">
											<xsl:value-of select="SpendingPoints"/>
										</span>
									</p>
								</div>
								<div class="point-slider-wrap mt-3">
									<div class="point-slider" id="user-points-slider"/>
									<div class="point-slider-text flex justify-between mt-1">
										<span class="point-min">0</span>
										<span class="point-max">
											<xsl:value-of select="RewardPointsAvailable"/>
										</span>
									</div>
								</div>
								<div class="point-slider-input flex mt-2">
									<label>Nhập số điểm bạn cần sử dụng</label>
									<input name="RedeemedRewardPoints" type="number" min="0">
										<xsl:attribute name="max">
											<xsl:value-of select="RewardPointsAvailable"/>
										</xsl:attribute>
									</input>
								</div>
							</div>
						</div>
					</xsl:if>
				</div>
			</div>
		</section>
		<div class="admin-wrap checkout-discount massive-wrapper">
			<div class="admin-title">
				<div class="text">Mã giảm giá / Quà tặng</div>
			</div>
			<div class="carttable">
				<div class="normal-text">Nhập mã giảm giá</div>
				<div class="wrapper-form">
					<div class="form-group">
						<div class="setting-control">
							<xsl:choose>
								<xsl:when test="CouponCode!=''">
									<span class="code">
										<xsl:value-of select="CouponCode"></xsl:value-of>
									</span>
									<span class="title">
										<xsl:value-of select="CouponTitle"></xsl:value-of>
									</span>
									<button onclick="AjaxCart.removecoupon();return false;">Xóa</button>
								</xsl:when>
								<xsl:otherwise>
									<input type="text" id="couponCode" autocomplete="off" max-length="20" placeholder="Nhập mã giảm giá">
										<xsl:attribute name="placeholder">
											<xsl:value-of select="plCoupon"></xsl:value-of>
										</xsl:attribute>
									</input>
									<div class="coupon-apply-error"></div>
									<button onclick="AjaxCart.applycoupon();return false;">Áp dụng</button>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="check-text">Sau khi áp dụng, Mã giảm giá có thể không dùng được trong vòng 15 phút.</div>
					<div class="normal-text">Trong quá trình thanh toán, sẽ tạm khóa mã giảm giá của quý khách để đảm bảo phiên giao dịch được ổn định. Mã giảm giá sẽ được mở lại ngay khi phiên giao dịch kết thúc</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="CartItem">
		<div class="item clearfix">
			<div class="product clearfix">
				<div class="productimg">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl" />
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title" />
							</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="content">
					<div class="productdetail">
						<div class="productname">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of select="Title" disable-output-escaping="yes" />
							</a>
						</div>
						<xsl:apply-templates select="Attributes"></xsl:apply-templates>
					</div>
					<div class="amount">
						<div class="price">
							<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
						</div>
						<div class="count">
							<xsl:text>x</xsl:text>
							<xsl:value-of select="Quantity" />
						</div>
						<div class="total">
							<xsl:choose>
								<xsl:when test="ItemSubTotalSize !=''">
									<xsl:value-of select="ItemSubTotalSize" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="ItemTotal" />
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- <span>
                            <xsl:text disable-output-escaping="yes">Số lượng:</xsl:text>
                        </span> -->
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Attributes">
		<div class="productsize">
			<xsl:value-of select="Title" />
			<xsl:text>:</xsl:text>
			<strong>
				<xsl:apply-templates select="Options" />
			</strong>
		</div>
	</xsl:template>
	<xsl:template match="Options">
		<xsl:if test="IsActive='true'">
			<xsl:value-of select="Title" />
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>