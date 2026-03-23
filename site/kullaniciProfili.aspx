<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="kullaniciProfili.aspx.cs" Inherits="kullaniciProfili" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <div class="kintaro-container">
        <div class="kintaro-row display-Flex justifyContent-Center">
            <div class="kintaro-column w6 display-Flex flexDirection-Column gap-10 form light">
                <div class="kintaro-column w12 display-Flex justifyContent-Center">
                    <div class="account-header-profile">
                        <asp:Image CssClass="account-header-proile-image" ID="Image1" runat="server" />
                    </div>
                </div>
                <div class="kintaro-column w12 display-Flex justifyContent-Center">
                    <h1 class="title">
                        <asp:Label ID="LabelKullaniciAdi" runat="server" Text="Label"></asp:Label>
                    </h1>
                </div>
                <div class="kintaro-column  w12 Xcenter">
                    <div class="kintaro-combined-input-layout" style="height: 150px;">
                        <label class="kintaro-combined-input-label dark">biografi</label>
                        <asp:TextBox CssClass="kintaro-combined-input-textbox dark" Enabled="false" ID="TextBoxBiografi" Style="padding-top: 20px; border: 0.7px solid hsl(210, 100%, 25%);"
                            TextMode="MultiLine" runat="server" AutoPostBack="true">
                        </asp:TextBox>
                    </div>
                </div>
            </div>
            </div>
        </div>
</asp:Content>

