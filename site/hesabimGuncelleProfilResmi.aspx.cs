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
public partial class hesabimGuncelleProfilResmi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        if (Session["KullaniciAdi"] == null)
        {
            Response.Redirect("kullaniciGiris.aspx");
        }
    }
    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    protected void ButtonIptal_Click(object sender, EventArgs e)
    {
        Response.Redirect("hesabim.aspx");
    }
    protected void ButtonKaydet_Click(object sender, EventArgs e)
    {
        if (FileUploadProfilResmi.HasFile == true)
        {
            Session["yuklenecekProfil"] = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + FileUploadProfilResmi.FileName;
            baglanti.Close();
            baglanti.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE kullanicilar SET kullaniciProfilResmi=@kullaniciProfilResmi WHERE kullaniciID=@kullaniciID", baglanti);
            cmd.Parameters.AddWithValue("@kullaniciProfilResmi", Session["yuklenecekProfil"].ToString());
            cmd.Parameters.AddWithValue("@kullaniciID", Session["kullaniciID"].ToString());
            cmd.ExecuteNonQuery();
            baglanti.Close();
            FileUploadProfilResmi.SaveAs(Path.Combine(Server.MapPath("~/upload"), Session["yuklenecekProfil"].ToString()));
            Session["kullaniciProfilResmi"] = Session["yuklenecekProfil"];
            Session["yuklenecekProfil"] = null;
            LabelDurum.Text = "Profil resminiz başarıyla güncellendi.";
            LabelDurum.ForeColor = System.Drawing.Color.Green;
            Response.Redirect("hesabim.aspx");
        }
        else
        {
            LabelDurum.Text = "Lütfen bir profil resmi seçiniz.";
            LabelDurum.ForeColor = System.Drawing.Color.Red;
        }
    }
}