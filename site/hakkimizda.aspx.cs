using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
public partial class hakkimizda : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        conn();
    }
    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBoxKadi.Text == "" || TextBoxEposta.Text == "" || TextBoxMesaj.Text == "")
        {
            kintaroSystemMessageContainerContactForm.Style["display"] = "block";
            labeldurum.Text = "Lütfen gerekli olan tüm boşlukları doldurunuz.";
        }
        else
        {
            baglanti.Close();
            baglanti.Open();
            MySqlCommand cmd = new MySqlCommand("insert into mesajlar(kadi,eposta,mesaj,tarih)values(@kadi,@eposta,@mesaj,@tarih)", baglanti);
            cmd.Parameters.AddWithValue("@kadi", TextBoxKadi.Text);
            cmd.Parameters.AddWithValue("@eposta", TextBoxEposta.Text);
            cmd.Parameters.AddWithValue("@mesaj", TextBoxMesaj.Text);
            cmd.Parameters.AddWithValue("@tarih", DateTime.Now);
            cmd.ExecuteNonQuery();
            baglanti.Close();
            kintaroSystemMessageContainerContactForm.Style["display"] = "block";
            labeldurum.Text = "Mesajınız sisteme gönderildi.";
            TextBoxKadi.Text = "";
            TextBoxEposta.Text = "";
            TextBoxMesaj.Text = "";
        }
    }
    protected void kintaroSystemMessageContainerClose1_Click(object sender, EventArgs e)
    {
        kintaroSystemMessageContainerContactForm.Style["display"] = "none";
    }
    protected void kintaroSystemMessageContainerClose2_Click(object sender, EventArgs e)
    {
        kintaroSystemMessageContainerContactForm.Style["display"] = "none";
    }
}
