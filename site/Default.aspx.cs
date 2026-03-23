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
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        conn();
        yukle();
        ButtondahafazlaFilmGosterButtonKontrol();
    }
    MySqlConnection baglanti;
    public void conn()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
        baglanti = new MySqlConnection(connectionString);
    }
    public void yukle()
    {
        if (!IsPostBack)
        {
            Session["yuklenenIcerikMinValue"] = "0";
            Session["yuklenenIcerikMaxValue"] = "20";
        }
        int minLimit = Convert.ToInt32(Session["yuklenenIcerikMinValue"]);
        int maxLimit = Convert.ToInt32(Session["yuklenenIcerikMaxValue"]);
        baglanti.Close();
        baglanti.Open();
        string query = "select i.*, k.* " +
        "from icerikler i " +
        "inner join kullanicilar k on i.icerigiYayinlayanKisi = k.kullaniciID " +
        "ORDER BY icerikno DESC " +
        "LIMIT @yuklenenIcerikMinValue, @yuklenenIcerikMaxValue";
        MySqlCommand command = new MySqlCommand(query, baglanti);
        command.Parameters.AddWithValue("@yuklenenIcerikMinValue", minLimit);
        command.Parameters.AddWithValue("@yuklenenIcerikMaxValue", maxLimit);
        MySqlDataAdapter liste = new MySqlDataAdapter(command);
        DataTable dt = new DataTable();
        liste.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        baglanti.Close();
    }
    protected void ButtondahafazlaFilmGosterButtonKontrol()
    {
        baglanti.Close();
        baglanti.Open();
        string sqlSorgu = "SELECT COUNT(*) FROM icerikler ";
        MySqlCommand cmd = new MySqlCommand(sqlSorgu, baglanti);
        MySqlDataAdapter liste = new MySqlDataAdapter(cmd);
        int mesajSayisi = Convert.ToInt32(cmd.ExecuteScalar());
        baglanti.Close();
        if (Convert.ToInt32(Session["yuklenenIcerikMaxValue"]) >= Convert.ToInt32(mesajSayisi))
        {
            ButtondahafazlaFilmGoster.Visible = false;
        }
    }
    protected void ButtondahafazlaFilmGoster_Click(object sender, EventArgs e)
    {
        int currentValue = Convert.ToInt32(Session["yuklenenIcerikMaxValue"]);
        Session["yuklenenIcerikMaxValue"] = currentValue + 12;
        yukle();
        ButtondahafazlaFilmGosterButtonKontrol();
    }
    protected void TextBoxicerikAra_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(TextBoxicerikAra.Text))
        {
            string arananKelime = TextBoxicerikAra.Text.Trim();
            string query = "select i.*, k.* " +
              "from icerikler i " +
              "inner join kullanicilar k on i.icerigiYayinlayanKisi = k.kullaniciID " +
              "WHERE icerikBaslik LIKE @arananKelime " +
              "ORDER BY icerikno DESC ";
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
                filmmesaj.Style["display"] = "none";
            }
            else
            {
                Repeater1.Visible = false;
                Labelaramadurum.Text = "sonuç bulunamadı.";
                filmmesaj.Style["display"] = "flex";
            }
        }
        else
        {
            Repeater1.Visible = true;
            Labelaramadurum.Text = "";
            filmmesaj.Style["display"] = "none";
            yukle();
        }
    }
}