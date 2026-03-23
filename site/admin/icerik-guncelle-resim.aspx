<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="icerik-guncelle-resim.aspx.cs" Inherits="admin_icerik_guncelle_resim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kintaro-column">
        <h1 class="title">İçerik Düzenle</h1>
    </div>
    <div class="kintaro-column display-Block marginY-50">
        <div class="kintaro-column  marginY-20">
            <div class="kintaro-column form dark ">
                <div class="kintaro-column">
                    <h2 class="title">İçerik Resmi</h2>
                </div>
                <div class="kintaro-column marginY-10 display-Flex  flexDirection-Column gap-10">
                    <asp:FileUpload ID="FileUploadResim" Accept=".jpg,.jpeg,.png,.gif,.webp" CssClass="kintaro-file light" runat="server" />
                </div>
            </div>
        </div>
        <div class="kintaro-column display-Flex justifyContent-Right gap-10">
            <div class="kintaro-column">
                <asp:Button ID="ButtonIptal" CssClass="kintaro-button dark" runat="server" Text="İptal" OnClick="ButtonIptal_Click" />
            </div>
            <div class="kintaro-column">
                <asp:Button ID="ButtonSonraki" CssClass="kintaro-button dark" runat="server" Text="Kaydet" OnClick="ButtonSonraki_Click" />
            </div>
        </div>
    </div>
</asp:Content>
