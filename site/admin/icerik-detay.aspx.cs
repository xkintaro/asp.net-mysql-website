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
using System.IO;
using System.Web.Compilation;
using System.Drawing;

public partial class admin_icerik_detay : System.Web.UI.Page
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
        string urunID = Request.QueryString["icerikno"];
        if (!string.IsNullOrEmpty(urunID))
        {
            baglanti.Close();
            baglanti.Open();
            string query = "SELECT i.*,  kategori.* " +
                             "FROM icerikler i " +
                             "INNER JOIN kategoriler kategori ON kategori.kategoriID = i.icerikKategori " +
                             "WHERE icerikno = @ID";
            using (MySqlCommand command = new MySqlCommand(query, baglanti))
            {
                command.Parameters.AddWithValue("@ID", urunID);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string yayinlayan = reader["icerigiYayinlayanKisi"].ToString();
                        string tarih = reader["tarih"].ToString();
                        string resim = reader["icerikKapakResmi"].ToString();
                        string baslik = reader["icerikBaslik"].ToString();
                        string kategori = reader["kategoriAdi"].ToString();
                        string aciklama = reader["icerikAciklamasi"].ToString();
                        string video = reader["icerikVideoDosyasi"].ToString();
                        Image1.ImageUrl = "../upload/" + resim;
                        TextBoxuploader.Text = yayinlayan;
                        TextBoxTarih.Text = tarih;
                        TextBoxBaslik.Text = baslik;
                        TextBoxKategori.Text = kategori;
                        TextBoxAciklama.Text = aciklama;
                        Session["videodetay"] = "../upload/" + video;
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
    protected void ButtonDuzenleResim_Click(object sender, EventArgs e)
    {
        string urunID = Request.QueryString["icerikno"];
        Response.Redirect("icerik-guncelle-resim.aspx?icerikno=" + urunID);
    }
    protected void ButtonDuzenleVideo_Click(object sender, EventArgs e)
    {
        string urunID = Request.QueryString["icerikno"];
        Response.Redirect("icerik-guncelle-video.aspx?icerikno=" + urunID);
    }
    protected void ButtonDuzenlebaslik_Click(object sender, EventArgs e)
    {
        string urunID = Request.QueryString["icerikno"];
        Response.Redirect("icerik-guncelle-baslik.aspx?icerikno=" + urunID);
    }
    protected void ButtonDuzenleKategori_Click(object sender, EventArgs e)
    {
        string urunID = Request.QueryString["icerikno"];
        Response.Redirect("icerik-guncelle-kategori.aspx?icerikno=" + urunID);
    }
    protected void ButtonDuzenleAciklama_Click(object sender, EventArgs e)
    {
        string urunID = Request.QueryString["icerikno"];
        Response.Redirect("icerik-guncelle-aciklama.aspx?icerikno=" + urunID);
    }
    protected void ButtonSil_Click(object sender, EventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string mesajId = Request.QueryString["icerikno"];
        MySqlCommand command = new MySqlCommand("DELETE FROM icerikler WHERE icerikno = @MesajId", baglanti);
        command.Parameters.AddWithValue("@MesajId", mesajId);
        command.ExecuteNonQuery();
        baglanti.Close();
        Response.Redirect("icerikler.aspx");
    }
    protected void ButtonSilBox_Click(object sender, EventArgs e)
    {
        message.Style["display"] = "block";
    }
    protected void ButtonIptal_Click(object sender, EventArgs e)
    {
        message.Style["display"] = "none";
    }
    protected void ButtonClose_Click(object sender, EventArgs e)
    {
        message.Style["display"] = "none";
    }
}