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

public partial class admin_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        if (Session["kullaniciID"] != null)
        {
            bool varmi = false;
            baglanti.Close();
            baglanti.Open();
            MySqlCommand liste = new MySqlCommand("select * from kullanicilar where kullaniciID = @ID", baglanti);
            liste.Parameters.AddWithValue("@ID", Session["kullaniciID"]);
            MySqlDataReader oku = liste.ExecuteReader();
            while (oku.Read())
            {
                string yetki = oku["kullaniciTur"].ToString();

                if (yetki == "admin")
                {
                    varmi = true;
                    break;
                }
            }
            baglanti.Close();
            if (varmi != true)
            {
                Response.Redirect("~/kullaniciGiris.aspx");
            }
        }
        else
        {
            Response.Redirect("~/kullaniciGiris.aspx");
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
}
