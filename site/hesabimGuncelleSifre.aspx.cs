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
public partial class hesabimGuncelleSifre : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        if (Session["KullaniciAdi"] == null)
        {
            Response.Redirect("kullaniciGiris.aspx");
        }
    }

    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    protected void ButtonIptal_Click(object sender, EventArgs e)
    {
        Response.Redirect("hesabimAyarlar.aspx");
    }

    protected void ButtonKaydet_Click(object sender, EventArgs e)
    {
        if (TextBoxSifre.Text.Length >= 8)
        {
            if (TextBoxSifre.Text.Length <= 50)
            {
                if (TextBoxSifre.Text == TextBoxSifreTekrar.Text)
                {
                    baglanti.Close();
                    baglanti.Open();
                    MySqlCommand cmd = new MySqlCommand("UPDATE kullanicilar SET kullaniciSifre=@kullaniciSifre WHERE kullaniciID=@kullaniciID", baglanti);
                    cmd.Parameters.AddWithValue("@kullaniciSifre", TextBoxSifre.Text);
                    cmd.Parameters.AddWithValue("@kullaniciID", Session["kullaniciID"].ToString());
                    cmd.ExecuteNonQuery();
                    baglanti.Close();
                    LabelDurum.Text = "Şifreniz başarıyla güncellendi.";
                    LabelDurum.ForeColor = System.Drawing.Color.Green;
                    TextBoxSifre.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
                    TextBoxSifreTekrar.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
                    Session["KullaniciSifre"] = TextBoxSifre.Text;
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