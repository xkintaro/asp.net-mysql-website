<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="icerik-detay.aspx.cs" Inherits="admin_icerik_detay" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <style>
            .max {
                height: 500px;
            }

            .video {
                background-color: #000;
            }
        </style>
        <!-- SİSTEM MESAJI KATEGORİ SİL -->
        <div class="kintaro-system-message-container" id="message" runat="server">
            <div class="kintaro-system-message-box">
                <div class="kintaro-column w12 justifyContent-Right display-Flex">
                    <asp:Button ID="ButtonClose" CssClass="kintaro-close-button" runat="server" Text="+"
                        OnClick="ButtonClose_Click" />
                </div>
                <div class="kintaro-column marginY-20">
                    <p class="text">Bu içeriği silmek istediğinize emin misiniz?</p>
                </div>
                <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                    <asp:Button ID="ButtonIptal" CssClass="kintaro-button red" runat="server" Text="İptal"
                        OnClick="ButtonIptal_Click" />
                    <asp:Button ID="ButtonSil" runat="server" CssClass="kintaro-button darkGreen" Text="Sil"
                        OnClick="ButtonSil_Click" />
                </div>
            </div>
        </div>
        <!-- SİSTEM MESAJI KATEGORİ SİL END -->
        <div class="kintaro-column">
            <h1 class="title">İçerik Detay</h1>
        </div>
        <div class="kintaro-column display-Flex justifyContent-Right alignItems-Center marginY-10 ">
            <asp:ImageButton ID="ButtonSilBox" OnClick="ButtonSilBox_Click" runat="server"
                ImageUrl="../assets/images/assets/delete.png" />
        </div>
        <div class="kintaro-column display-Block marginY-40 ">
            <div class="kintaro-column w12">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label dark">Yayınlayan</label>
                    <asp:TextBox AutoComplete="off" ID="TextBoxuploader" Enabled="false"
                        CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column w12 marginY-25"></div>
            <div class="kintaro-column w12">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label dark">Tarih</label>
                    <asp:TextBox AutoComplete="off" ID="TextBoxTarih" Enabled="false"
                        CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="kintaro-row display-Flex w12 gap-10 ">
                <div class="kintaro-column w6 marginY-10 display-Flex flexDirection-Column gap-10 form dark">
                    <asp:Image ID="Image1" CssClass="max borderRadius-10" runat="server" />
                    <asp:Button ID="ButtonDuzenleResim" CssClass="kintaro-button light" runat="server" Text="Düzenle"
                        OnClick="ButtonDuzenleResim_Click" />
                </div>
                <div class="kintaro-column w6 marginY-10 display-Flex flexDirection-Column gap-10 form dark">
                    <video class="video borderRadius-10 w12 max" controls>
                        <source src='<%= Session["videodetay"].ToString() %>'' />
                </video>
                <asp:Button ID="ButtonDuzenleVideo" CssClass="kintaro-button light" runat="server" Text="Düzenle" OnClick="ButtonDuzenleVideo_Click" />
            </div>
        </div>
        <div class="kintaro-row alignItems-Center display-Flex gap-10 ">
            <div class="kintaro-column w12">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label dark">Başlık</label>
                    <asp:TextBox Enabled="false" ID="TextBoxBaslik" CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column ">
                <asp:Button ID="ButtonDuzenlebaslik" CssClass="kintaro-combined-input-button dark w100"
                    runat="server" Text="Düzenle" OnClick="ButtonDuzenlebaslik_Click" />
            </div>
        </div>
        <div class="kintaro-row alignItems-Center display-Flex gap-10 ">
            <div class="kintaro-column w12">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label dark">Kategori</label>
                    <asp:TextBox Enabled="false" ID="TextBoxKategori" CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column ">
                <asp:Button ID="ButtonDuzenleKategori" CssClass="kintaro-combined-input-button dark w100"
                    runat="server" Text="Düzenle" OnClick="ButtonDuzenleKategori_Click" />
            </div>
        </div>
        <div class="kintaro-row alignItems-Center display-Flex gap-10 ">
            <div class="kintaro-column w12">
                <div class="kintaro-combined-input-layout" style="height: 150px;">
                    <label class="kintaro-combined-input-label dark">Açıklama</label>
                    <asp:TextBox Enabled="false" ID="TextBoxAciklama" TextMode="MultiLine" CssClass="kintaro-combined-input-textbox dark paddingY-20" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="kintaro-column " style="margin-top: -10px;">
            <asp:Button ID="ButtonDuzenleAciklama" CssClass="kintaro-combined-input-button dark w100"
                runat="server" Text="Düzenle" OnClick="ButtonDuzenleAciklama_Click" />
        </div>
          </asp:Content>