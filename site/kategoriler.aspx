<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="kategoriler.aspx.cs"
    Inherits="kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <div class="kintaro-container">
        <div class="kintaro-column w12 Ycenter">
            <h1 class="title">Kategoriler</h1>
        </div>
        <div class="grid marginY-20">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <a href='<%# "kategori-detay.aspx?kategoriID=" + Eval("kategoriID") %>'>
                        <div class="box light borderRadius-10 display-Flex alignItems-Center justifyContent-Center">
                            <p class="text">
                                <%# Eval("kategoriAdi") %>
                            </p>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
