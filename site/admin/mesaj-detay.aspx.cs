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
public partial class admin_mesaj_detay : System.Web.UI.Page
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
        string urunID = Request.QueryString["id"];
        if (!string.IsNullOrEmpty(urunID))
        {
            baglanti.Close();
            baglanti.Open();
            string query = "select * from mesajlar where id=@ID";
            using (MySqlCommand command = new MySqlCommand(query, baglanti))
            {
                command.Parameters.AddWithValue("@ID", urunID);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string kadi = reader["kadi"].ToString();
                        string eposta = reader["eposta"].ToString();
                        string mesaj = reader["mesaj"].ToString();
                        TextBoxAd.Text = kadi;
                        TextBoxEposta.Text = eposta;
                        TextBoxMesaj.Text = mesaj;
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

    protected void ButtonSil_Click(object sender, EventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string mesajId = Request.QueryString["id"];
        MySqlCommand command = new MySqlCommand("DELETE FROM mesajlar WHERE id = @MesajId", baglanti);
        command.Parameters.AddWithValue("@MesajId", mesajId);
        command.ExecuteNonQuery();
        baglanti.Close();
        Response.Redirect("mesajlar.aspx");
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