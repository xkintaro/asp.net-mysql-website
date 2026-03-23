<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true"
    CodeFile="kullaniciKayitSifre.aspx.cs" Inherits="kullaniciKayitSifre" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
        <div class="kintaro-container display-Flex flexDirection-Column gap-5 w12">
            <div class="kintaro-row w12 justifyContent-SpaceBetween light form display-Flex">
                <div class="kintaro-column w4 block">
                    <div class="kintaro-column w12">
                        <img src="assets/images/assets/logo.png" class="logo" />
                    </div>
                    <div class="kintaro-column w12 block">
                        <h1 class="title">Şifrenizi belirleyiniz.</h1>
                    </div>
                </div>
                <div class="kintaro-column w6 block">
                    <div class="kintaro-column w12">
                        <div class="kintaro-combined-input-layout">
                            <label class="kintaro-combined-input-label dark">Şifre</label>
                            <asp:TextBox TextMode="password" AutoComplete="off"
                                CssClass="kintaro-combined-input-textbox dark" ID="TextBoxSifre" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="kintaro-column w12">
                        <div class="kintaro-combined-input-layout">
                            <label class="kintaro-combined-input-label dark">Şifre Tekrar</label>
                            <asp:TextBox TextMode="password" AutoComplete="off"
                                CssClass="kintaro-combined-input-textbox dark" ID="TextBoxSifreTekrar" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="kintaro-column w12">
                        <asp:Label ID="LabelDurum" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="kintaro-column w12">
                        <div class="kintaro-row justifyContent-Right display-Flex gap-10">
                            <div class="kintaro-column marginY-5 ">
                                <asp:Button ID="ButtonOnceki" CssClass="kintaro-button dark w100" runat="server"
                                    Text="Önceki" OnClick="ButtonOnceki_Click" />
                            </div>
                            <div class="kintaro-column marginY-5 ">
                                <asp:Button ID="ButtonSonraki" CssClass="kintaro-button dark w100" runat="server"
                                    Text="Sonraki" OnClick="ButtonSonraki_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>