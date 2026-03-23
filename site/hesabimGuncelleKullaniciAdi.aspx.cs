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
public partial class hesabimGuncelleKullaniciAdi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        if (Session["KullaniciAdi"] == null)
        {
            Response.Redirect("kullaniciGiris.aspx");
        }
        if (!IsPostBack)
        {
            TextBoxKullaniciAdi.Text = Session["kullaniciAdi"].ToString();
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
        if (TextBoxKullaniciAdi.Text != Session["KullaniciAdi"].ToString())
        {
            if (TextBoxKullaniciAdi.Text.Length >= 5)
            {
                if (TextBoxKullaniciAdi.Text.Length <= 14)
                {
                    bool zatenVarmiKullaniciAdi = false;
                    baglanti.Close();
                    baglanti.Open();
                    MySqlCommand listekadi = new MySqlCommand("select * from kullanicilar", baglanti);
                    MySqlDataReader okukadi = listekadi.ExecuteReader();
                    while (okukadi.Read())
                    {
                        Session["userKullaniciAdiKontrol"] = okukadi["KullaniciAdi"].ToString();
                        if (TextBoxKullaniciAdi.Text == Session["userKullaniciAdiKontrol"].ToString())
                        {
                            zatenVarmiKullaniciAdi = true;
                            baglanti.Close();
                            break;
                        }
                    }
                    if (zatenVarmiKullaniciAdi == true)
                    {
                        TextBoxKullaniciAdi.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                        LabelDurum.Text = "Kullanıcı adı zaten kullanılıyor.";
                        LabelDurum.ForeColor = System.Drawing.Color.Red;
                        baglanti.Close();
                    }
                    else
                    {
                        baglanti.Close();
                        baglanti.Open();
                        MySqlCommand cmd = new MySqlCommand("UPDATE kullanicilar SET kullaniciAdi=@KullaniciAdi WHERE kullaniciID=@kullaniciID", baglanti);
                        cmd.Parameters.AddWithValue("@kullaniciAdi", TextBoxKullaniciAdi.Text);
                        cmd.Parameters.AddWithValue("@kullaniciID", Session["kullaniciID"].ToString());
                        cmd.ExecuteNonQuery();
                        baglanti.Close();
                        LabelDurum.Text = "Kullanıcı adınız başarıyla güncellendi.";
                        LabelDurum.ForeColor = System.Drawing.Color.Green;
                        TextBoxKullaniciAdi.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
                        Session["KullaniciAdi"] = TextBoxKullaniciAdi.Text;
                        Session["userKullaniciAdiKontrol"] = null;
                    }
                }
                else
                {
                    TextBoxKullaniciAdi.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                    LabelDurum.Text = "Kullanıcı adı 14 karakterden uzun olamaz.";
                    LabelDurum.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                TextBoxKullaniciAdi.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                LabelDurum.Text = "Kullanıcı adı 5 karakterden kısa olamaz.";
                LabelDurum.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}