<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="CheckoutLoginModule.ascx.cs" Inherits="CanhCam.Web.ProductUI.CheckoutLoginModule" %>
	<div class="cart-login">
		<div class="login-heading">
        Thông tin Tài khoản
    </div>
		<div class="login-form">
			<div class="select-group">
				<ul>
					<li>
						<asp:RadioButton GroupName="login" runat="server" ID="rdbCheckoutAsGuest" AutoPostBack="true" OnCheckedChanged="rdbCheckout_CheckedChanged" Text="
							<%$Resources:ProductResources, CheckoutAsGuest %>" />
						</li>
						<li>
							<asp:RadioButton GroupName="login" runat="server" CssClass="active" Checked="true" ID="rdbCheckoutAsReturningCustomer" AutoPostBack="true" OnCheckedChanged="rdbCheckout_CheckedChanged" Text="
								<%$Resources:ProductResources, CheckoutAsReturningCustomer %>" />
							</li>
						</ul>
					</div>
					<asp:Panel ID="pnlGuest" Visible="false" class="checkout-guest" runat="server">
						<div id="divEmailInput" class="guest-email" runat="server">
							<div class="module-title">Vui lòng nhập Email</div>
							<div class="form-group">
								<asp:TextBox ID="txtGuestEmail" runat="server" placeholder="
									<%$Resources:Resource, SignInEmailLabel %>" CssClass="form-control" MaxLength="100" />
									<asp:RequiredFieldValidator ControlToValidate="txtGuestEmail" ID="reqGuestEmail" ErrorMessage="
										<%$Resources:ProductResources, CheckoutAddressEmailRequired %>"
                        runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="CheckoutGuest" />
										<asp:RegularExpressionValidator ID="revGuestEmail" runat="server" ControlToValidate="txtGuestEmail" ErrorMessage="
											<%$Resources:ProductResources, CheckoutAddressEmailInvalid %>"
                        Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@(([0-9a-zA-Z])+([-\w]*[0-9a-zA-Z])*\.)+[a-zA-Z]{2,9})$"
                        ValidationGroup="CheckoutGuest" />
										</div>
									</div>
									<div id="divCheckoutAsGuestMessage" class="guest-message" runat="server" visible="false">
										<asp:Literal ID="litCheckoutAsGuestMessage" runat="server" />
									</div>
									<asp:Button CssClass="hvr-sweep-to-right btn-continue" ID="btnContinue" ValidationGroup="CheckoutGuest" OnClick="btnCheckoutAsGuest_Click" runat="server" Text="
										<%$Resources:ProductResources, CheckoutContinue %>" />
									</asp:Panel>
									<portal:SiteLogin ID="LoginCtrl" runat="server">
										<LayoutTemplate>
											<div class="module-title">Vui lòng đăng nhập</div>
											<asp:Panel ID="pnlLContainer" runat="server" DefaultButton="Login">
												<portal:gbLabel ID="FailureText" runat="server" CssClass="alert alert-danger" EnableViewState="false" />
												<div class="form-group">
													<label>Email *</label>
													<asp:TextBox ID="UserName" runat="server" placeholder="
														<%$Resources:Resource, SignInEmailLabel %>" CssClass="form-control" MaxLength="100" />
														<asp:RequiredFieldValidator ControlToValidate="UserName" ID="UserNameRequired" ErrorMessage="
															<%$Resources:ProductResources, CheckoutAddressEmailRequired %>"
                            runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="CheckoutLogin" />
															<asp:RegularExpressionValidator ID="EmailRegex" runat="server" ControlToValidate="UserName" ErrorMessage="
																<%$Resources:ProductResources, CheckoutAddressEmailInvalid %>"
                            Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@(([0-9a-zA-Z])+([-\w]*[0-9a-zA-Z])*\.)+[a-zA-Z]{2,9})$"
                            ValidationGroup="CheckoutLogin" />
															</div>
															<div class="form-group">
																<label>Mật khẩu *</label>
																<asp:TextBox ID="Password" runat="server" placeholder="
																	<%$Resources:Resource, SignInPasswordLabel %>" CssClass="form-control" TextMode="password" />
																</div>
																<asp:Panel class="captcha" ID="divCaptcha" runat="server">
																	<telerik:RadCaptcha ID="captcha" runat="server" EnableRefreshImage="true"
                            CaptchaTextBoxCssClass="form-control" CaptchaTextBoxLabel="" ErrorMessage="
																		<%$Resources:Resource, CaptchaFailureMessage %>"
                            CaptchaTextBoxTitle="
																			<%$Resources:Resource, CaptchaInstructions %>"
                            CaptchaLinkButtonText="
																				<%$Resources:Resource, CaptchaRefreshImage %>" />
																			</asp:Panel>
																			<div class="form-group d-flex justify-between mt-0">
																				<div class="wrap-dang-ky">
																					<span>Bạn chưa có tài khoản?</span>
																					<asp:HyperLink ID="lnkRegisterExtraLink" Text="
																						<%$Resources:Resource, RegisterLink %>" runat="server" />
																					</div>
																					<div class="wrap-dang-nhap">
																						<asp:HyperLink ID="lnkPasswordRecovery" Text="
																							<%$Resources:Resource, ForgotPasswordLabel %>" runat="server" />
																						</div>
																						<!-- <asp:CheckBox ID="RememberMe" Visible="false" Text="
																					<%$Resources:Resource, SignInSendRememberMeLabel %>" runat="server" /> -->
																					</div>
																					<div class="line-hoac">
																						<span>Hoặc</span>
																					</div>
																					<div class="flex justify-between mt-3">
																						<div class="cart-login-social-fb" style="box-shadow:none;">
																							<div class="social-login">
																								<a class="btn facebook-login facebook" data-url="/Account/LoginFacebook.aspx" href="#">
																									<em class="ri-facebook-fill"></em>
																									<span>Facebook</span>
																								</a>
																								<a class="btn google-login google" data-url="/Account/LoginGooglePlus.aspx" href="#">
																									<em class="ri-google-fill"></em>
																									<span>Google</span>
																								</a>
																							</div>
																						</div>
																					</div>
																					<asp:Button CssClass="hvr-sweep-to-right btn-continue" ID="Login" CommandName="Login" ValidationGroup="CheckoutLogin" runat="server" Text="
																						<%$Resources:ProductResources, CheckoutContinue %>" />
																					</asp:Panel>
																				</LayoutTemplate>
																			</portal:SiteLogin>
																		</div>
																	</div>