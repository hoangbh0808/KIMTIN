<%@ Page Language="c#" MaintainScrollPositionOnPostback="true" CodeBehind="Dashboard.aspx.cs"
    MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="CanhCam.Web.AccountUI.DashboardPage" %>

<%@ Register TagPrefix="Site" TagName="AccountMenu" Src="~/Account/AccountMenu.ascx" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
  <div class="container profile-container">
    <div class="row flex flex-wrap">
      <Site:AccountMenu ID="accountMenu" runat="server" />
      <div class="col-xs-12 col-lg-9">
        <div class="user-page clearfix">
          <h1 class="postname">
            <asp:Literal ID="litHeading" Text="Bản thông tin của tôi" runat="server" />
          </h1>
          <div class="row flex flex-wrap">
            <div class="col-xs-12 col-md-6">
              <div class="account-info clearfix">
                <div class="info-heading">
                  <h2 class="posttitle">
                    Thông tin tài khoản
                  </h2>
                  <asp:HyperLink ID="lnkProfileEdit" runat="server" CssClass="link" Text="Chỉnh sửa"></asp:HyperLink>
                </div>
                <div class="info-detail">
                  <div class="group">
                    <span class="label">Họ và Tên:</span>
                    <span class="detail">
                      <asp:Literal ID="litFullName" runat="server" />
                    </span>
                  </div>
                  <div class="group">
                    <span class="label">Email: </span>
                    <span class="detail">
                      <asp:Literal ID="litEmail" runat="server" />
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-md-6">
              <div class="coin-info clearfix">
                <div class="info-detail">
                  <div class="detail">
                    <asp:Literal ID="litCurrentPoints" runat="server" />
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12">
              <div class="cart-history clearfix">
                <h2 class="posttitle">Các đơn hàng vừa đặt</h2>
                <div class="text-right">
                  <asp:HyperLink ID="lnkAllOrders" runat="server" CssClass="link" Text="Xem tất cả"></asp:HyperLink>
                </div>
                <asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>
              </div>
            </div>
            <div class="col-xs-12">
              <div class="address-info clearfix">
                <div class="info-heading">
                  <h2 class="posttitle">Sổ địa chỉ</h2>
                  <asp:HyperLink ID="lnkAddress" runat="server" CssClass="link" Text="Xem tất cả"></asp:HyperLink>
                </div>
                <div class="address-list">
                  <asp:Repeater ID="rptAddress" runat="server">
                    <ItemTemplate>
                      <div class="address-col">
                        <div class="address clearfix">
                          <div class="type">
                            <%# CanhCam.Web.AccountUI.AccountHelper.GetIsDefaultText(Convert.ToBoolean(Eval("IsDefault")))%>
                          </div>
                          <div class="name"><%#Eval("FirstName")%></div>
                          <div class="addr-detail">
                            <ul>
                              <li>Địa chỉ:
                                <%# FormatAddress(Eval("Address").ToString(), Eval("ProvinceGuid").ToString(), Eval("DistrictGuid").ToString(), Eval("WardGuid").ToString())%>
                              </li>
                              <li>Điện thoại: <%#Eval("Phone")%></li>
                            </ul>
                          </div>
                          <a href='<%# SiteRoot + "/Account/AddressEdit.aspx?id=" + Eval("AddressId").ToString() %>'
                            class="btn-editaddr">Sửa</a>
                        </div>
                      </div>
                    </ItemTemplate>
                  </asp:Repeater>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>