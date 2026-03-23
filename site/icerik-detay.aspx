<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="icerik-detay.aspx.cs"
    Inherits="icerik_detay" EnableEventValidation="false" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
        <!-- SİSTEM MESAJI -->
        <div class="kintaro-system-message-container" id="girisyap" runat="server">
            <div class="kintaro-system-message-box">
                <div class="kintaro-column w12 justifyContent-Right display-Flex">
                    <asp:Button ID="kintaroSystemMessageContainerClose1" runat="server" CssClass="kintaro-close-button"
                        Text="+" OnClick="kintaroSystemMessageContainerClose1_Click" />
                </div>
                <div class="kintaro-column marginY-20">
                    <p class="text">
                        Yorum yazabilmek için oturum açınız.
                    </p>
                </div>
                <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                    <asp:Button ID="kintaroSystemMessageContainerClose2" CssClass="kintaro-button dark" runat="server"
                        Text="Tamam" OnClick="kintaroSystemMessageContainerClose2_Click" />
                </div>
            </div>
        </div>
        <!-- SİSTEM MESAJI END -->
        <!-- SİSTEM MESAJI -->
        <div class="kintaro-system-message-container" id="favori" runat="server">
            <div class="kintaro-system-message-box">
                <div class="kintaro-column w12 justifyContent-Right display-Flex">
                    <asp:Button ID="kintaroSystemMessageContainerClose3" runat="server" CssClass="kintaro-close-button"
                        Text="+" OnClick="kintaroSystemMessageContainerClose3_Click" />
                </div>
                <div class="kintaro-column marginY-20">
                    <p class="text">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </p>
                </div>
                <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                    <asp:Button ID="kintaroSystemMessageContainerClose4" CssClass="kintaro-button dark" runat="server"
                        Text="Tamam" OnClick="kintaroSystemMessageContainerClose4_Click" />
                </div>
            </div>
        </div>
        <!-- SİSTEM MESAJI END -->
        <div class="kintaro-container">
            <div class="kintaro-row w12 display-Flex gap-10">
                <div class="kintaro-column w9 display-Block">
                    <video class="video" controls poster='<%= Session["icerikkapakResmi"].ToString() %>'>
                        <source src='<%= Session["video"].ToString() %>' type="video/mp4" />
                    </video>
                    <div class="kintaro-column w12 marginY-10">
                        <h1 class="title">
                            <asp:Label ID="LabelicerikBaslik" runat="server" Text="Label"></asp:Label>
                        </h1>
                    </div>
                    <div class="kintaro-column w12">
                        <asp:Button CssClass="kintaro-button w100 light" ID="ButtonFavorilereEkle" runat="server"
                            Text="Favorilere Ekle" OnClick="ButtonFavorilereEkle_Click" />
                    </div>
                    <div class="kintaro-column display-Block form light marginY-10">
                        <div class="kintaro-column w12">
                            <a href='<%= "kullaniciProfili.aspx?kullaniciAdi=" + LabelicerigiYayinlayanKisi.Text %>'>
                                <asp:Label ID="LabelicerigiYayinlayanKisi" CssClass="bold" runat="server" Text="">
                                </asp:Label>
                                <label class="text fade">tarafından yayınlanmıştır.</label>
                            </a>
                        </div>
                        <div class="kintaro-column w12">
                            <div class="kintaro-row display-Flex gap-10">
                                <div class="kintaro-column">
                                    <p class="text">
                                        <asp:Label ID="Labelgoruntulenme" runat="server" Text=""></asp:Label>
                                        Görüntülenme
                                    </p>
                                </div>
                                <div class="kintaro-column">
                                    <a href='<%= "kategori-detay.aspx?kategoriID=" +   Session["kategoriID"]  %>'
                                        class="text ">
                                        <asp:Label ID="LabelicerikKategori" runat="server" Text=""></asp:Label>
                                    </a>
                                </div>
                                <div class="kintaro-column">
                                    <p class="text ">
                                        <asp:Label ID="Labeltarih" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="kintaro-column w12">
                            <p class="text fade" id="accordion">
                                <asp:Label ID="LabelicerikAciklamasi" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                    <script>
                        var label = document.getElementById('<%= LabelicerikAciklamasi.ClientID %>');

                        var content = label.innerHTML;

                        if (content.length > 250) {
                            var shortContent = content.substring(0, 250);

                            var shortSpan = document.createElement('span');
                            shortSpan.textContent = shortContent;

                            var fullSpan = document.createElement('span');
                            fullSpan.textContent = content;
                            fullSpan.style.display = 'none';

                            var button = document.createElement('button');
                            button.type = 'button'; 
                            button.textContent = ' Daha Fazla Göster';
                            button.addEventListener('click', function () {
                                if (fullSpan.style.display === 'none') {
                                    fullSpan.style.display = 'inline';
                                    shortSpan.style.display = 'none';
                                    button.textContent = 'Daha Az Göster'; 
                                } else {
                                    fullSpan.style.display = 'none'; 
                                    shortSpan.style.display = 'inline'; 
                                    button.textContent = ' Daha Fazla Göster'; 
                                }
                            });

                            var accordion = document.getElementById('accordion');
                            accordion.innerHTML = '';
                            accordion.appendChild(shortSpan);
                            accordion.appendChild(fullSpan);
                            accordion.appendChild(button);
                        }
                    </script>
                    <div class="kintaro-column w12 display-Block">
                        <div class="kintaro-column w12 marginY-5">
                            <h1 class="title">Yorumlar -
                                <asp:Label ID="Labelyorumsayisi" runat="server" Text="Label"></asp:Label>
                            </h1>
                        </div>
                        <div class="kintaro-column w12" id="yorumYaz" runat="server">
                            <div class="kintaro-row w12 display-Flex gap-10">
                                <div class="kintaro-column w12 marginY-5 ">
                                    <asp:TextBox ID="TextBoxyorumyaz" CssClass="kintaro-textbox light"
                                        placeholder="Yorum yaz..." AutoComplete="off" runat="server">
                                    </asp:TextBox>
                                </div>
                                <div class="kintaro-column marginY-5">
                                    <asp:Button CssClass="kintaro-button light w100" ID="ButtonYorumuGonder"
                                        runat="server" Text="Gönder" OnClick="ButtonYorumuGonder_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="kintaro-column display-Block">
                            <asp:Repeater ID="RepeaterMyComments" runat="server">
                                <ItemTemplate>
                                    <div class="kintaro-column w12 display-Flex paddingY-10 gap-5">
                                        <a href='<%# "kullaniciProfili.aspx?kullaniciID=" + Eval("kullaniciID") %>'>
                                            <asp:Image ID="Image2f" runat="server" CssClass="comment-image"
                                                ImageUrl='<%# "upload/" + Eval("kullaniciProfilResmi") %>' />
                                        </a>
                                        <div class="kintaro-column w12 display-Block">
                                            <div class="kintaro-column w12 display-Flex gap-5">
                                                <a
                                                    href='<%# "kullaniciProfili.aspx?kullaniciID=" + Eval("kullaniciID") %>'>
                                                    <%# Eval("kullaniciAdi") %>
                                                </a>
                                                <p class="text fade mini" style="display: flex; align-items: center;">
                                                    <%# Eval("tarih") %>
                                                </p>
                                            </div>
                                            <div class="kintaro-column w12">
                                                <p class="text fade">
                                                    <%# Eval("yorummetni") %>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="comment-action">
                                            <div class="kintaro-dots-container">
                                                <div class="kintaro-dots-icon-container"
                                                    onclick='<%# "dotsOpen(" + Eval("yorumID") + ")" %>'>
                                                    <div class="kintaro-dots-icon-container-dot"></div>
                                                    <div class="kintaro-dots-icon-container-dot"></div>
                                                    <div class="kintaro-dots-icon-container-dot"></div>
                                                </div>

                                                <div class="kintaro-dots-nav"
                                                    id='<%# "kintaroDotsNav" + Eval("yorumID") %>'>
                                                    <span class="kintaro-dots-nav-link"
                                                        onclick='<%# "kintaroSystemMessageContainerUpdateFormOpen(" + Eval("yorumID") + ")" %>'>Düzenle</span>
                                                    <span class="kintaro-dots-nav-link"
                                                        onclick='<%# "kintaroSystemMessageContainerDeleteFormOpen(" + Eval("yorumID") + ")" %>'>Sil</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- SİSTEM MESAJI YORUM DÜZENLE -->
                                    <div class="kintaro-system-message-container"
                                        id='<%# "kintaroSystemMessageContainerUpdateForm" + Eval("yorumID") %>'>
                                        <div class="kintaro-system-message-box">
                                            <div class="kintaro-column w12 justifyContent-Right display-Flex">
                                                <span class="kintaro-close-button"
                                                    onclick='<%# "kintaroSystemMessageContainerUpdateFormClose(" + Eval("yorumID") + ")" %>'>+</span>
                                            </div>
                                            <div class="kintaro-column marginY-20">
                                                <asp:TextBox ID="TextBoxYorumGuncelle" CssClass="kintaro-textbox dark"
                                                    Text='<%# Eval("yorummetni") %>' runat="server"></asp:TextBox>
                                            </div>
                                            <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                                                <span class="kintaro-button red"
                                                    onclick='<%# "kintaroSystemMessageContainerUpdateFormClose(" + Eval("yorumID") + ")" %>'>İptal</span>
                                                <asp:Button ID="ButtonUpdateComment" runat="server" Text="Güncelle"
                                                    CssClass="kintaro-button darkGreen"
                                                    OnClick="ButtonUpdateComment_Click"
                                                    CommandArgument='<%# Eval("yorumID") %>' />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- SİSTEM MESAJI YORUM DÜZENLE END -->

                                    <!-- SİSTEM MESAJI YORUM SİL -->
                                    <div class="kintaro-system-message-container"
                                        id='<%# "kintaroSystemMessageContainerDeleteForm" + Eval("yorumID") %>'>
                                        <div class="kintaro-system-message-box">
                                            <div class="kintaro-column w12 justifyContent-Right display-Flex">
                                                <span class="kintaro-close-button"
                                                    onclick='<%# "kintaroSystemMessageContainerDeleteFormClose(" + Eval("yorumID") + ")" %>'>+</span>
                                            </div>

                                            <div class="kintaro-column marginY-20">
                                                Yorumunuzu silmek istediğinize emin misiniz?
                                            </div>
                                            <div class="kintaro-column display-Flex gap-10 justifyContent-Right">
                                                <span class="kintaro-button red"
                                                    onclick='<%# "kintaroSystemMessageContainerDeleteFormClose(" + Eval("yorumID") + ")" %>'>İptal</span>
                                                <asp:Button ID="ButtonDeleteComment" runat="server" Text="Sil"
                                                    CssClass="kintaro-button darkGreen"
                                                    OnClick="ButtonDeleteComment_Click"
                                                    CommandArgument='<%# Eval("yorumID") %>' />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- SİSTEM MESAJI YORUM SİL END -->
                                </ItemTemplate>
                            </asp:Repeater>
                            <script>
                                 function kintaroSystemMessageContainerUpdateFormOpen(ID) {
                                    var kintaroSystemMessageContainerUpdateForm = "kintaroSystemMessageContainerUpdateForm" + ID;
                                    document.getElementById(kintaroSystemMessageContainerUpdateForm).style.display = "block";
                                }
                                function kintaroSystemMessageContainerUpdateFormClose(ID) {
                                    var kintaroSystemMessageContainerUpdateForm = "kintaroSystemMessageContainerUpdateForm" + ID;
                                    document.getElementById(kintaroSystemMessageContainerUpdateForm).style.display = "none";
                                }
                                 function kintaroSystemMessageContainerDeleteFormOpen(ID) {
                                    var kintaroSystemMessageContainerDeleteForm = "kintaroSystemMessageContainerDeleteForm" + ID;
                                    document.getElementById(kintaroSystemMessageContainerDeleteForm).style.display = "block";
                                }
                                function kintaroSystemMessageContainerDeleteFormClose(ID) {
                                    var kintaroSystemMessageContainerDeleteForm = "kintaroSystemMessageContainerDeleteForm" + ID;
                                    document.getElementById(kintaroSystemMessageContainerDeleteForm).style.display = "none";
                                }
                                function dotsOpen(ID) {
                                    var kintaroDotsNav = "kintaroDotsNav" + ID;
                                    var kintaroDotsNavElement = document.getElementById(kintaroDotsNav);
                                    if (kintaroDotsNavElement.style.display === "block") {
                                        kintaroDotsNavElement.style.display = "none";
                                    }
                                    else {
                                        var kintaroDotsNavOpen = document.querySelector('.kintaro-dots-nav[style="display: block;"]');
                                        if (kintaroDotsNavOpen !== null) {
                                            kintaroDotsNavOpen.style.display = "none";
                                        }
                                        kintaroDotsNavElement.style.display = "block";
                                    }
                                    document.addEventListener('click', function (event) {
                                        if (!event.target.closest('.kintaro-dots-container')) {
                                            kintaroDotsNavElement.style.display = "none";
                                        }
                                    });
                                }
                            </script>
                        </div>
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <div class="kintaro-column w12 display-Flex paddingY-10 gap-5">
                                    <a href='<%# "kullaniciProfili.aspx?kullaniciID=" + Eval("kullaniciID") %>'>
                                        <asp:Image ID="Image2" runat="server" CssClass="comment-image"
                                            ImageUrl='<%# "upload/" + Eval("kullaniciProfilResmi") %>' />
                                    </a>
                                    <div class="kintaro-column w12 display-Block">
                                        <div class="kintaro-column w12 display-Flex gap-5">
                                            <a href='<%# "kullaniciProfili.aspx?kullaniciID=" + Eval("kullaniciID") %>'>
                                                <%# Eval("kullaniciAdi") %>
                                            </a>
                                            <p class="text fade mini" style="display: flex; align-items: center;">
                                                <%# Eval("tarih") %>
                                            </p>
                                        </div>
                                        <div class="kintaro-column w12">
                                            <p class="text fade">
                                                <%# Eval("yorummetni") %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="kintaro-column w12 display-Flex justifyContent-Center marginY-10">
                        <asp:Button ID="Buttondahafazlayorum" runat="server" CssClass="kintaro-button light"
                            Text="Daha fazla yorum göster" OnClick="Buttondahafazlayorum_Click" />
                    </div>
                </div>
                <div class="kintaro-column w3">
                    <div class="grid">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="box">
                                    <a href='<%# "icerik-detay.aspx?icerikno=" + Eval("icerikno") %>'>
                                        <div class="box-head">
                                            <asp:Image ID="Image1" CssClass="box-head-image"
                                                ImageUrl='<%# "~/upload/" + Eval("icerikkapakResmi") %>'
                                                runat="server" />
                                        </div>
                                        <div class="box-body">
                                            <asp:Image ID="Image2" CssClass="box-body-image"
                                                ImageUrl='<%# "~/upload/" + Eval("kullaniciProfilResmi") %>'
                                                runat="server" />
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
                    <div class="kintaro-column w12 display-Flex justifyContent-Center marginY-10">
                        <asp:Button CssClass="kintaro-button light" ID="ButtondahafazlaFilmGoster" runat="server"
                            Text="Daha fazla film göster" OnClick="ButtondahafazlaFilmGoster_Click" />
                    </div>
                </div>

            </div>
        </div>
    </asp:Content>