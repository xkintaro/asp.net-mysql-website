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

public partial class admin_icerikler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        yukle();
        yukleCount();
        Session["icerikBaslikTutucu"] = null;
        Session["icerikKategoriTutucu"] = null;
        Session["icerikAciklamaTutucu"] = null;
        Session["icerikResmiTutucu"] = null;
        Session["icerikVideosuTutucu"] = null;
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
    public void yukle()
    {
        baglanti.Close();
        baglanti.Open();
        MySqlDataAdapter cmd = new MySqlDataAdapter("select * from icerikler ORDER BY icerikno DESC", baglanti);
        DataTable dt = new DataTable();
        cmd.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        baglanti.Close();
        if (dt.Rows.Count > 0)
        {
            nullContent.Style["display"] = "none";
        }
        else
        {
            nullContent.Style["display"] = "flex";
        }
    }
    protected void yukleCount()
    {
        baglanti.Close();
        baglanti.Open();
        string sqlSorgu = "SELECT COUNT(*) FROM icerikler";
        MySqlCommand cmd = new MySqlCommand(sqlSorgu, baglanti);
        MySqlDataAdapter liste = new MySqlDataAdapter(cmd);
        int mesajSayisi = Convert.ToInt32(cmd.ExecuteScalar());
        labelCount.Text = mesajSayisi.ToString();
        baglanti.Close();
    }
    protected void TextBoxicerikAra_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(TextBoxicerikAra.Text))
        {
            string arananKelime = TextBoxicerikAra.Text.Trim();
            string query = "select * from icerikler WHERE icerikBaslik LIKE @arananKelime ORDER BY icerikno DESC ";
            baglanti.Close();
            baglanti.Open();
            MySqlCommand command = new MySqlCommand(query, baglanti);
            command.Parameters.AddWithValue("@arananKelime", "%" + arananKelime + "%");
            MySqlDataAdapter adapter = new MySqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            baglanti.Close();
            if (dt.Rows.Count > 0)
            {
                Repeater1.Visible = true;
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                sonucbulunamadi.Style["display"] = "none";
            }
            else
            {
                Repeater1.Visible = false;
                sonucbulunamadi.Style["display"] = "flex";
            }
        }
        else
        {
            Repeater1.Visible = true;
            sonucbulunamadi.Style["display"] = "none";
            yukle();
        }
    }
}