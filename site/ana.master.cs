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
public partial class ana : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["kullaniciAdi"] != null)
        {
            navbarUser.Style["display"] = "inline-block";
            navbarUserNull.Style["display"] = "none";
            LabelKullaniciAdiHeader.Text = Session["kullaniciAdi"].ToString();
            ImageUserProfile.ImageUrl = "upload/" + Session["kullaniciProfilResmi"].ToString();
            conn();
            adminKontrol();
        }
        else
        {
            navbarUser.Style["display"] = "none";
            navbarUserNull.Style["display"] = "block";
            LabelKullaniciAdiHeader.Text = "Hesabım";
            ImageUserProfile.ImageUrl = "upload/default/user.png";
        }
    }
    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    public void adminKontrol()
    {
        if (Session["KullaniciAdi"] != null)
        {
            baglanti.Close();
            baglanti.Open();
            string query = "SELECT  * FROM kullanicilar WHERE KullaniciID = @ID";
            using (MySqlCommand command = new MySqlCommand(query, baglanti))
            {
                command.Parameters.AddWithValue("@ID", Session["KullaniciID"]);
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string yetki = reader["kullaniciTur"].ToString();
                        if (yetki == "admin")
                        {
                            adminButton.Style["display"] = "flex";
                        }
                        else
                        {
                            adminButton.Style["display"] = "none";
                        }
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
