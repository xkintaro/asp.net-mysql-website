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
public partial class admin_kategori_ekle : System.Web.UI.Page
{
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
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (TextBoxKategori.Text == "")
            {
                LabelDurum.Text = "Kategori adı giriniz.";
                TextBoxKategori.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                LabelDurum.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                bool zatenVarmi = false;
                baglanti.Close();
                baglanti.Open();
                MySqlCommand liste = new MySqlCommand("select * from kategoriler", baglanti);
                MySqlDataReader oku = liste.ExecuteReader();
                while (oku.Read())
                {
                    string zatenVarmiKontrol = oku["kategoriAdi"].ToString();
                    if (TextBoxKategori.Text == zatenVarmiKontrol)
                    {
                        zatenVarmi = true;
                        baglanti.Close();
                        break;
                    }
                }
                if (zatenVarmi == true)
                {
                    TextBoxKategori.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
                    LabelDurum.Text = "Kategori zaten mevcut.";
                    LabelDurum.ForeColor = System.Drawing.Color.Red;
                    baglanti.Close();
                }
                else
                {
                    baglanti.Close();
                    baglanti.Open();
                    MySqlCommand cmd = new MySqlCommand("insert into kategoriler(kategoriAdi)values(@kategoriAdi)", baglanti);
                    cmd.Parameters.AddWithValue("@kategoriAdi", TextBoxKategori.Text);
                    cmd.ExecuteNonQuery();
                    baglanti.Close();
                    LabelDurum.Text = "Kategori kaydedildi.";
                    LabelDurum.ForeColor = System.Drawing.Color.Green;
                    TextBoxKategori.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
                    TextBoxKategori.Text = "";
                }
            }
        }
        catch
        {
            LabelDurum.Text = "Beklenmeyen bir hata meydana geldi.";
            LabelDurum.ForeColor = System.Drawing.Color.Red;
        }
    }
}