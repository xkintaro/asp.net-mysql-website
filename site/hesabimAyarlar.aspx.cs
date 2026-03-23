using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Threading;
using System.Runtime.Serialization.Formatters;
using System.Timers;
using System.Activities.Expressions;
using System.IO;
using System.Drawing;
public partial class hesabimAyarlar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["KullaniciAdi"] == null)
        {
            Response.Redirect("kullaniciGiris.aspx");
        }
        if (!IsPostBack)
        {
            TextBoxKullaniciAdi.Text = Session["kullaniciAdi"].ToString();
            TextBoxSifre.Text = Session["kullaniciSifre"].ToString() + "********";
        }
        conn();
    }

    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    protected void ButtonGuncelleKullaniciAdi_Click(object sender, EventArgs e)
    {
        Response.Redirect("hesabimGuncelleKullaniciAdi.aspx");
    }
    protected void ButtonGuncelleEposta_Click(object sender, EventArgs e)
    {
        Session["userEpostaTutucu"] = null;
        Response.Redirect("hesabimGuncelleEposta.aspx");
    }
    protected void ButtonGuncelleSifre_Click(object sender, EventArgs e)
    {
        Response.Redirect("hesabimGuncelleSifre.aspx");
    }
}