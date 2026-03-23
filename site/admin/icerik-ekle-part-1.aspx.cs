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

public partial class admin_icerik_ekle_part_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conn();
        if (!IsPostBack)
        {
            yukle();
            if (Session["icerikBaslikTutucu"] != null && Session["icerikKategoriTutucu"] != null && Session["icerikAciklamaTutucu"] != null)
            {
                TextBoxBaslik.Text = Session["icerikBaslikTutucu"].ToString();
                DropDownListKategori.Text = Session["icerikKategoriTutucu"].ToString();
                TextBoxAciklama.Text = Session["icerikAciklamaTutucu"].ToString();
                TextBoxBaslik.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
                DropDownListKategori.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
                TextBoxAciklama.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
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
    public void yukle()
    {
        baglanti.Close();
        baglanti.Open();
        MySqlDataAdapter cmd = new MySqlDataAdapter("select * from kategoriler", baglanti);
        DataTable dt = new DataTable();
        cmd.Fill(dt);
        DropDownListKategori.DataSource = dt;
        DropDownListKategori.DataBind();
        baglanti.Close();
    }

    protected void ButtonSonraki_Click(object sender, EventArgs e)
    {
        if (TextBoxBaslik.Text != "" && DropDownListKategori.SelectedIndex != 0 && TextBoxAciklama.Text != "")
        {
            TextBoxBaslik.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            DropDownListKategori.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            TextBoxAciklama.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            Session["icerikBaslikTutucu"] = TextBoxBaslik.Text;
            Session["icerikKategoriTutucu"] = DropDownListKategori.Text;
            Session["icerikAciklamaTutucu"] = TextBoxAciklama.Text;
            Response.Redirect("~/admin/icerik-ekle-part-2.aspx");
        }
        else
        {
            TextBoxBaslik.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            DropDownListKategori.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            TextBoxAciklama.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            if (TextBoxBaslik.Text != "")
            {
                TextBoxBaslik.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            }
            else
            {
                TextBoxBaslik.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            }
            if (DropDownListKategori.SelectedIndex != 0)
            {
                DropDownListKategori.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            }
            else
            {
                DropDownListKategori.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            }
            if (TextBoxAciklama.Text != "")
            {
                TextBoxAciklama.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            }
            else
            {
                TextBoxAciklama.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            }
        }
    }

    protected void ButtonIptal_Click(object sender, EventArgs e)
    {
        Session["icerikBaslikTutucu"] = null;
        Session["icerikKategoriTutucu"] = null;
        Session["icerikAciklamaTutucu"] = null;
        Session["icerikResmiTutucu"] = null;
        Session["icerikVideosuTutucu"] = null;
        Response.Redirect("~/admin/icerikler.aspx");
    }
}
