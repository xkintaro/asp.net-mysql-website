<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="hesabim.aspx.cs"
    Inherits="hesabim" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
        <!-- SİSTEM MESAJI BİOGRAFİ -->
        <div class="kintaro-system-message-container" id="kintaroSystemMessageContainerBiografi" runat="server">
            <div class="kintaro-system-message-box">
                <div class="kintaro-column w12 justifyContent-Right display-Flex">
                    <asp:Button ID="kintaroSystemMessageContainerClose1" runat="server" CssClass="kintaro-close-button"
                        Text="+" OnClick="kintaroSystemMessageContainerClose1_Click" />
                </div>
                <div class="kintaro-column marginY-20">
                    <p class="text">
                        <asp:Label ID="LabelDurumBio" runat="server" CssClass="labeldurumbio" Text=""></asp:Label>
                    </p>
                </div>
                <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                    <asp:Button ID="kintaroSystemMessageContainerClose2" CssClass="kintaro-button dark" runat="server"
                        Text="Tamam" OnClick="kintaroSystemMessageContainerClose2_Click" />
                </div>
            </div>
        </div>
        <!-- SİSTEM MESAJI BİOGRAFİ END -->
        <div class="kintaro-container">
            <div class="kintaro-row display-Flex justifyContent-Center">
                <div class="kintaro-column w6 display-Flex flexDirection-Column gap-10 form light">
                    <div class="kintaro-column w12 display-Flex justifyContent-Center">
                        <div class="account-header-profile">
                            <a href="hesabimGuncelleProfilResmi.aspx">
                                <img class="account-header-proile-image-edit-icon" src="assets/images/assets/upload.png"
                                    title="yeni profil resmi" />
                            </a>
                            <asp:Image CssClass="account-header-proile-image" ID="Image1" runat="server" />
                        </div>
                    </div>
                    <div class="kintaro-column w12 display-Flex justifyContent-Center">
                        <h1 class="title">
                            <asp:Label ID="LabelKullaniciAdi" runat="server" Text="Label"></asp:Label>
                        </h1>
                    </div>
                    <div class="kintaro-column w12 display-Flex justifyContent-Center">
                        <div class="kintaro-combined-input-layout" style="height: 150px;">
                            <label class="kintaro-combined-input-label dark ">biografi</label>
                            <asp:TextBox CssClass="kintaro-combined-input-textbox dark" ID="TextBoxBiografi"
                                Style="padding-top: 20px;" TextMode="MultiLine"
                                runat="server" AutoPostBack="true" OnTextChanged="TextBoxBiografi_TextChanged">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>