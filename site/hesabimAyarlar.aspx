<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="hesabimAyarlar.aspx.cs"
    Inherits="hesabimAyarlar" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
        <div class="container">
            <div class="kintaro-container ">
                <div class="kintaro-row w12 display-Flex justifyContent-Center">
                    <div class="kintaro-column w6  display-Block light form">
                        <div class="kintaro-column  Ycenter">
                            <h1 class="title">Ayarlar</h1>
                        </div>
                        <div class="kintaro-row justifyContent-Center alignItems-Center display-Flex gap-10 ">
                            <div class="kintaro-column w10">
                                <div class="kintaro-combined-input-layout">
                                    <label class="kintaro-combined-input-label dark">Kullanıcı Adı</label>
                                    <asp:TextBox CssClass="kintaro-combined-input-textbox dark" Enabled="false"
                                        ID="TextBoxKullaniciAdi" runat="server">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="kintaro-column ">
                                <asp:Button ID="ButtonGuncelleKullaniciAdi"
                                    CssClass="kintaro-combined-input-button dark w100" runat="server" Text="Düzenle"
                                    OnClick="ButtonGuncelleKullaniciAdi_Click" />
                            </div>
                        </div>
                        <div class="kintaro-row justifyContent-Center alignItems-Center display-Flex gap-10">
                            <div class="kintaro-column w10 Ycenter">
                                <div class="kintaro-combined-input-layout">
                                    <label class="kintaro-combined-input-label dark">Şifre</label>
                                    <asp:TextBox TextMode="Password" CssClass="kintaro-combined-input-textbox dark "
                                        Enabled="false" ID="TextBoxSifre" runat="server">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="kintaro-column  Ycenter">
                                <asp:Button ID="ButtonGuncelleSifre" CssClass="kintaro-combined-input-button dark w100"
                                    runat="server" Text="Düzenle" OnClick="ButtonGuncelleSifre_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>