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

public partial class kullaniciKayitSifre : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        oturumZatenAcikmi();
        conn();
    }
    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

        using (baglanti = new MySqlConnection(connectionString))
        {
            try
            {
                baglanti.Open();

                baglanti.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Hata: " + ex.Message);
            }
        }
    }
    public void oturumZatenAcikmi()
    {
        if (Session["kullaniciAdi"] != null)
        {
            Response.Redirect("~/hesabim.aspx");
        }
    }

    protected void ButtonOnceki_Click(object sender, EventArgs e)
    {
        Response.Redirect("kullaniciKayitKullaniciAdi.aspx");
    }

    protected void ButtonSonraki_Click(object sender, EventArgs e)
    {
        if (TextBoxSifre.Text.Length >= 8)
        {
            if (TextBoxSifre.Text.Length <= 50)
            {
                if (TextBoxSifre.Text == TextBoxSifreTekrar.Text)
                {
                    Session["userSifreTutucu"] = TextBoxSifre.Text;
                    Response.Redirect("kullaniciKayitTamamlandi.aspx");
                }
                else
                {
                    TextBoxSifre.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                    TextBoxSifreTekrar.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                    LabelDurum.Text = "Lütfen şifrenizi tekrar giriniz.";
                    LabelDurum.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                TextBoxSifre.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                TextBoxSifreTekrar.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                LabelDurum.Text = "Şifreniz 50 karakterden fazla olamaz.";
                LabelDurum.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            TextBoxSifre.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            TextBoxSifreTekrar.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            LabelDurum.Text = "Şifreniz en az 8 karakter olmalıdır.";
            LabelDurum.ForeColor = System.Drawing.Color.Red;
        }
    }
}