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

public partial class admin_kullanici_detay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        yukleDetaySayfasi();
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
    public void yukleDetaySayfasi()
    {
        string urunID = Request.QueryString["kullaniciID"];
        if (!string.IsNullOrEmpty(urunID))
        {
            baglanti.Close();
            baglanti.Open();
            string query = "select * from kullanicilar where kullaniciID=@ID";
            using (MySqlCommand command = new MySqlCommand(query, baglanti))
            {
                command.Parameters.AddWithValue("@ID", urunID);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string id = reader["kullaniciID"].ToString();
                        string kadi = reader["kullaniciAdi"].ToString();
                        string resim = reader["kullaniciProfilResmi"].ToString();
                        string bio = reader["kullaniciBiografi"].ToString();
                        string yetki = reader["kullaniciTur"].ToString();
                        string tarih = reader["tarih"].ToString();
                        Image1.ImageUrl = "~/upload/" + resim;
                        TextBoxID.Text = id;
                        TextBoxKullaniciAdi.Text = kadi;
                        TextBoxBiografi.Text = bio;
                        TextBoxYetki.Text = yetki;
                        TextBoxTarih.Text = tarih;
                    }
                }
            }
            baglanti.Close();
        }
        else
        {
            Response.Redirect("~/");
        }
    }
}