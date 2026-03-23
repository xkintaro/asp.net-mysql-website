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

public partial class kullaniciGiris : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        oturumZatenAcikmi();
        conn();
        Session["userEpostaTutucu"] = null;
        Session["userDogrulanmisEposta"] = null;
        Session["userKullaniciAdiTutucu"] = null;
        Session["userSifreTutucu"] = null;
        Session["userDogrulamaKoduTutucu"] = null;
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
                Console.WriteLine("Hata: " + ex.Message);
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
        Response.Redirect("kullaniciKayitKullaniciAdi.aspx");
    }
    protected void ButtonSonraki_Click(object sender, EventArgs e)
    {
        bool varmi = false;
        baglanti.Close();
        baglanti.Open();
        MySqlCommand liste = new MySqlCommand("select * from kullanicilar", baglanti);
        MySqlDataReader oku = liste.ExecuteReader();
        while (oku.Read())
        {
            Session["kullaniciIDKontrol"] = oku["kullaniciID"].ToString();
            Session["kullaniciAdiKontrol"] = oku["kullaniciAdi"].ToString();
            Session["kullaniciSifreKontrol"] = oku["kullaniciSifre"].ToString();
            Session["kullaniciProfilResmiKontrol"] = oku["kullaniciProfilResmi"].ToString();
            Session["kullaniciBiografiKontrol"] = oku["kullaniciBiografi"].ToString();

            if (TextBoxKullaniciAdi.Text == Session["kullaniciAdiKontrol"].ToString() && TextBoxSifre.Text == Session["kullaniciSifreKontrol"].ToString())
            {
                Session["kullaniciID"] = Session["kullaniciIDKontrol"].ToString();
                Session["kullaniciAdi"] = Session["kullaniciAdiKontrol"].ToString();
                Session["kullaniciSifre"] = Session["kullaniciSifreKontrol"].ToString();
                Session["kullaniciProfilResmi"] = Session["kullaniciProfilResmiKontrol"].ToString();
                Session["kullaniciBiografi"] = Session["kullaniciBiografiKontrol"].ToString();

                Session["kullaniciIDKontrol"] = null;
                Session["kullaniciAdiKontrol"] = null;
                Session["kullaniciSifreKontrol"] = null;
                Session["kullaniciProfilResmiKontrol"] = null;
                Session["kullaniciBiografiKontrol"] = null;
                varmi = true;
                break;
            }
        }
        baglanti.Close();
        if (varmi == true)
        {
            Response.Redirect("hesabim.aspx");
        }
        else
        {
            TextBoxKullaniciAdi.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            TextBoxSifre.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            LabelDurum.ForeColor = System.Drawing.Color.Red;
            LabelDurum.Text = "Kullanıcı bulunamadı.";
        }
    }
}