<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="icerik-guncelle-baslik.aspx.cs" Inherits="admin_icerik_guncelle_baslik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kintaro-column">
        <h1 class="title">İçerik Düzenle</h1>
    </div>
    <div class="kintaro-column display-Block marginY-50">
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label dark">Başlık</label>
                <asp:TextBox AutoComplete="off" ID="TextBoxBaslik" CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
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
