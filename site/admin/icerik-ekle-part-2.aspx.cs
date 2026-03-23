using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_icerik_ekle_part_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["icerikBaslikTutucu"] == null || Session["icerikKategoriTutucu"] == null || Session["icerikAciklamaTutucu"] == null)
        {
            Response.Redirect("~/admin/icerik-ekle-part-1.aspx");
        }
        if (Session["icerikResmiTutucu"] != null)
        {
            FileUploadResim.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            Image1.ImageUrl = "geciciUpload/" + Session["icerikResmiTutucu"].ToString();
        }
    }
    protected void ButtonOnceki_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/icerik-ekle-part-1.aspx");
    }
    protected void ButtonSonraki_Click(object sender, EventArgs e)
    {
        if (FileUploadResim.FileName != "")
        {
            FileUploadResim.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            string icerikkapakResmi = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + FileUploadResim.FileName;
            FileUploadResim.SaveAs(Path.Combine(Server.MapPath("~/admin/geciciUpload"), icerikkapakResmi));
            Session["icerikResmiTutucu"] = icerikkapakResmi;
            Image1.ImageUrl = "geciciUpload/" + Session["icerikResmiTutucu"].ToString();
            Response.Redirect("~/admin/icerik-ekle-part-3.aspx");
        }
        else
        {
            FileUploadResim.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            if (Session["icerikResmiTutucu"] != null)
            {
                FileUploadResim.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
                Image1.ImageUrl = "geciciUpload/" + Session["icerikResmiTutucu"].ToString();
                if (Session["icerikResmiTutucu"] != null)
                {
                    Response.Redirect("~/admin/icerik-ekle-part-3.aspx");
                }
            }
            else
            {
                FileUploadResim.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            }
        }
        if (Session["icerikResmiTutucu"] != null)
        {
            Response.Redirect("~/admin/icerik-ekle-part-3.aspx");
        }
    }
}
