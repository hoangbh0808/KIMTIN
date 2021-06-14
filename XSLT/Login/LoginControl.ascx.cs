/// Created:			    2013-01-01
/// Last Modified:		    2013-01-01


using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CanhCam.Business;
using CanhCam.Business.WebHelpers;
using CanhCam.Web.Controls;
using CanhCam.Web.Framework;
using Resources;

namespace CanhCam.Web.UI
{
    public partial class LoginControl : UserControl
    {

        //Constituent controls inside LoginControl
        private SiteLabel lblUserID;
        private SiteLabel lblEmail;
        private TextBox txtUserName;
        private CheckBox chkRememberMe;
        private Button btnLogin;
        private HyperLink lnkRecovery;
        private HyperLink lnkExtraLink;
        private TextBox txtPassword;
        private Panel divCaptcha = null;
        private Telerik.Web.UI.RadCaptcha captcha = null;

        private SiteSettings siteSettings = null;
        private string siteRoot = string.Empty;

        private bool setFocus = false;
        public bool SetFocus
        {
            get { return setFocus; }
            set { setFocus = value; }
        }

        private bool setRedirectUrl = true;

        public bool SetRedirectUrl
        {
            get { return setRedirectUrl; }
            set { setRedirectUrl = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.IsAuthenticated)
            {
                // user is logged in
                this.Visible = false;
                return;
            }

            LoadSettings();
            PopulateLabels();

            PopulateControls();

        }

        private void PopulateControls()
        {
            if (siteSettings == null) { return; }
            if (siteSettings.DisableDbAuth) { this.Visible = false; return; }

            LoginCtrl.SetRedirectUrl = setRedirectUrl;

            lblUserID = (SiteLabel)this.LoginCtrl.FindControl("lblUserID");
            lblEmail = (SiteLabel)this.LoginCtrl.FindControl("lblEmail");
            txtUserName = (TextBox)this.LoginCtrl.FindControl("UserName");
            txtPassword = (TextBox)this.LoginCtrl.FindControl("Password");
            chkRememberMe = (CheckBox)this.LoginCtrl.FindControl("RememberMe");
            btnLogin = (Button)this.LoginCtrl.FindControl("Login");
            lnkRecovery = (HyperLink)this.LoginCtrl.FindControl("lnkPasswordRecovery");
            lnkExtraLink = (HyperLink)this.LoginCtrl.FindControl("lnkRegisterExtraLink");

            divCaptcha = (Panel)LoginCtrl.FindControl("divCaptcha");
            captcha = (Telerik.Web.UI.RadCaptcha)LoginCtrl.FindControl("captcha");
            if (!siteSettings.RequireCaptchaOnLogin)
            {
                if (divCaptcha != null) { divCaptcha.Visible = false; }
                if (captcha != null) { captcha.Enabled = false; }
            }
            //else
            //{
            //    captcha.ProviderName = siteSettings.CaptchaProvider;
            //    captcha.RecaptchaPrivateKey = siteSettings.RecaptchaPrivateKey;
            //    captcha.RecaptchaPublicKey = siteSettings.RecaptchaPublicKey;
            //}

            // Remove 2015-01-06
            if ((siteSettings.UseEmailForLogin) && (!siteSettings.UseLdapAuth))
            {
                if (!WebConfigSettings.AllowLoginWithUsernameWhenSiteSettingIsUseEmailForLogin)
                {
                    RegularExpressionValidator regexEmail = new RegularExpressionValidator();
                    regexEmail.ControlToValidate = txtUserName.ID;
                    regexEmail.SetFocusOnError = true;
                    //regexEmail.ValidationExpression = @"^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@(([0-9a-zA-Z])+([-\w]*[0-9a-zA-Z])*\.)+[a-zA-Z]{2,9})$";
                    regexEmail.ValidationExpression = SecurityHelper.RegexEmailValidationPattern;
                    regexEmail.ErrorMessage = Resource.LoginFailedInvalidEmailFormatMessage;
                    regexEmail.ToolTip = Resource.LoginFailedInvalidEmailFormatMessage;
                    regexEmail.Display = ValidatorDisplay.Dynamic;
                    regexEmail.CssClass = "alert alert-danger";
                    regexEmail.SkinID = "LoginValidator";
                    this.LoginCtrl.Controls.Add(regexEmail);
                }
            }

            if (siteSettings.UseEmailForLogin && !siteSettings.UseLdapAuth)
            {
                this.lblUserID.Visible = false;
                this.txtUserName.Attributes.Add("placeholder", Resource.SignInEmailLabel);

                lblEnterUsernamePassword.Text = string.Format(Resource.SignInEnterUsernamePasswordFormat, Resource.SignInEmailLabel);
            }
            else
            {
                this.lblEmail.Visible = false;
                this.txtUserName.Attributes.Add("placeholder", Resource.ManageUsersLoginNameLabel);

                lblEnterUsernamePassword.Text = string.Format(Resource.SignInEnterUsernamePasswordFormat, Resource.ManageUsersLoginNameLabel);
            }
            this.txtPassword.Attributes.Add("placeholder", Resource.SignInPasswordLabel);

            if (setFocus) { txtUserName.Focus(); }

            lnkRecovery.Visible = ((siteSettings.AllowPasswordRetrieval || siteSettings.AllowPasswordReset) && (!siteSettings.UseLdapAuth ||
                                                                           (siteSettings.UseLdapAuth && siteSettings.AllowDbFallbackWithLdap)));

            lnkRecovery.NavigateUrl = this.LoginCtrl.PasswordRecoveryUrl;
            lnkRecovery.Text = this.LoginCtrl.PasswordRecoveryText;

            lnkExtraLink.NavigateUrl = siteRoot + "/Secure/Register.aspx";
            if (lnkExtraLink.Text.Length == 0)
                lnkExtraLink.Text = Resource.RegisterLink;
            lnkExtraLink.Visible = siteSettings.AllowNewRegistration;

            string returnUrlParam = Page.Request.Params.Get("returnurl");
            if (!String.IsNullOrEmpty(returnUrlParam))
            {
                //string redirectUrl = returnUrlParam;
                lnkExtraLink.NavigateUrl += "?returnurl=" + returnUrlParam;
            }

            chkRememberMe.Visible = siteSettings.AllowPersistentLogin;
            if (chkRememberMe.Text.Length == 0)
                chkRememberMe.Text = this.LoginCtrl.RememberMeText;

            btnLogin.Text = this.LoginCtrl.LoginButtonText;
            SiteUtils.SetButtonAccessKey(btnLogin, AccessKeys.LoginAccessKey);
        }

        private void PopulateLabels()
        {


        }

        private void LoadSettings()
        {
            siteSettings = CacheHelper.GetCurrentSiteSettings();
            siteRoot = SiteUtils.GetNavigationSiteRoot();

        }


        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            Load += new EventHandler(Page_Load);
        }
    }
}