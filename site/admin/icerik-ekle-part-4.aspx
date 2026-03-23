<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="icerik-ekle-part-4.aspx.cs" Inherits="admin_icerik_ekle_part_4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .max{
            height:500px;
        }
        .video{
            background-color:#000;
        }
    </style>
    <div class="kintaro-column">
        <h1 class="title">İçerik Ekle</h1>
    </div>
    <div class="kintaro-column display-Block marginY-50">
        <div class="kintaro-row display-Flex w12 gap-10">
            <div class="kintaro-column w6 marginY-10">
                <asp:Image ID="Image1" CssClass="max borderRadius-10" runat="server" />
            </div>
            <div class="kintaro-column w6 marginY-10">
                 <video class="video borderRadius-10 w12 max" controls>
                    <source src='<%  Response.Write("geciciUpload/" +Session["icerikVideosuTutucu"]); %>' />
                </video>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label dark">Yayınlayan</label>
                <asp:TextBox Enabled="false" ID="TextBoxuploader" CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label dark">Tarih</label>
                <asp:TextBox Enabled="false" ID="TextBoxTarih" CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label dark">Başlık</label>
                <asp:TextBox Enabled="false" ID="TextBoxBaslik" CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout">
                <label class="kintaro-combined-input-label dark">Kategori</label>
                <asp:TextBox Enabled="false" ID="TextBoxKategori" CssClass="kintaro-combined-input-textbox dark" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column">
            <div class="kintaro-combined-input-layout" style="height: 150px;">
                <label class="kintaro-combined-input-label dark">Açıklama</label>
                <asp:TextBox Enabled="false" ID="TextBoxAciklama" TextMode="MultiLine" CssClass="kintaro-combined-input-textbox dark paddingY-20" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="kintaro-column display-Flex justifyContent-Right gap-10">
            <div class="kintaro-column">
                <asp:Button ID="ButtonOnceki" CssClass="kintaro-button dark" runat="server" Text="Önceki" OnClick="ButtonOnceki_Click" />
            </div>
            <div class="kintaro-column">
                <asp:Button ID="ButtonYayinla" CssClass="kintaro-button dark" runat="server" Text="Yayınla" OnClick="ButtonYayinla_Click" />
            </div>
        </div>
        <div class="kintaro-column display-Flex marginY-10">
            <asp:Label ID="LabelDurum" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
