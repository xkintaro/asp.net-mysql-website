<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="icerik-ekle-part-1.aspx.cs" Inherits="admin_icerik_ekle_part_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kintaro-column">
        <h1 class="title">İçerik Ekle</h1>
    </div>
    <div class="kintaro-column display-Block marginY-50">
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label dark">Başlık</label>
                <asp:TextBox AutoComplete="off" ID="TextBoxBaslik" CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label dark">Kategori</label>
                <asp:DropDownList CssClass="kintaro-combined-input-textbox dark" ID="DropDownListKategori" runat="server" DataTextField="kategoriAdi"></asp:DropDownList>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout" style="height: 150px;">
                <label class="kintaro-combined-input-label dark">Açıklama</label>
                <asp:TextBox ID="TextBoxAciklama" TextMode="MultiLine" CssClass="kintaro-combined-input-textbox dark paddingY-20" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column display-Flex justifyContent-Right gap-10">
            <div class="kintaro-column">
                <asp:Button ID="ButtonIptal" CssClass="kintaro-button dark" runat="server" Text="İptal" OnClick="ButtonIptal_Click" />
            </div>
            <div class="kintaro-column">
                <asp:Button ID="ButtonSonraki" CssClass="kintaro-button dark" runat="server" Text="Sonraki" OnClick="ButtonSonraki_Click" />
            </div>
        </div>
    </div>
</asp:Content>
