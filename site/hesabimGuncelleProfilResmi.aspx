<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="hesabimGuncelleProfilResmi.aspx.cs" Inherits="hesabimGuncelleProfilResmi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <div class="kintaro-container display-Flex flexDirection-Column gap-5 w12">
        <div class="kintaro-row w12 justifyContent-SpaceBetween light form display-Flex">
            <div class="kintaro-column w4 block">
                <div class="kintaro-column w12 marginY-5">
                    <h1 class="title">Yeni profil resmi.</h1>
                </div>
            </div>
            <div class="kintaro-column w6 display-Flex flexDirection-Column gap-10">
                <div class="kintaro-column w12">
                    <asp:FileUpload Accept=".jpg,.jpeg,.png,.gif,.webp" ID="FileUploadProfilResmi" CssClass="kintaro-file" runat="server" />
                </div>
                <div class="kintaro-column w12">
                    <asp:Label ID="LabelDurum" runat="server" Text=""></asp:Label>
                </div>
                <div class="kintaro-column w12">
                    <div class="kintaro-row justifyContent-Right display-Flex gap-10">
                        <div class="kintaro-column marginY-5 ">
                            <asp:Button ID="ButtonIptal" CssClass="kintaro-button w100 dark" runat="server" Text="İptal" OnClick="ButtonIptal_Click" />
                        </div>
                        <div class="kintaro-column marginY-5 ">
                            <asp:Button ID="ButtonKaydet" CssClass="kintaro-button w100 dark" runat="server" Text="Kaydet" OnClick="ButtonKaydet_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
