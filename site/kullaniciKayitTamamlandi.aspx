<%@ Page Title="" Language="C#" MasterPageFile="~/ana.master" AutoEventWireup="true" CodeFile="kullaniciKayitTamamlandi.aspx.cs" Inherits="kullaniciKayitTamamlandi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <div class="kintaro-container">
        <div class="kintaro-row justifyContent-SpaceBetween display-Flex form light">
            <div class="kintaro-column w12 display-Block">
               
                <div class="kintaro-column w12">
                    <h1 class="title marginY-10">Kaydınız başarıyla tamamlandı.</h1>
                </div>
                <div class="kintaro-column w12">
                    <div class="kintaro-row justifyContent-Right display-Flex gap-10">
                        <div class="kintaro-column marginY-10 ">
                            <asp:Button ID="ButtonSonraki" CssClass="kintaro-button dark w100" runat="server" Text="Tamam!"
                                OnClick="ButtonSonraki_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

