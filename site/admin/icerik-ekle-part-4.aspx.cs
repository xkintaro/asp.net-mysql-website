using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_icerik_ekle_part_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        if (Session["icerikBaslikTutucu"] == null || Session["icerikKategoriTutucu"] == null || Session["icerikAciklamaTutucu"] == null || Session["icerikResmiTutucu"] == null || Session["icerikVideosuTutucu"] == null)
        {
            Response.Redirect("~/admin/icerik-ekle-part-1.aspx");
        }
        if (!IsPostBack)
        {
            Image1.ImageUrl = "geciciUpload/" + Session["icerikResmiTutucu"].ToString();
            TextBoxuploader.Text = Session["kullaniciAdi"].ToString();
            TextBoxTarih.Text = DateTime.Now.ToString("dd.MM.yyyy HH:mm");
            TextBoxBaslik.Text = Session["icerikBaslikTutucu"].ToString();
            TextBoxKategori.Text = Session["icerikKategoriTutucu"].ToString();
            TextBoxAciklama.Text = Session["icerikAciklamaTutucu"].ToString();
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
                Console.WriteLine("Hata: " + ex.Message);
            }
        }
    }
    protected void ButtonOnceki_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/icerik-ekle-part-3.aspx");
    }

    protected void ButtonYayinla_Click(object sender, EventArgs e)
    {
        baglanti.Close();
        baglanti.Open();

        string query = "SELECT kategoriID FROM kategoriler WHERE kategoriAdi = @kategoriAdi";

        using (MySqlCommand command = new MySqlCommand(query, baglanti))
        {
            command.Parameters.AddWithValue("@kategoriAdi", Session["icerikKategoriTutucu"]);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                {
                    string kategoriID = reader["kategoriID"].ToString();

                    Session["icerikKategoriTutucu"] = kategoriID;
                }
            }
        }
        MySqlCommand cmd = new MySqlCommand("insert into icerikler(icerigiYayinlayanKisi,tarih,icerikkapakResmi,icerikBaslik,icerikKategori,icerikAciklamasi,icerikVideoDosyasi,goruntulenme)values(@icerigiYayinlayanKisi,@tarih,@icerikkapakResmi,@icerikBaslik,@icerikKategori,@icerikAciklamasi,@icerikVideoDosyasi,@goruntulenme)", baglanti);
        cmd.Parameters.AddWithValue("@icerigiYayinlayanKisi", Session["kullaniciID"].ToString());
        cmd.Parameters.AddWithValue("@tarih", TextBoxTarih.Text);
        cmd.Parameters.AddWithValue("@icerikkapakResmi", Session["icerikResmiTutucu"].ToString());
        cmd.Parameters.AddWithValue("@icerikBaslik", Session["icerikBaslikTutucu"].ToString());
        cmd.Parameters.AddWithValue("@icerikKategori", Session["icerikKategoriTutucu"].ToString());
        cmd.Parameters.AddWithValue("@icerikAciklamasi", TextBoxAciklama.Text = Session["icerikAciklamaTutucu"].ToString());
        cmd.Parameters.AddWithValue("@icerikVideoDosyasi", Session["icerikVideosuTutucu"]);
        cmd.Parameters.AddWithValue("@goruntulenme", "0");
        cmd.ExecuteNonQuery();
        baglanti.Close();

        string kaynakKlasorYolu = Server.MapPath("~/admin/geciciUpload/");
        string hedefKlasorYolu = Server.MapPath("~/upload/");

        string[] hedefDosyalar = { Session["icerikResmiTutucu"].ToString(), Session["icerikVideosuTutucu"].ToString() };

        foreach (string dosyaAdi in hedefDosyalar)
        {
            string kaynakDosyaYolu = Path.Combine(kaynakKlasorYolu, dosyaAdi);
            string hedefDosyaYolu = Path.Combine(hedefKlasorYolu, dosyaAdi);

            if (File.Exists(kaynakDosyaYolu))
            {
                File.Copy(kaynakDosyaYolu, hedefDosyaYolu, true);
                File.Delete(kaynakDosyaYolu);
            }
        }

        string[] kalanDosyalar = Directory.GetFiles(kaynakKlasorYolu);
        foreach (string dosya in kalanDosyalar)
        {
            File.Delete(dosya);
        }

        Session["icerikBaslikTutucu"] = null;
        Session["icerikKategoriTutucu"] = null;
        Session["icerikAciklamaTutucu"] = null;
        Session["icerikResmiTutucu"] = null;
        Session["icerikVideosuTutucu"] = null;

        Response.Redirect("icerikler.aspx");
    }
}