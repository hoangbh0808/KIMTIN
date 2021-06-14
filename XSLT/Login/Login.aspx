<%@ Page Language="c#" CodeBehind="Login.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.UI.Pages.LoginPage" %>

    <%@ Register TagPrefix="gb" TagName="Login" Src="~/Secure/Controls/LoginControl.ascx" %>
        <asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
            <asp:Panel ID="pnlLogin" CssClass="wrap-secure wrap-login login-page clearfix" runat="server">
                <div class="container">
                    <div class="login-panel flex flex-wrap clearfix">
                        <h3 class="headtitle testing">
                            <gb:SiteLabel ID="lblSignIn" runat="server" ConfigKey="SignInLabel" UseLabelTag="false" />
                        </h3>
                        <div class="login-form clearfix">
                            <asp:Panel ID="pnlTopContent" runat="server" Visible="false"
                                CssClass="logincontent logincontenttop form-group" EnableViewState="false">
                                <asp:Literal ID="litTopContent" runat="server" EnableViewState="false" />
                            </asp:Panel>
                            <asp:Panel ID="pnlStandardLogin" runat="server" CssClass="loginstandard form-group">
                                <div class="panel panel-primary">
                                    <gb:Login ID="login1" runat="server" />
                                </div>
                            </asp:Panel>
                            <div class="loginopenid form-group">
                                <asp:Panel ID="pnlWindowsLive" runat="server" Visible="false">
                                    <portal:WindowsLiveLoginControl ID="livelogin" runat="server" />
                                </asp:Panel>
                                <asp:Panel ID="divLiteralOr" runat="server" Visible="false">
                                    <asp:Literal ID="litOr" runat="server" />
                                </asp:Panel>
                                <asp:Panel ID="pnlOpenID" runat="server" Visible="false">
                                </asp:Panel>
                            </div>
                            <asp:Panel ID="pnlBottomContent" runat="server" Visible="false"
                                CssClass="logincontent logincontentbottom" EnableViewState="false">
                                <asp:Literal ID="litBottomContent" runat="server" EnableViewState="false" />
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </asp:Content>