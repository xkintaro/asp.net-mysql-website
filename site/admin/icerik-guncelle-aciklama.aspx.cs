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
public partial class admin_icerik_guncelle_aciklama : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        if (!IsPostBack)
        {
            string urunID = Request.QueryString["icerikno"];
            if (!string.IsNullOrEmpty(urunID))
            {
                baglanti.Close();
                baglanti.Open();
                string query = "SELECT  * FROM icerikler WHERE icerikno = @ID";
                using (MySqlCommand command = new MySqlCommand(query, baglanti))
                {
                    command.Parameters.AddWithValue("@ID", urunID);
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["x"] = reader["icerikAciklamasi"].ToString();
                            TextBoxBaslik.Text = Session["x"].ToString();
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
    protected void ButtonIptal_Click(object sender, EventArgs e)
    {
        string urunID = Request.QueryString["icerikno"];
        Response.Redirect("icerik-detay.aspx?icerikno=" + urunID);
    }
    protected void ButtonSonraki_Click(object sender, EventArgs e)
    {
        if (TextBoxBaslik.Text != Session["x"].ToString())
        {
            if (TextBoxBaslik.Text != "")
            {
                baglanti.Close();
                baglanti.Open();
                string urunID = Request.QueryString["icerikno"];
                MySqlCommand cmd = new MySqlCommand("UPDATE icerikler SET icerikAciklamasi=@icerikAciklamasi WHERE icerikno=@id", baglanti);
                cmd.Parameters.AddWithValue("@icerikAciklamasi", TextBoxBaslik.Text);
                cmd.Parameters.AddWithValue("@id", urunID);
                cmd.ExecuteNonQuery();
                baglanti.Close();
                Session["x"] = null;
                Response.Redirect("icerik-detay.aspx?icerikno=" + urunID);
            }
            else
            {
                TextBoxBaslik.Style["border"] = "1px solid red";
            }
        }
    }
}