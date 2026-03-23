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
public partial class kullaniciKayitKullaniciAdi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        oturumZatenAcikmi();
        if (!IsPostBack)
        {
            if (Session["userKullaniciAdiTutucu"] != null)
            {
                TextBoxKullaniciAdi.Text = Session["userKullaniciAdiTutucu"].ToString();
                TextBoxKullaniciAdi.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            }
        }
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
   protected void ButtonKayit_Click(object sender, EventArgs e)
    {
        Response.Redirect("kullaniciGiris.aspx");
    }

    protected void ButtonSonraki_Click(object sender, EventArgs e)
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
                    Session["userKullaniciAdiTutucu"] = TextBoxKullaniciAdi.Text;
                    Response.Redirect("kullaniciKayitSifre.aspx");
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