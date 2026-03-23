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

public partial class kategoriler : System.Web.UI.Page
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
        baglanti.Close();
        baglanti.Open();
        MySqlDataAdapter cmd = new MySqlDataAdapter("select * from kategoriler", baglanti);
        DataTable dt = new DataTable();
        cmd.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        baglanti.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        yukle();
    }
}