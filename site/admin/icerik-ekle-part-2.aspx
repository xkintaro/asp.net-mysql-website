<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="icerik-ekle-part-2.aspx.cs" Inherits="admin_icerik_ekle_part_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kintaro-column">
        <h1 class="title">İçerik Ekle</h1>
    </div>
    <div class="kintaro-column  marginY-20">
        <div class="kintaro-column form dark ">
            <div class="kintaro-column">
                <h2 class="title">İçerik Resmi</h2>
            </div>
            <div class="kintaro-column marginY-10 display-Flex  flexDirection-Column gap-10">
                <asp:FileUpload ID="FileUploadResim" Accept=".jpg,.jpeg,.png,.gif,.webp" CssClass="kintaro-file light" runat="server" />
            </div>
        </div>
        <div class="kintaro-row marginY-10 display-Flex gap-10 w12 ">
            <div class="kintaro-column marginY-10 display-Flex w4 flexDirection-Column gap-10">
                <asp:Image ID="Image1" runat="server" CssClass="borderRadius-10 w12" ImageUrl="" />
            </div>
        </div>
    </div>
    <div class="kintaro-column display-Flex justifyContent-Right gap-10">
        <div class="kintaro-column">
            <asp:Button ID="ButtonOnceki" CssClass="kintaro-button dark" runat="server" Text="Önceki" OnClick="ButtonOnceki_Click" />
        </div>
        <div class="kintaro-column">
            <asp:Button ID="ButtonSonraki" CssClass="kintaro-button dark" runat="server" Text="Sonraki" OnClick="ButtonSonraki_Click" />
        </div>
    </div>
    <div class="kintaro-column display-Flex marginY-10">
        <asp:Label ID="LabelDurum" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
