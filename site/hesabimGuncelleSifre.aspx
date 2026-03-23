<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true"
    CodeFile="hesabimGuncelleSifre.aspx.cs" Inherits="hesabimGuncelleSifre" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
        <div class="kintaro-container display-Flex flexDirection-Column gap-5 w12">
            <div class="kintaro-row w12 justifyContent-SpaceBetween light form display-Flex">
                <div class="kintaro-column w4 display-Block">
                    <div class="kintaro-column w12">
                        <h1 class="title marginY-5">Yeni şifre.</h1>
                    </div>
                </div>
                <div class="kintaro-column w6 block">
                    <div class="kintaro-column w12">
                        <div class="kintaro-combined-input-layout">
                            <label class="kintaro-combined-input-label dark">Yeni Şifre</label>
                            <asp:TextBox AutoComplete="off" TextMode="Password"
                                CssClass="kintaro-combined-input-textbox dark" ID="TextBoxSifre" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="kintaro-column w12">
                        <div class="kintaro-combined-input-layout">
                            <label class="kintaro-combined-input-label dark">Yeni Şifre Tekrar</label>
                            <asp:TextBox AutoComplete="off" TextMode="Password"
                                CssClass="kintaro-combined-input-textbox dark" ID="TextBoxSifreTekrar" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="kintaro-column">
                        <asp:Label ID="LabelDurum" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="kintaro-row display-Flex justifyContent-Right gap-10">
                        <div class="kintaro-column marginY-5">
                            <asp:Button ID="ButtonIptal" CssClass="kintaro-button dark w100" runat="server" Text="İptal"
                                OnClick="ButtonIptal_Click" />
                        </div>
                        <div class="kintaro-column marginY-5">
                            <asp:Button ID="ButtonKaydet" CssClass="kintaro-button dark w100" runat="server"
                                Text="Kaydet" OnClick="ButtonKaydet_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>