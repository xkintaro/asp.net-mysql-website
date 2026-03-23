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
public partial class hesabim : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["KullaniciAdi"] == null)
        {
            Response.Redirect("kullaniciGiris.aspx");
        }
        if (!IsPostBack)
        {
            LabelKullaniciAdi.Text = Session["kullaniciAdi"].ToString();
            TextBoxBiografi.Text = Session["kullaniciBiografi"].ToString();
            Image1.ImageUrl = "upload/" + Session["kullaniciProfilResmi"].ToString();
        }
        conn();
    }

    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    protected void TextBoxBiografi_TextChanged(object sender, EventArgs e)
    {
        if (TextBoxBiografi.Text != Session["kullaniciBiografi"].ToString())
        {
            baglanti.Close();
            baglanti.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE kullanicilar SET kullaniciBiografi=@kullaniciBiografi WHERE kullaniciID=@kullaniciID", baglanti);
            cmd.Parameters.AddWithValue("@kullaniciBiografi", TextBoxBiografi.Text);
            cmd.Parameters.AddWithValue("@kullaniciID", Session["kullaniciID"].ToString());
            cmd.ExecuteNonQuery();
            baglanti.Close();
            Session["kullaniciBiografi"] = TextBoxBiografi.Text;
            kintaroSystemMessageContainerBiografi.Style["display"] = "block";
            LabelDurumBio.Text = "Biografiniz başarıyla güncellendi.";
        }
    }
    protected void kintaroSystemMessageContainerClose1_Click(object sender, EventArgs e)
    {
        kintaroSystemMessageContainerBiografi.Style["display"] = "none";
    }
    protected void kintaroSystemMessageContainerClose2_Click(object sender, EventArgs e)
    {
        kintaroSystemMessageContainerBiografi.Style["display"] = "none";
    }
    protected void ButtonGuncelleKullaniciAdi_Click(object sender, EventArgs e)
    {
        Response.Redirect("hesabimGuncelleKullaniciAdi.aspx");
    }
    protected void ButtonGuncelleEposta_Click(object sender, EventArgs e)
    {
        Response.Redirect("hesabimGuncelleEposta.aspx");
    }
    protected void ButtonGuncelleSifre_Click(object sender, EventArgs e)
    {
        Response.Redirect("hesabimGuncelleSifre.aspx");
    }
}
