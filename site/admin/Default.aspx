<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master"
AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  runat="Server"
>
  <div class="kintaro-column">
    <h1 class="title">Dashboard</h1>
  </div>
  <div
    class="kintaro-column display-Flex flexDirection-Column gap-10 w12 marginY-20"
  >
    <div
      class="kintaro-column w12 dark form display-Flex flexDirection-Column gap-10"
    >
      <a href="icerikler.aspx">
        <div
          class="kintaro-column position-Relative light form borderRadius-10 gap-10 display-Flex alignItems-Center justifyContent-Center"
        >
          <p class="text">İçerikler</p>
          <div
            class="kintaro-column position-Absolute borderRadius-10 display-Flex justifyContent-Center alignItems-Center padding-10 dark"
            style="right: 10px; min-width: 30px"
          >
            <p class="text">
              <asp:Label ID="Labelicerik" runat="server" Text=""></asp:Label>
            </p>
          </div>
        </div>
      </a>
      <a href="kategoriler.aspx">
        <div
          class="kintaro-column position-Relative light form borderRadius-10 gap-10 display-Flex alignItems-Center justifyContent-Center"
        >
          <p class="text">Kategoriler</p>
          <div
            class="kintaro-column position-Absolute borderRadius-10 display-Flex justifyContent-Center alignItems-Center padding-10 dark"
            style="right: 10px; min-width: 30px"
          >
            <p class="text">
              <asp:Label ID="Labelkategori" runat="server" Text=""></asp:Label>
            </p>
          </div>
        </div>
      </a>
      <a href="kullanicilar.aspx">
        <div
          class="kintaro-column position-Relative light form borderRadius-10 gap-10 display-Flex alignItems-Center justifyContent-Center"
        >
          <p class="text">Kullanıcılar</p>
          <div
            class="kintaro-column position-Absolute borderRadius-10 display-Flex justifyContent-Center alignItems-Center padding-10 dark"
            style="right: 10px; min-width: 30px"
          >
            <p class="text">
              <asp:Label ID="Labelkullanici" runat="server" Text=""></asp:Label>
            </p>
          </div>
        </div>
      </a>
      <a href="mesajlar.aspx">
        <div
          class="kintaro-column position-Relative light form borderRadius-10 gap-10 display-Flex alignItems-Center justifyContent-Center"
        >
          <p class="text">Mesajlar</p>
          <div
            class="kintaro-column position-Absolute borderRadius-10 display-Flex justifyContent-Center alignItems-Center padding-10 dark"
            style="right: 10px; min-width: 30px"
          >
            <p class="text">
              <asp:Label ID="Labelmesaj" runat="server" Text=""></asp:Label>
            </p>
          </div>
        </div>
      </a>
    </div>
    <div class="kintaro-row w12 display-Flex gap-10">
      <div
        class="kintaro-column w6 dark form display-Flex flexDirection-Column gap-10 marginY-10"
      >
        <div class="kintaro-column">
          <h3 class="title">Kayıt olan son kullanıcılar</h3>
        </div>
        <asp:Repeater ID="Repeaterkullanici" runat="server">
          <ItemTemplate>
            <div
              class="kintaro-column light form display-Flex justifyContent-SpaceBetween alignItems-Center"
            >
              <div class="kintaro-column">
                <p class="text">
                  "<%# Eval("kullaniciAdi") %>" adlı kullanıcı kayıt oldu.
                </p>
              </div>
              <div class="kintaro-column cursor-Poiner">
                <a
                  href='<%# "kullanici-detay.aspx?kullaniciID=" + Eval("kullaniciID") %>'
                >
                  <img class="icon" src="../assets/images/assets/eye.png" />
                </a>
              </div>
            </div>
          </ItemTemplate>
        </asp:Repeater>
        <div
          class="kintaro-column light form display-Flex justifyContent-Center alignItems-Center"
          runat="server"
          id="kullaniciyok"
          style="height: 230px; display: none"
        >
          <p class="text">Kayıtlı kullanıcı yok.</p>
        </div>
      </div>
      <div
        class="kintaro-column w6 dark form display-Flex flexDirection-Column gap-10 marginY-10"
      >
        <div class="kintaro-column">
          <h3 class="title">Gelen son mesajlar</h3>
        </div>
        <asp:Repeater ID="Repeatermesaj" runat="server">
          <ItemTemplate>
            <div
              class="kintaro-column light form display-Flex justifyContent-SpaceBetween alignItems-Center"
            >
              <div class="kintaro-column">
                <p class="text">
                  "<%# Eval("kadi") %>" adlı kullanıcıdan yeni mesaj.
                </p>
              </div>
              <div class="kintaro-column cursor-Poiner">
                <a href='<%# "mesaj-detay.aspx?id=" + Eval("id") %>'>
                  <img class="icon" src="../assets/images/assets/eye.png" />
                </a>
              </div>
            </div>
          </ItemTemplate>
        </asp:Repeater>
        <div
          class="kintaro-column light form display-Flex justifyContent-Center alignItems-Center"
          runat="server"
          id="mesajyok"
          style="height: 230px; display: none"
        >
          <p class="text">Gönderilen mesaj yok.</p>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
