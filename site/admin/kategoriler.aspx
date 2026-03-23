<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="kategoriler.aspx.cs" Inherits="admin_kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kintaro-column">
        <h1 class="title">Kategoriler - 
            <asp:Label ID="labelCount" runat="server" Text=""></asp:Label></h1>
    </div>
    <div class="kintaro-column w12 display-Flex justifyContent-Right marginY-10">
        <a href="kategori-ekle.aspx" class="kintaro-button dark">Kategori Ekle</a>
    </div>
    <div class="kintaro-column w12 display-Flex">
        <asp:TextBox ID="TextBoxicerikAra" placeholder="Ara..." CssClass="kintaro-textbox dark " runat="server"
            AutoPostBack="true" OnTextChanged="TextBoxicerikAra_TextChanged">
        </asp:TextBox>
    </div>
    <div class="kintaro-column w12 form dark marginY-10 display-Block ">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="kintaro-column display-Flex justifyContent-SpaceBetween alignItems-Center gap-10 form light marginY-10">
                    <div class="kintaro-column">
                        <p class="text"><%# Eval("kategoriAdi") %></p>
                    </div>
                    <div class="kintaro-column cursor-Poiner" onclick='<%# "kintaroSystemMessageContainerDeleteFormOpen(" + Eval("kategoriID") + ")" %>'>
                        <img class="icon " src="../assets/images/assets/delete.png" />
                    </div>
                </div>
                <!-- SİSTEM MESAJI KATEGORİ SİL -->
                <div class="kintaro-system-message-container"
                    id='<%# "kintaroSystemMessageContainerDeleteForm" + Eval("kategoriID") %>'>
                    <div class="kintaro-system-message-box">
                        <div class="kintaro-column w12 justifyContent-Right display-Flex">
                            <span class="kintaro-close-button"
                                onclick='<%# "kintaroSystemMessageContainerDeleteFormClose(" + Eval("kategoriID") + ")" %>'>+</span>
                        </div>
                        <div class="kintaro-column marginY-20">
                            <p class="text">"<%# Eval("kategoriAdi") %>" kategorisini silmek istediğinize emin misiniz?</p>
                        </div>
                        <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                            <span class="kintaro-button red"
                                onclick='<%# "kintaroSystemMessageContainerDeleteFormClose(" + Eval("kategoriID") + ")" %>'>İptal</span>
                            <asp:Button ID="ButtonDeleteComment" runat="server" Text="Sil"
                                CssClass="kintaro-button darkGreen" OnClick="ButtonDeleteComment_Click"
                                CommandArgument='<%# Eval("kategoriID") %>' />
                        </div>
                    </div>
                </div>
                <!-- SİSTEM MESAJI KATEGORİ SİL END -->
            </ItemTemplate>
        </asp:Repeater>
        <script>
            function kintaroSystemMessageContainerDeleteFormOpen(ID) {
                var kintaroSystemMessageContainerDeleteForm = "kintaroSystemMessageContainerDeleteForm" + ID;
                document.getElementById(kintaroSystemMessageContainerDeleteForm).style.display = "block";
            }
            function kintaroSystemMessageContainerDeleteFormClose(ID) {
                var kintaroSystemMessageContainerDeleteForm = "kintaroSystemMessageContainerDeleteForm" + ID;
                document.getElementById(kintaroSystemMessageContainerDeleteForm).style.display = "none";
            }
        </script>
        <div class="kintaro-column marginY-20 display-Flex justifyContent-Center alignItems-Center" id="nullContent" runat="server" style="display: none;">
            <p>Kategori yok.</p>
        </div>
        <div class="kintaro-column marginY-20 display-Flex justifyContent-Center alignItems-Center" id="sonucbulunamadi" runat="server" style="display: none;">
            <p>Sonuç bulunamadı.</p>
        </div>
    </div>
</asp:Content>

