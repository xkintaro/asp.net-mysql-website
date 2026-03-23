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
public partial class icerik_detay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        conn();
        yukleDetaySayfasi();

        yukleYorumlar();
        YukleYorumSayisi();
        yukleMyComments();
        favorilerKontrol();
        ButtondahafazlaFilmGosterButtonKontrol();
        ButtondahafazlaYorumGosterButtonKontrol();
              if (!IsPostBack)
        {
            Labelgoruntulenme.Text = (Convert.ToInt32(Labelgoruntulenme.Text) + 1).ToString();
            baglanti.Close();
            baglanti.Open();
            MySqlCommand command = new MySqlCommand("UPDATE icerikler SET goruntulenme=@goruntulenme WHERE icerikno=@icerikno", baglanti);
            command.Parameters.AddWithValue("@goruntulenme", Labelgoruntulenme.Text);
            command.Parameters.AddWithValue("@icerikno", Session["icerikno"]);
            command.ExecuteNonQuery();
            baglanti.Close();
        }
        yuklefilmler();
        ButtondahafazlaFilmGosterButtonKontrol();
    }
    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    public void yukleDetaySayfasi()
    {
        string urunID = Request.QueryString["icerikno"];
        if (!string.IsNullOrEmpty(urunID))
        {
            baglanti.Close();
            baglanti.Open();
            string query = "select i.*, k.*, kategori.* " +
                        "from icerikler i " +
                         "inner join kullanicilar k on i.icerigiYayinlayanKisi = k.kullaniciID " +
                          "inner join kategoriler kategori on kategori.kategoriID = i.icerikKategori " +
                         "WHERE icerikno = @ID";
            using (MySqlCommand command = new MySqlCommand(query, baglanti))
            {
                command.Parameters.AddWithValue("@ID", urunID);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string icerikno = reader["icerikno"].ToString();
                        string icerigiYayinlayanKisiID = reader["icerigiYayinlayanKisi"].ToString();
                        string icerigiYayinlayanKisiAdi = reader["kullaniciAdi"].ToString();
                        string icerikkapakResmi = reader["icerikkapakResmi"].ToString();
                        string icerikBaslik = reader["icerikBaslik"].ToString();
                        string tarih = reader["tarih"].ToString();
                        string icerikAciklamasi = reader["icerikAciklamasi"].ToString();
                        string icerikKategori = reader["kategoriAdi"].ToString();
                        string icerikKategoriID = reader["kategoriID"].ToString();
                        string icerikVideoDosyasi = reader["icerikVideoDosyasi"].ToString();
                        string icerikGoruntulenme = reader["goruntulenme"].ToString();
                        LabelicerikBaslik.Text = icerikBaslik;
                        Labeltarih.Text = tarih;
                        LabelicerikAciklamasi.Text = icerikAciklamasi;
                        LabelicerikKategori.Text = icerikKategori;
                        LabelicerigiYayinlayanKisi.Text = icerigiYayinlayanKisiAdi;
                        Labelgoruntulenme.Text = icerikGoruntulenme;
                        Session["kategoriID"] = icerikKategoriID;
                        Session["icerikkapakResmi"] = "/upload/" + icerikkapakResmi;
                        Session["icerikno"] = icerikno;
                        Session["icerikBaslik"] = icerikBaslik;
                        Session["video"] = "/upload/" + icerikVideoDosyasi;
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
    protected void ButtondahafazlaFilmGosterButtonKontrol()
    {
        baglanti.Close();
        baglanti.Open();
        string sqlSorgu = "SELECT COUNT(*) FROM icerikler ";
        MySqlCommand cmd = new MySqlCommand(sqlSorgu, baglanti);
        MySqlDataAdapter liste = new MySqlDataAdapter(cmd);
        int mesajSayisi = Convert.ToInt32(cmd.ExecuteScalar());
        baglanti.Close();
        if (Convert.ToInt32(Session["yuklenenIcerikMaxValue"]) >= Convert.ToInt32(mesajSayisi))
        {
            ButtondahafazlaFilmGoster.Visible = true;
        }
    }
    protected void ButtondahafazlaFilmGoster_Click(object sender, EventArgs e)
    {
        int currentValue = Convert.ToInt32(Session["yuklenenIcerikMaxValue"]);
        Session["yuklenenIcerikMaxValue"] = currentValue + 12;
        yuklefilmler();
        ButtondahafazlaFilmGosterButtonKontrol();
    }
    public void yuklefilmler()
    {
        if (!IsPostBack)
        {
            Session["yuklenenIcerikMinValue"] = "0";
            Session["yuklenenIcerikMaxValue"] = "4";
        }
        int minLimit = Convert.ToInt32(Session["yuklenenIcerikMinValue"]);
        int maxLimit = Convert.ToInt32(Session["yuklenenIcerikMaxValue"]);
        baglanti.Close();
        baglanti.Open();
        string query = "select i.*, k.* " +
        "from icerikler i " +
        "inner join kullanicilar k on i.icerigiYayinlayanKisi = k.kullaniciID " +
        "ORDER BY icerikno DESC " +
        "LIMIT @yuklenenIcerikMinValue, @yuklenenIcerikMaxValue";
        MySqlCommand command = new MySqlCommand(query, baglanti);
        command.Parameters.AddWithValue("@yuklenenIcerikMinValue", minLimit);
        command.Parameters.AddWithValue("@yuklenenIcerikMaxValue", maxLimit);
        MySqlDataAdapter liste = new MySqlDataAdapter(command);
        DataTable dt = new DataTable();
        liste.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        baglanti.Close();
    }
    protected void ButtondahafazlaYorumGosterButtonKontrol()
    {
        baglanti.Close();
        baglanti.Open();
        string sqlSorgu = "SELECT COUNT(*) FROM yorumlar where yorumHangiIcerigeAitID=@yorumHangiIcerigeAitID";
        MySqlCommand cmd = new MySqlCommand(sqlSorgu, baglanti);
        cmd.Parameters.AddWithValue("@yorumHangiIcerigeAitID", Session["icerikno"]);
        MySqlDataAdapter liste = new MySqlDataAdapter(cmd);
        int yorumSayisi = Convert.ToInt32(cmd.ExecuteScalar());
        baglanti.Close();
        if (Convert.ToInt32(Session["yuklenenYorumMaxValue"]) >= Convert.ToInt32(yorumSayisi))
        {
            Buttondahafazlayorum.Visible = false;
        }
    }
    protected void Buttondahafazlayorum_Click(object sender, EventArgs e)
    {
        int currentValue = Convert.ToInt32(Session["yuklenenYorumMaxValue"]);
        Session["yuklenenYorumMaxValue"] = currentValue + 12;
        yukleYorumlar();
        ButtondahafazlaYorumGosterButtonKontrol();
    }
    public void yukleYorumlar()
    {
        if (!IsPostBack)
        {
            Session["yuklenenYorumMinValue"] = "0";
            Session["yuklenenYorumMaxValue"] = "12";
        }

        int minLimit = Convert.ToInt32(Session["yuklenenYorumMinValue"]);
        int maxLimit = Convert.ToInt32(Session["yuklenenYorumMaxValue"]);

        if (Session["kullaniciID"] == null)
        {
            baglanti.Close();
            baglanti.Open();
            string sqlQuery = "SELECT yorum.*, kullanici.* " +
                             "FROM yorumlar AS yorum " +
                             "JOIN kullanicilar AS kullanici ON yorum.yorumHangiKullaniciyaAitID = kullanici.kullaniciID " +
                             "JOIN icerikler AS icerik ON yorum.yorumHangiIcerigeAitID = icerik.icerikno " +
                             "WHERE yorum.yorumHangiIcerigeAitID = @icerikno " +
                             "ORDER BY yorum.yorumID DESC LIMIT @yuklenenIcerikMinValue, @yuklenenIcerikMaxValue";
            MySqlCommand command = new MySqlCommand(sqlQuery, baglanti);
            command.Parameters.AddWithValue("@icerikno", Session["icerikno"]);
            command.Parameters.AddWithValue("@yuklenenIcerikMinValue", minLimit);
            command.Parameters.AddWithValue("@yuklenenIcerikMaxValue", maxLimit);
            MySqlDataAdapter liste = new MySqlDataAdapter(command);
            DataTable dt = new DataTable();
            liste.Fill(dt);
            Repeater2.DataSource = dt;
            Repeater2.DataBind();
            baglanti.Close();
        }
        else
        {
            baglanti.Close();
            baglanti.Open();
            string sqlQuery = "SELECT yorum.*, kullanici.* " +
                              "FROM yorumlar AS yorum " +
                              "JOIN kullanicilar AS kullanici ON yorum.yorumHangiKullaniciyaAitID = kullanici.kullaniciID " +
                              "JOIN icerikler AS icerik ON yorum.yorumHangiIcerigeAitID = icerik.icerikno " +
                              "WHERE yorum.yorumHangiIcerigeAitID = @icerikno " +
                              "AND yorum.yorumHangiKullaniciyaAitID != @kullaniciID " +
                              "ORDER BY yorum.yorumID DESC LIMIT @yuklenenIcerikMinValue, @yuklenenIcerikMaxValue";
            MySqlCommand command = new MySqlCommand(sqlQuery, baglanti);
            command.Parameters.AddWithValue("@icerikno", Session["icerikno"]);
            command.Parameters.AddWithValue("@kullaniciID", Session["kullaniciID"]);
            command.Parameters.AddWithValue("@yuklenenIcerikMinValue", minLimit);
            command.Parameters.AddWithValue("@yuklenenIcerikMaxValue", maxLimit);
            MySqlDataAdapter liste = new MySqlDataAdapter(command);
            DataTable dt = new DataTable();
            liste.Fill(dt);
            Repeater2.DataSource = dt;
            Repeater2.DataBind();
            baglanti.Close();
        }
    }
    public void yukleMyComments()
    {
        baglanti.Close();
        baglanti.Open();
        string sqlQuery = "SELECT yorum.*, kullanici.* " +
                         "FROM yorumlar AS yorum " +
                         "JOIN kullanicilar AS kullanici ON yorum.yorumHangiKullaniciyaAitID = kullanici.kullaniciID " +
                         "JOIN icerikler AS icerik ON yorum.yorumHangiIcerigeAitID = icerik.icerikno " +
                         "WHERE yorum.yorumHangiIcerigeAitID = @icerikno AND yorum.yorumHangiKullaniciyaAitID = @kullaniciID " +
                         "ORDER BY yorum.yorumID DESC";
        MySqlCommand command = new MySqlCommand(sqlQuery, baglanti);
        command.Parameters.AddWithValue("@icerikno", Session["icerikno"]);
        command.Parameters.AddWithValue("@kullaniciID", Session["kullaniciID"]);
        MySqlDataAdapter listeaaa = new MySqlDataAdapter(command);
        DataTable dt = new DataTable();
        listeaaa.Fill(dt);
        RepeaterMyComments.DataSource = dt;
        RepeaterMyComments.DataBind();
        baglanti.Close();
    }
    protected void YukleYorumSayisi()
    {
        baglanti.Close();
        baglanti.Open();
        string sqlSorgu = "SELECT COUNT(*) FROM yorumlar where yorumHangiIcerigeAitID=@yorumHangiIcerigeAitID";
        MySqlCommand cmd = new MySqlCommand(sqlSorgu, baglanti);
        cmd.Parameters.AddWithValue("@yorumHangiIcerigeAitID", Session["icerikno"]);
        MySqlDataAdapter liste = new MySqlDataAdapter(cmd);
        int mesajSayisi = Convert.ToInt32(cmd.ExecuteScalar());
        Labelyorumsayisi.Text = mesajSayisi.ToString();
        baglanti.Close();
    }
    protected void ButtonYorumuGonder_Click(object sender, EventArgs e)
    {
        if (Session["kullaniciAdi"] == null)
        {
            TextBoxyorumyaz.Text = "";
            girisyap.Style["display"] = "flex";
        }
        else
        {
            if (!string.IsNullOrEmpty(TextBoxyorumyaz.Text))
            {
                using (baglanti)
                {
                    baglanti.Open();
                    MySqlCommand ekle = new MySqlCommand("insert into yorumlar(yorumHangiKullaniciyaAitID,yorumHangiIcerigeAitID,yorummetni,tarih) values(@yorumHangiKullaniciyaAitID,@yorumHangiIcerigeAitID,@yorummetni,@tarih)", baglanti);
                    ekle.Parameters.AddWithValue("@yorumHangiKullaniciyaAitID", Session["kullaniciID"].ToString());
                    ekle.Parameters.AddWithValue("@yorumHangiIcerigeAitID", Session["icerikno"].ToString());
                    ekle.Parameters.AddWithValue("@yorummetni", TextBoxyorumyaz.Text);
                    ekle.Parameters.AddWithValue("@tarih", DateTime.Now.ToString("dd.MM.yyyy HH:mm"));
                    ekle.ExecuteNonQuery();
                    TextBoxyorumyaz.Text = "";
                    YukleYorumSayisi();
                    yukleYorumlar();
                    yukleMyComments();
                }
            }
        }
    }
    protected void ButtonUpdateComment_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string yorumID = btn.CommandArgument;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        TextBox textBoxYorumGuncelle = (TextBox)item.FindControl("TextBoxYorumGuncelle");
        string yeniYorumMetni = textBoxYorumGuncelle.Text;
        baglanti.Close();
        baglanti.Open();
        MySqlCommand command = new MySqlCommand("UPDATE yorumlar SET yorummetni=@yeniYorumMetni WHERE yorumID=@yorumID", baglanti);
        command.Parameters.AddWithValue("@yeniYorumMetni", yeniYorumMetni);
        command.Parameters.AddWithValue("@yorumID", yorumID);
        command.ExecuteNonQuery();
        baglanti.Close();
        yukleMyComments();
        YukleYorumSayisi();
    }
    protected void ButtonDeleteComment_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string yorumID = btn.CommandArgument;
        baglanti.Close();
        baglanti.Open();
        MySqlCommand command = new MySqlCommand("DELETE FROM yorumlar WHERE yorumID = @yorumID", baglanti);
        command.Parameters.AddWithValue("@yorumID", yorumID);
        command.ExecuteNonQuery();
        baglanti.Close();
        yukleMyComments();
        YukleYorumSayisi();
    }
    public void favorilerKontrol()
    {
        if (Session["KullaniciAdi"] != null)
        {
            bool varmi = false;
            baglanti.Close();
            baglanti.Open();
            MySqlCommand liste = new MySqlCommand("SELECT favoriyeEklenenIcerikID FROM favoriler WHERE favoriyeEkleyenKisiID = @favoriyeEkleyenKisiID", baglanti);
            liste.Parameters.AddWithValue("@favoriyeEklenenIcerikID", Session["icerikno"]);
            liste.Parameters.AddWithValue("@favoriyeEkleyenKisiID", Session["kullaniciID"]);

            MySqlDataReader oku = liste.ExecuteReader();
            while (oku.Read())
            {
                if (Session["icerikno"].ToString() == oku["favoriyeEklenenIcerikID"].ToString())
                {
                    varmi = true;
                    break;
                }
            }
            baglanti.Close();
            if (varmi == true)
            {
                Session["favoriKontrol"] = "true";
                ButtonFavorilereEkle.Text = "Favorilerden Çıkar";
            }
            else
            {
                Session["favoriKontrol"] = "false";
            }
        }
    }
    protected void ButtonFavorilereEkle_Click(object sender, EventArgs e)
    {
        if (Session["KullaniciAdi"] != null)
        {
            if (Session["favoriKontrol"].ToString() == "false")
            {
                baglanti.Close();
                baglanti.Open();
                MySqlCommand ekle = new MySqlCommand("insert into favoriler(favoriyeEkleyenKisiID,favoriyeEklenenIcerikID) values(@favoriyeEkleyenKisiID,@favoriyeEklenenIcerikID)", baglanti);
                ekle.Parameters.AddWithValue("@favoriyeEkleyenKisiID", Session["kullaniciID"].ToString());
                ekle.Parameters.AddWithValue("@favoriyeEklenenIcerikID", Session["icerikno"].ToString());
                ekle.ExecuteNonQuery();
                baglanti.Close();
                Label1.Text = "Favorilere eklendi.";
                ButtonFavorilereEkle.Text = "Favorilerden Çıkar";
                favori.Style["display"] = "flex";
            }
            else if (Session["favoriKontrol"].ToString() == "true")
            {
                baglanti.Close();
                baglanti.Open();
                MySqlCommand commandsil = new MySqlCommand("DELETE FROM favoriler WHERE favoriyeEkleyenKisiID = @favoriyeEkleyenKisiID AND favoriyeEklenenIcerikID = @favoriyeEklenenIcerikID", baglanti);
                commandsil.Parameters.AddWithValue("@favoriyeEkleyenKisiID", Session["kullaniciID"]);
                commandsil.Parameters.AddWithValue("@favoriyeEklenenIcerikID", Session["icerikno"]);
                commandsil.ExecuteNonQuery();
                Label1.Text = "Favorilerden çıkartıldı.";
                ButtonFavorilereEkle.Text = "Favorilere Ekle";
                favori.Style["display"] = "flex";
            }
        }
        else
        {
            favori.Style["display"] = "flex";
            Label1.Text = "Bu özelliği kullanabilmek için oturum açınız.";
        }
    }
    protected void kintaroSystemMessageContainerClose1_Click(object sender, EventArgs e)
    {
        girisyap.Style["display"] = "none";
    }
    protected void kintaroSystemMessageContainerClose2_Click(object sender, EventArgs e)
    {
        girisyap.Style["display"] = "none";
    }
    protected void kintaroSystemMessageContainerClose3_Click(object sender, EventArgs e)
    {
        favori.Style["display"] = "none";
    }
    protected void kintaroSystemMessageContainerClose4_Click(object sender, EventArgs e)
    {
        favori.Style["display"] = "none";
    }
}