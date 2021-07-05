<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="receive-address clearfix">
			<div class="carttitle">Thông tin giao hàng</div>
			<div class="cart-form clearfix">
				<div class="row">
					<div class="group clearfix col-lg-12">
						<div class="form-group">
							<div class="label">
								<label>
									Họ và tên
									<span>*</span>
								</label>
							</div>
							<div class="input">
								<input type="text" name="Address_FirstName">
									<xsl:attribute name="placeholder">
										<xsl:text>ex: Nguyễn văn a</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/FirstName"></xsl:value-of>
									</xsl:attribute>
								</input>
							</div>
						</div>
						<div class="form-group">
							<div class="label">
								<label>
									Số điên thoại
									<span>*</span>
								</label>
							</div>
							<div class="input phone">
								<input type="text" name="Address_Phone">
									<xsl:attribute name="placeholder">
										<xsl:text>ex: 0391233321</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/Phone"></xsl:value-of>
									</xsl:attribute>
								</input>
							</div>
						</div>
						<div class="form-group">
							<div class="label">
								<label>Email</label>
							</div>
							<div class="input">
								<input type="text" name="Address_Email" placeholder="Email">
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/Email"></xsl:value-of>
									</xsl:attribute>
								</input>
							</div>
						</div>
						<div class="form-group">
							<div class="label">
								<label>
									Tỉnh/Thành phố
									<span>*</span>
								</label>
							</div>
							<div class="input select-icon">
								<select name="Address_Province" onchange="AjaxCheckout.getdistrictsbyprovinceguid(this, 'Address_District')">
									<option value="">Chọn tỉnh/thành phố </option>
									<xsl:apply-templates select="/CheckoutAddress/Provinces"></xsl:apply-templates>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="label">
								<label>
									Quận/Huyện
									<span>*</span>
								</label>
							</div>
							<div class="input select-icon">
								<select name="Address_District" onchange="AjaxCheckout.getshippingtotal()">
									<option value="">Chọn quận/huyện</option>
									<xsl:apply-templates select="/CheckoutAddress/Districts"></xsl:apply-templates>
								</select>
							</div>
						</div>
						<div class="form-group form-address">
							<div class="label">
								<label>
									Địa chỉ giao hàng
									<span>*</span>
								</label>
							</div>
							<div class="textarea">
								<textarea type="text" name="Address_Address">
									<xsl:value-of select="/CheckoutAddress/Address"></xsl:value-of>
								</textarea>
								<!-- <xsl:attribute name="placeholder">
										<xsl:text>Ex: 64 Hiep Binh Street</xsl:text>
									</xsl:attribute> -->
								<!-- <xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/Address"></xsl:value-of>
									</xsl:attribute> -->
							</div>
						</div>
						<div class="form-group form-messenger">
							<div class="label">
								<label>
									Ghi chú
								</label>
							</div>
							<div class="textarea">
								<textarea name="OrderNote" cols="30" rows="2">
									<xsl:value-of select="/CheckoutAddress/OrderNote"></xsl:value-of>
								</textarea>
								<div class="check-text">
								Vui lòng ghi rõ thông tin nếu bạn là người nước ngoài
								</div>
							</div>
						</div>
					</div>
					<div class="group other-address clearfix col-lg-12">
						<div class="check-group">
							<input class="hidden" id="ttmh" type="checkbox" name="Address_SameBilling"></input>
							<div id="btn-ttmh" for="ttmh">
								<label>Bạn muốn giao hàng đến địa chỉ khác?</label>
								<a href="javascript: ;" class="click-more-address">Thêm địa chỉ giao hàng</a>
							</div>
						</div>
						<div class="user-info clearfix">
							<div class="form-group">
								<div class="label">
									<label>
										Họ tên
										<span>*</span>
									</label>
								</div>
								<div class="input">
									<input type="text" name="ShippingAddress_FirstName">
										<xsl:attribute name="value">
											<xsl:value-of select="/CheckoutAddress/ShippingFirstName"></xsl:value-of>
										</xsl:attribute>
									</input>
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>
										Điện thoại
										<span>*</span>
									</label>
								</div>
								<div class="input phone">
									<input type="text" name="ShippingAddress_Phone">
										<xsl:attribute name="value">
											<xsl:value-of select="/CheckoutAddress/ShippingPhone"></xsl:value-of>
										</xsl:attribute>
									</input>
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>Email</label>
								</div>
								<div class="input">
									<input type="text" name="ShippingAddress_Email">
										<xsl:attribute name="value">
											<xsl:value-of select="/CheckoutAddress/ShippingEmail"></xsl:value-of>
										</xsl:attribute>
									</input>
								</div>
							</div>
							<!-- <div class="hr"></div> -->
							<div class="form-group">
								<div class="label">
									<label>
										Tỉnh/Thành phố
										<span>*</span>
									</label>
								</div>
								<div class="input">
									<select name="ShippingAddress_Province" onchange="AjaxCheckout.getdistrictsbyprovinceguid(this, 'ShippingAddress_District')">
										<option value="">Tỉnh/Thành phố</option>
										<xsl:apply-templates select="/CheckoutAddress/Provinces" mode="Shipping"></xsl:apply-templates>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>
										Quận/Huyện
										<span>*</span>
									</label>
								</div>
								<div class="input">
									<select name="ShippingAddress_District">
										<option value="">Quận/Huyện</option>
										<xsl:apply-templates select="/CheckoutAddress/Districts" mode="Shipping"></xsl:apply-templates>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label>
										Địa chỉ
										<span>*</span>
									</label>
								</div>
								<div class="textarea">
									<textarea type="text" name="ShippingAddress_Address">
										<!-- <xsl:attribute name="placeholder">
											<xsl:text>Ex: 64 Hiep Binh Street</xsl:text>
										</xsl:attribute> -->
										<!-- <xsl:attribute name="value">
											<xsl:value-of select="/CheckoutAddress/Address"></xsl:value-of>
										</xsl:attribute> -->
									</textarea>
								</div>
							</div>
						</div>
						<!--<section class="check-group"><input id="cntt" type="checkbox" name=""  checked="checked"></input><label for="cntt">Cập nhật thông tin trên làm địa chỉ hiện tại của tôi</label></section>-->
					</div>
					<div class="qcheckbox xuat-hoa-don-input">
						<input id="Invoice_Required" type="checkbox" name="Invoice_Required">
							<xsl:attribute name="onclick">
								<xsl:text>AjaxCheckout.toggleCompany()</xsl:text>
							</xsl:attribute>
						</input>
						<label for="Invoice_Required">
							Xuất hóa đơn
						</label>
					</div>
					<div id="divCompany" class="group" style="display:none;">
						<div class="form-group form-company-name">
							<div class="label">
								<label class="require">
									<xsl:value-of select="/CheckoutAddress/CompanyNameText" />
									<span>*</span>
								</label>
							</div>
							<div class="input">
								<input type="text" name="Invoice_CompanyName">
									<xsl:attribute name="placeholder">
										<xsl:value-of select="/CheckoutAddress/plCompanyName" />
									</xsl:attribute>
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/CompanyName" />
									</xsl:attribute>
								</input>
							</div>
						</div>
						<div class="form-group form-taxcode">
							<div class="label">
								<label class="require">
									<xsl:value-of select="/CheckoutAddress/CompanyTaxCodeText" />
									<span>*</span>
								</label>
							</div>
							<div class="input">
								<input type="text" name="Invoice_CompanyTaxCode">
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/CompanyTaxCode" />
									</xsl:attribute>
								</input>
							</div>
						</div>
						<div class="form-group form-company-address">
							<div class="label">
								<label class="require">
									<xsl:value-of select="/CheckoutAddress/CompanyAddressText" />
									<span>*</span>
								</label>
							</div>
							<div class="textarea">
								<textarea name="Invoice_CompanyAddress">
									<xsl:attribute name="placeholder">
										<xsl:value-of select="/CheckoutAddress/plCompanyAddress"/>
									</xsl:attribute>
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/CompanyAddress"/>
									</xsl:attribute>
									<xsl:value-of select="/CheckoutAddress/CompanyAddress"/>
								</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end col-1-->
	</xsl:template>
	<xsl:template match="Provinces">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Provinces" mode="Shipping">
		<option>
			<xsl:if test="ShippingIsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Districts">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Districts" mode="Shipping">
		<option>
			<xsl:if test="ShippingIsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
</xsl:stylesheet>