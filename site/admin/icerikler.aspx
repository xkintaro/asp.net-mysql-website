<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="icerikler.aspx.cs" Inherits="admin_icerikler" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="kintaro-column">
            <h1 class="title">İçerikler -
                <asp:Label ID="labelCount" runat="server" Text=""></asp:Label>
            </h1>
        </div>
        <div class="kintaro-column w12 display-Flex justifyContent-Right marginY-10">
            <a href="icerik-ekle-part-1.aspx" class="kintaro-button dark">İçerik Ekle</a>
        </div>
        <div class="kintaro-column w12 display-Flex">
            <asp:TextBox ID="TextBoxicerikAra" placeholder="Ara..." CssClass="kintaro-textbox dark " runat="server"
                AutoPostBack="true" OnTextChanged="TextBoxicerikAra_TextChanged">
            </asp:TextBox>
        </div>
        <div class="kintaro-column w12 form dark marginY-10 display-Block ">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div
                        class="kintaro-column display-Flex justifyContent-SpaceBetween alignItems-Center gap-10 form light marginY-10">
                        <div class="kintaro-column">
                            <p class="text">
                                <%# Eval("icerikBaslik") %>
                            </p>
                        </div>
                        <div class="kintaro-column cursor-Poiner">
                            <a href='<%# "icerik-detay.aspx?icerikno=" + Eval("icerikno") %>'>
                                <img class="icon " src="../assets/images/assets/edit-icon.png" />
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="kintaro-column marginY-20 display-Flex justifyContent-Center alignItems-Center" id="nullContent"
                runat="server" style="display: none;">
                <p>İçerik yok.</p>
            </div>
            <div class="kintaro-column marginY-20 display-Flex justifyContent-Center alignItems-Center"
                id="sonucbulunamadi" runat="server" style="display: none;">
                <p>Sonuç bulunamadı.</p>
            </div>
        </div>
    </asp:Content>