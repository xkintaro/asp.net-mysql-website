<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="kategori-detay.aspx.cs"
    Inherits="kategori_detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <div class="kintaro-container display-Block">
        <div class="kintaro-column">
            <h1 class="title ">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </h1>
        </div>
        <div class="kintaro-column marginY-20 display-Flex justifyContent-Center alignItems-Center form light" id="nullContent" runat="server" style="display:none;">
            <p>Bu kategoriye henüz içerik eklenmemiş.</p>
        </div>
        <div class="grid marginY-20">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="box">
                        <a href='<%# "icerik-detay.aspx?icerikno=" + Eval("icerikno") %>'>
                            <div class="box-head">
                                <asp:Image ID="Image1" CssClass="box-head-image"
                                    ImageUrl='<%# "~/upload/" + Eval("icerikkapakResmi") %>' runat="server" />
                            </div>
                            <div class="box-body">
                                <asp:Image ID="Image2" CssClass="box-body-image"
                                    ImageUrl='<%# "~/upload/" + Eval("kullaniciProfilResmi") %>' runat="server" />
                                <div class="box-body-text">
                                    <p class="box-body-text-title" id="metin">
                                        <%# Eval("icerikBaslik")%>
                                    </p>
                                    <p class="box-body-text-uploader">
                                        <%# Eval("kullaniciAdi")%> - <%# Eval("tarih")%>
                                    </p>
                                    <p class="box-body-text-view">
                                        <%# Eval("goruntulenme")%> Görüntülenme
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
            <script>
                window.onload = function () {
                    kisalt();
                };
                function kisalt() {
                    var element = document.getElementById("metin");
                    var metin = element.innerHTML.trim();
                    if (metin.length > 50) {
                        var kisaltilmisMetin = metin.substring(0, 55) + "...";
                        element.innerHTML = kisaltilmisMetin;
                    }
                }
            </script>
        </div>
    </div>
</asp:Content>
