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


public partial class kategori_detay : System.Web.UI.Page
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
    public void yukle()
    {
        if (!IsPostBack)
        {
            string kategoriID = Request.QueryString["kategoriID"];
            if (!string.IsNullOrEmpty(kategoriID))
            {
                string query = "SELECT i.*, k.*, kategori.* " +
                               "FROM icerikler i " +
                               "INNER JOIN kullanicilar k ON i.icerigiYayinlayanKisi = k.kullaniciID " +
                               "INNER JOIN kategoriler kategori ON kategori.kategoriID = i.icerikKategori " +
                               "WHERE icerikKategori = @ID";

                using (MySqlConnection baglanti = new MySqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, baglanti))
                    {
                        cmd.Parameters.AddWithValue("@ID", kategoriID);

                        using (MySqlDataAdapter adapter = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                Repeater1.DataSource = dt;
                                Repeater1.DataBind();
                                Label1.Text = dt.Rows[0]["kategoriAdi"].ToString();
                            }
                            else
                            {
                                nullContent.Style["display"] = "flex";
                            }
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("~/");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        yukle();
    }
}