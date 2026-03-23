<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true"
    CodeFile="hesabimGuncelleKullaniciAdi.aspx.cs" Inherits="hesabimGuncelleKullaniciAdi" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
        <div class="kintaro-container display-Flex flexDirection-Column gap-5 w12">
            <div class="kintaro-row w12 justifyContent-SpaceBetween light form display-Flex">
                <div class="kintaro-column w4 display-Block">
                    <div class="kintaro-column w12">
                        <h1 class="title marginY-10">Yeni kullanıcı adı.</h1>
                    </div>
                </div>
                <div class="kintaro-column w6 block">
                    <div class="kintaro-column w12">
                        <div class="kintaro-combined-input-layout">
                            <label class="kintaro-combined-input-label dark">Yeni Kullanıcı Adı</label>
                            <asp:TextBox AutoComplete="off" CssClass="kintaro-combined-input-textbox dark"
                                ID="TextBoxKullaniciAdi" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="kintaro-column w12">
                        <asp:Label ID="LabelDurum" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="kintaro-column w12">
                        <div class="kintaro-row display-Flex justifyContent-Right gap-10">
                            <div class="kintaro-column marginY-5 ">
                                <asp:Button ID="ButtonIptal" CssClass="kintaro-button dark w100" runat="server"
                                    Text="İptal" OnClick="ButtonIptal_Click" />
                            </div>
                            <div class="kintaro-column marginY-5 ">
                                <asp:Button ID="ButtonKaydet" CssClass="kintaro-button dark w100" runat="server"
                                    Text="Kaydet" OnClick="ButtonKaydet_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>