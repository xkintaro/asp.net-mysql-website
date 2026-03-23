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
using System.Drawing;
using System.Reflection.Emit;

public partial class kullaniciProfili : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
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
        string urunKadi = Request.QueryString["kullaniciAdi"];
        if (Session["kullaniciID"] != null)
        {
            if (urunID == Session["kullaniciID"].ToString())
            {
                Response.Redirect("~/hesabim.aspx");
            }
        }
        if (Session["kullaniciAdi"] != null)
        {
            if (urunKadi == Session["kullaniciAdi"].ToString())
            {
                Response.Redirect("~/hesabim.aspx");
            }
        }
        if (!string.IsNullOrEmpty(urunID))
        {
            baglanti.Close();
            baglanti.Open();
            string query = "SELECT  * FROM kullanicilar WHERE kullaniciID = @ID";
            using (MySqlCommand command = new MySqlCommand(query, baglanti))
            {
                command.Parameters.AddWithValue("@ID", urunID);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string kullaniciProfilResmi = reader["kullaniciProfilResmi"].ToString();
                        string kullaniciAdi = reader["kullaniciAdi"].ToString();
                        string kullaniciBiografi = reader["kullaniciBiografi"].ToString();
                        Image1.ImageUrl = "/upload/" + kullaniciProfilResmi;
                        LabelKullaniciAdi.Text = kullaniciAdi;
                        TextBoxBiografi.Text = kullaniciBiografi;
                    }
                }
            }
            baglanti.Close();
        }
        else if (!string.IsNullOrEmpty(urunKadi))
        {
            baglanti.Close();
            baglanti.Open();
            string query = "SELECT  * FROM kullanicilar WHERE kullaniciAdi = @kullaniciAdi";
            using (MySqlCommand command = new MySqlCommand(query, baglanti))
            {
                command.Parameters.AddWithValue("@kullaniciAdi", urunKadi);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string kullaniciProfilResmi = reader["kullaniciProfilResmi"].ToString();
                        string kullaniciAdi = reader["kullaniciAdi"].ToString();
                        string kullaniciBiografi = reader["kullaniciBiografi"].ToString();
                        Image1.ImageUrl = "/upload/" + kullaniciProfilResmi;
                        LabelKullaniciAdi.Text = kullaniciAdi;
                        TextBoxBiografi.Text = kullaniciBiografi;
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