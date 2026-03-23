<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/admin/admin.master"
    AutoEventWireup="true" CodeFile="mesajlar.aspx.cs" Inherits="admin_mesajlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kintaro-column">
        <h1 class="title">Mesajlar - 
            <asp:Label ID="labelCount" runat="server" Text=""></asp:Label></h1>
    </div>
    <div class="kintaro-column w12 display-Flex" style="margin-top: 20px;">
        <asp:TextBox ID="TextBoxicerikAra" placeholder="Ara..." CssClass="kintaro-textbox dark " runat="server"
            AutoPostBack="true" OnTextChanged="TextBoxicerikAra_TextChanged">
        </asp:TextBox>
    </div>
    <div class="kintaro-column w12 form dark marginY-10 display-Block">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div
                    class="kintaro-column display-Flex justifyContent-SpaceBetween alignItems-Center gap-10 form light marginY-10">
                    <div class="kintaro-column">
                        <p class="text">
                            <%# Eval("kadi") %>
                        </p>
                    </div>
                    <div class="kintaro-column cursor-Poiner">
                        <a href='<%# "mesaj-detay.aspx?id=" + Eval("id") %>'>
                            <img class="icon " src="../assets/images/assets/eye.png" />
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="kintaro-column marginY-20 display-Flex justifyContent-Center alignItems-Center" id="nullContent" runat="server" style="display: none;">
            <p>Mesaj yok.</p>
        </div>
        <div class="kintaro-column marginY-20 display-Flex justifyContent-Center alignItems-Center" id="sonucbulunamadi" runat="server" style="display: none;">
            <p>Sonuç bulunamadý.</p>
        </div>
    </div>
</asp:Content>
