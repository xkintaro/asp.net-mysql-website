using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_icerik_ekle_part_3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["icerikBaslikTutucu"] == null || Session["icerikKategoriTutucu"] == null || Session["icerikAciklamaTutucu"] == null || Session["icerikResmiTutucu"] == null)
        {
            Response.Redirect("~/admin/icerik-ekle-part-1.aspx");
        }
        if (Session["icerikVideosuTutucu"] != null)
        {
            FileUploadVideo.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
        }
    }
    protected void ButtonOnceki_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/icerik-ekle-part-2.aspx");
    }
    protected void ButtonSonraki_Click(object sender, EventArgs e)
    {
        if (FileUploadVideo.FileName != "")
        {
            FileUploadVideo.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
            string icerikkapakResmi = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + FileUploadVideo.FileName;
            FileUploadVideo.SaveAs(Path.Combine(Server.MapPath("~/admin/geciciUpload"), icerikkapakResmi));
            Session["icerikVideosuTutucu"] =  icerikkapakResmi;
            Response.Redirect("~/admin/icerik-ekle-part-4.aspx");
        }
        else
        {
            FileUploadVideo.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            if (Session["icerikVideosuTutucu"] != null)
            {
                FileUploadVideo.Style["box-shadow"] = "1px 1px 0.7cap 1px green";
                Response.Redirect("~/admin/icerik-ekle-part-4.aspx");
            }
            else
            {
                FileUploadVideo.Style["box-shadow"] = "1px 1px 0.7cap 1px red";
            }
        }
        if (Session["icerikVideosuTutucu"] != null)
        {
            Response.Redirect("~/admin/icerik-ekle-part-4.aspx");
        }
    }
}