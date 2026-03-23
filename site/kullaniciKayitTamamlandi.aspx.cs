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

public partial class kullaniciKayitTamamlandi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        oturumZatenAcikmi();
        conn();
        if (!IsPostBack)
        {
            if (Session["userKullaniciAdiTutucu"] != null && Session["userSifreTutucu"] != null)
            {
                string biografi = "Hakkımda bilgisi yok";
                string profilResmi = "default/user.png";
                baglanti.Close();
                baglanti.Open();
                MySqlCommand ekle = new MySqlCommand("insert into kullanicilar(kullaniciID,kullaniciAdi,kullaniciSifre,kullaniciProfilResmi,kullaniciBiografi,kullaniciTur,tarih) values(@kullaniciID,@kullaniciAdi,@kullaniciSifre,@kullaniciProfilResmi,@kullaniciBiografi,@kullaniciTur,@tarih)", baglanti);
                Random rnd = new Random();
                string kullaniciIDCreator = Convert.ToString(rnd.Next(100000000, 999999999));
                ekle.Parameters.AddWithValue("@kullaniciID", kullaniciIDCreator);
                ekle.Parameters.AddWithValue("@kullaniciAdi", Session["userKullaniciAdiTutucu"].ToString());
                ekle.Parameters.AddWithValue("@kullaniciSifre", Session["userSifreTutucu"].ToString());
                ekle.Parameters.AddWithValue("@kullaniciProfilResmi", profilResmi);
                ekle.Parameters.AddWithValue("@kullaniciBiografi", biografi);
                ekle.Parameters.AddWithValue("@kullaniciTur", "user");
                ekle.Parameters.AddWithValue("@tarih", DateTime.Now.ToString("dd.MM.yyyy HH:mm"));
                ekle.ExecuteNonQuery();
                baglanti.Close();
                Session["kullaniciID"] = kullaniciIDCreator;
                Session["kullaniciAdi"] = Session["userKullaniciAdiTutucu"].ToString();
                Session["kullaniciSifre"] = Session["userSifreTutucu"].ToString();
                Session["kullaniciProfilResmi"] = profilResmi;
                Session["kullaniciBiografi"] = biografi;
                Session["userKullaniciAdiTutucu"] = null;
                Session["userSifreTutucu"] = null;
            }
            else
            {
                Session["userKullaniciAdiTutucu"] = null;
                Session["userSifreTutucu"] = null;
                Response.Redirect("kullaniciKayitKullaniciAdi.aspx");
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
    protected void ButtonSonraki_Click(object sender, EventArgs e)
    {
        Response.Redirect("hesabim.aspx");
    }
}