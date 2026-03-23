<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="hakkimizda.aspx.cs"
    Inherits="hakkimizda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <!-- SİSTEM MESAJI CONTACT FORM -->
    <div class="kintaro-system-message-container" id="kintaroSystemMessageContainerContactForm" runat="server">
        <div class="kintaro-system-message-box">
            <div class="kintaro-column w12 justifyContent-Right display-Flex">
                <asp:Button ID="kintaroSystemMessageContainerClose1" runat="server" CssClass="kintaro-close-button"
                    Text="+" OnClick="kintaroSystemMessageContainerClose1_Click" />
            </div>
            <div class="kintaro-column marginY-20">
                <p class="text">
                    <asp:Label ID="labeldurum" runat="server" Text=""></asp:Label>
                </p>
            </div>
            <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                <asp:Button ID="kintaroSystemMessageContainerClose2" CssClass="kintaro-button dark"
                    runat="server" Text="Tamam" OnClick="kintaroSystemMessageContainerClose2_Click" />
            </div>
        </div>
    </div>
    <!-- SİSTEM MESAJI CONTACT FORM END -->
    <div class="kintaro-container">
        <div class="kintaro-column w12 form light display-Flex flexDirection-Column gap-5">
            <h1 class="title">Hakkımızda</h1>
            <p>
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Beatae
                    pariatur, corporis vitae id
                    nesciunt consectetur quis optio eos similique necessitatibus ionem? Quaerat sunt
                    quidem dolore sit dicta magnam consectetur sequi. Lorem ipsum, dolor sit amet consectetur
                    adipisicing elit. Ipsa illum fugit laborum doloremque nam nobis excepturi facere illo
                    eveniet in quasi repudiandae aliquam beatae pariatur dolor nemo, ab, odit odio.
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Beatae
                    pariatur, corporis vitae id
                    nesciunt consectetur quis optio eos similique necessitatibus ionem? Quaerat sunt
                    quidem dolore sit dicta magnam consectetur sequi. Lorem ipsum, dolor sit amet consectetur
                    adipisicing elit. Ipsa illum fugit laborum doloremque nam nobis excepturi facere illo
                    eveniet in quasi repudiandae aliquam beatae pariatur dolor nemo, ab, odit odio.
            </p>
            <div class="kintaro-column display-Flex gap-5">
                <a href="https://www.instagram.com">
                    <img src="assets/images/assets/instagram.png" class="icon" />
                </a>
                <a href="https://discord.com">
                    <img src="assets/images/assets/discord.png" class="icon" />
                </a>
                <a href="https://www.google.com/intl/tr/gmail/about/">
                    <img src="assets/images/assets/gmail.png" class="icon" />
                </a>
            </div>
        </div>
    </div>
    <div class="kintaro-container marginY-10">
        <div class="kintaro-column w12 block form light" id="contact-form">
            <div class="kintaro-column w12 center">
                <h1 class="title">Bize Yazın</h1>
            </div>
            <div class="kintaro-column w12">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label dark">Adınız</label>
                    <asp:TextBox AutoComplete="off" ID="TextBoxKadi" CssClass="kintaro-combined-input-textbox dark"
                        runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column w12">
                <div class="kintaro-combined-input-layout ">
                    <label class="kintaro-combined-input-label dark">Eposta</label>
                    <asp:TextBox AutoComplete="off" ID="TextBoxEposta"
                        CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column w12">
                <div class="kintaro-combined-input-layout" style="height: 150px;">
                    <label class="kintaro-combined-input-label dark">Mesajınız</label>
                    <asp:TextBox AutoComplete="off" TextMode="MultiLine" ID="TextBoxMesaj"
                        CssClass="kintaro-combined-input-textbox dark" runat="server" Style="padding-top: 20px;">
                    </asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column w12">
                <asp:Button ID="Button1" runat="server" CssClass="kintaro-button dark" Text="Gönder"
                    OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
