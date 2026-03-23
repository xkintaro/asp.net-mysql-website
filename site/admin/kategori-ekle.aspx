<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="kategori-ekle.aspx.cs" Inherits="admin_kategori_ekle" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="kintaro-column">
            <h1 class="title">Kategori Ekle</h1>
        </div>
        <div class="kintaro-column display-Block marginY-50">
            <div class="kintaro-column">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label dark">Kategori</label>
                    <asp:TextBox ID="TextBoxKategori" CssClass="kintaro-combined-input-textbox dark" runat="server">
                    </asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column display-Flex ">
                <asp:Label ID="LabelDurum" runat="server" Text=""></asp:Label>
            </div>
            <div class="kintaro-column w12 display-Flex justifyContent-Right marginY-10 gap-10">
                <div class="kintaro-column display-Flex ">
                    <a href="kategoriler.aspx" class="kintaro-button dark">Geri</a>
                </div>
                <div class="kintaro-column display-Flex">
                    <asp:Button ID="Button1" OnClick="Button1_Click" CssClass="kintaro-button dark" runat="server"
                        Text="Kaydet" />
                </div>
            </div>
        </div>
    </asp:Content>