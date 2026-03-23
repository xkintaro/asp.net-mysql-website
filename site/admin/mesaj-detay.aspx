<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="mesaj-detay.aspx.cs" Inherits="admin_mesaj_detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- SİSTEM MESAJI KATEGORİ SİL -->
    <div class="kintaro-system-message-container" id="message" runat="server">
        <div class="kintaro-system-message-box">
            <div class="kintaro-column w12 justifyContent-Right display-Flex">
                <asp:Button ID="ButtonClose" CssClass="kintaro-close-button" runat="server" Text="+" OnClick="ButtonClose_Click" />
            </div>
            <div class="kintaro-column marginY-20">
                <p class="text">Mesajı silmek istediğinize emin misiniz?</p>
            </div>
            <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                <asp:Button ID="ButtonIptal" CssClass="kintaro-button red" runat="server" Text="İptal" OnClick="ButtonIptal_Click" />
                <asp:Button ID="ButtonSil" runat="server" CssClass="kintaro-button darkGreen" Text="Sil" OnClick="ButtonSil_Click" />
            </div>
        </div>
    </div>
    <!-- SİSTEM MESAJI KATEGORİ SİL END -->
    <div class="kintaro-column">
        <h1 class="title">Mesaj Detay</h1>
    </div>
    <div class="kintaro-column w12 form dark marginY-20">
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label light">Ad & Soyad</label>
                <asp:TextBox CssClass="kintaro-combined-input-textbox light" Enabled="false" ID="TextBoxAd"
                    runat="server">
                </asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label light">Eposta</label>
                <asp:TextBox CssClass="kintaro-combined-input-textbox light" Enabled="false" ID="TextBoxEposta"
                    runat="server">
                </asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout" style="height: 150px;">
                <label class="kintaro-combined-input-label light">Mesaj</label>
                <asp:TextBox CssClass="kintaro-combined-input-textbox light" Style="padding-top: 20px;" TextMode="MultiLine" Enabled="false" ID="TextBoxMesaj"
                    runat="server">
                </asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column w12 display-Flex justifyContent-Right">
            <asp:Button ID="ButtonSilBox" runat="server" CssClass="kintaro-button light" Text="Sil" OnClick="ButtonSilBox_Click" />
        </div>
    </div>
</asp:Content>

