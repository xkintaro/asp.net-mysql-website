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
public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        yukleCount();
        yukleKullanicilar();
        yukleMesajlar();
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
    public void yukleKullanicilar()
    {
        baglanti.Close();
        baglanti.Open();
        string query = "SELECT * FROM kullanicilar ORDER BY tarih DESC LIMIT 0, 3";
        MySqlCommand command = new MySqlCommand(query, baglanti);
        MySqlDataAdapter liste = new MySqlDataAdapter(command);
        DataTable dt = new DataTable();
        liste.Fill(dt);
        Repeaterkullanici.DataSource = dt;
        Repeaterkullanici.DataBind();
        baglanti.Close();
        if (dt.Rows.Count == 0)
        {
            kullaniciyok.Style["display"] = "flex";
        }
    }
    public void yukleMesajlar()
    {
        baglanti.Close();
        baglanti.Open();
        string query = "SELECT * FROM mesajlar ORDER BY id DESC LIMIT 0, 3";
        MySqlCommand command = new MySqlCommand(query, baglanti);
        MySqlDataAdapter liste = new MySqlDataAdapter(command);
        DataTable dt = new DataTable();
        liste.Fill(dt);
        Repeatermesaj.DataSource = dt;
        Repeatermesaj.DataBind();
        baglanti.Close();
        if (dt.Rows.Count == 0)
        {
            mesajyok.Style["display"] = "flex";
        }
    }
    protected void yukleCount()
    {
        baglanti.Close();
        baglanti.Open();
        string icerikler = "SELECT COUNT(*) FROM icerikler";
        MySqlCommand cmd = new MySqlCommand(icerikler, baglanti);
        MySqlDataAdapter liste = new MySqlDataAdapter(cmd);
        int icerikSayisi = Convert.ToInt32(cmd.ExecuteScalar());
        Labelicerik.Text = icerikSayisi.ToString();
        baglanti.Close();

        baglanti.Close();
        baglanti.Open();
        string kategoriler = "SELECT COUNT(*) FROM kategoriler";
        MySqlCommand cmd2 = new MySqlCommand(kategoriler, baglanti);
        MySqlDataAdapter liste2 = new MySqlDataAdapter(cmd2);
        int kategoriSayisi = Convert.ToInt32(cmd2.ExecuteScalar());
        Labelkategori.Text = kategoriSayisi.ToString();
        baglanti.Close();

        baglanti.Close();
        baglanti.Open();
        string kullanicilar = "SELECT COUNT(*) FROM kullanicilar";
        MySqlCommand cmd3 = new MySqlCommand(kullanicilar, baglanti);
        MySqlDataAdapter liste3 = new MySqlDataAdapter(cmd3);
        int kullaniciSayisi = Convert.ToInt32(cmd3.ExecuteScalar());
        Labelkullanici.Text = kullaniciSayisi.ToString();
        baglanti.Close();

        baglanti.Close();
        baglanti.Open();
        string mesajlar = "SELECT COUNT(*) FROM mesajlar";
        MySqlCommand cmd4 = new MySqlCommand(mesajlar, baglanti);
        MySqlDataAdapter liste4 = new MySqlDataAdapter(cmd4);
        int mesajSayisi = Convert.ToInt32(cmd4.ExecuteScalar());
        Labelmesaj.Text = mesajSayisi.ToString();
        baglanti.Close();
    }
}