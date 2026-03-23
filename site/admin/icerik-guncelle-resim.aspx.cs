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

public partial class admin_icerik_guncelle_resim : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
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
        string urunID = Request.QueryString["icerikno"];
        if (FileUploadResim.FileName != "")
        {
            FileUploadResim.Style["border"] = "1px solid green";
            string icerikkapakResmi = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + FileUploadResim.FileName;
            FileUploadResim.SaveAs(Path.Combine(Server.MapPath("~/upload"), icerikkapakResmi));
            baglanti.Close();
            baglanti.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE icerikler SET icerikKapakResmi=@icerikKapakResmi WHERE icerikno=@id", baglanti);
            cmd.Parameters.AddWithValue("@icerikKapakResmi", icerikkapakResmi);
            cmd.Parameters.AddWithValue("@id", urunID);
            cmd.ExecuteNonQuery();
            baglanti.Close();
            Session["x"] = null;
            Response.Redirect("icerik-detay.aspx?icerikno=" + urunID);
        }
        else
        {
            FileUploadResim.Style["border"] = "1px solid red";
        }
    }
}