<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="_Default" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="main" ContentPlaceHolderID="main" runat="Server">
    <div class="kintaro-container container-full" style="margin-top: -80px">
        <div class="slider-container">
            <div class="slider">
                <div class="slide active">
                    <img src="/assets/images/banner/1.jpg" />
                    <h1 class="slider-text">kintaro</h1>
                </div>
                <div class="slide ">
                    <img src="/assets/images/banner/1.jpg" />
                    <h1 class="slider-text">kwnet</h1>
                </div>
            </div>
            <div class="slider-navigation opacity-0">
            </div>
            <a class="prev-button opacity-0">&#10094;</a>
            <a class="next-button opacity-0">&#10095;</a>
        </div>
    </div>
    <div class="kintaro-container marginY-25">
        <div class="kintaro-row w12 display-Flex justifyContent-Center marginY-20">
            <div class="kintaro-column w6 display-Flex gap-5">
                <div class="kintaro-column w12 ">
                    <asp:TextBox ID="TextBoxicerikAra" CssClass="kintaro-textbox light" placeholder="Ara..."
                        runat="server" AutoPostBack="true" OnTextChanged="TextBoxicerikAra_TextChanged">
                    </asp:TextBox>
                </div>
            </div>
        </div>
        <div class="kintaro-row display-Flex justifyContent-Center alignItems-Center w12" runat="server"
            id="filmmesaj" style="display: none;">
            <div class=" kintaro-column w4 light form display-Flex justifyContent-Center alignItems-Center">
                <asp:Label ID="Labelaramadurum" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="grid">
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
        <div class="kintaro-column justifyContent-Center w12 display-Flex marginY-25">
            <asp:Button CssClass="kintaro-button light" ID="ButtondahafazlaFilmGoster" runat="server"
                Text="Daha fazla film göster" OnClick="ButtondahafazlaFilmGoster_Click" />
        </div>
    </div>
</asp:Content>
