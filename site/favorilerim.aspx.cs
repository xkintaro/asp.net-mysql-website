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
using System.Drawing;
public partial class favorilerim : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["KullaniciAdi"] == null)
        {
            Response.Redirect("kullaniciGiris.aspx");
        }
        conn();
        yukle();
    }
    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    public void yukle()
    {
        baglanti.Close();
        baglanti.Open();
        string query = "SELECT icerik.*, kullanici.*, kategori.*, favori.* " +
        "FROM favoriler favori " +
         "INNER JOIN icerikler icerik ON favori.favoriyeEklenenIcerikID = icerik.icerikno " +
        "INNER JOIN kullanicilar kullanici ON icerik.icerigiYayinlayanKisi = kullanici.kullaniciID " +
        "INNER JOIN kategoriler kategori ON kategori.kategoriID = icerik.icerikKategori " +
        "WHERE favori.favoriyeEkleyenKisiID = @ID " +
        "ORDER BY favori.favoriID DESC"; ;
        MySqlCommand command = new MySqlCommand(query, baglanti);
        command.Parameters.AddWithValue("@ID", Session["kullaniciID"]);
        MySqlDataAdapter liste = new MySqlDataAdapter(command);
        DataTable dt = new DataTable();
        liste.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        baglanti.Close();
        if (dt.Rows.Count == 0)
        {
            LabelDurum.Text = "Favorilere ekli içerik yok.";
            filmmesaj.Style["display"] = "flex";
        }
    }
}