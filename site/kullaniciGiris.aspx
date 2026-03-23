<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="kullaniciGiris.aspx.cs" Inherits="kullaniciGiris" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <div class="kintaro-container display-Flex flexDirection-Column gap-5 w12">
        <div class="kintaro-row w12 justifyContent-SpaceBetween light form display-Flex">
            <div class="kintaro-column w4 block">
                <div class="kintaro-column w12">
                    <img src="assets/images/assets/logo.png" class="logo" />
                </div>
                <div class="kintaro-column w12">
                    <h1 class="title">Kullanıcı Giriş.</h1>
                </div>
            </div>
            <div class="kintaro-column w6 block">
                <div class="kintaro-column w12">
                    <div class="kintaro-combined-input-layout">
                        <label class="kintaro-combined-input-label dark">Kullanıcı Adı</label>
                        <asp:TextBox AutoComplete="off" ID="TextBoxKullaniciAdi" CssClass="kintaro-combined-input-textbox dark"
                            runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="kintaro-column w12">
                    <div class="kintaro-combined-input-layout">
                        <label class="kintaro-combined-input-label dark">Şifre</label>
                        <asp:TextBox TextMode="password" AutoComplete="off" CssClass="kintaro-combined-input-textbox dark" ID="TextBoxSifre" runat="server">
                        </asp:TextBox>
                    </div>
                </div>
                <div class="kintaro-column w12">
                    <asp:Label ID="LabelDurum" runat="server" Text=""></asp:Label>
                </div>
                <div class="kintaro-row w12 justifyContent-Right display-Flex">
                    <div class="kintaro-column">
                        <asp:Button ID="ButtonSonraki" CssClass="kintaro-button dark w100" runat="server" Text="Giriş yap"
                            OnClick="ButtonSonraki_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="kintaro-column w12">
            <asp:Button ID="ButtonKayit" CssClass="kintaro-button light w100" runat="server" Text="Hesap Oluştur!"
                OnClick="ButtonKayit_Click" />
        </div>
    </div>
</asp:Content>

