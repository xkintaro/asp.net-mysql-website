<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="kullanici-detay.aspx.cs" Inherits="admin_kullanici_detay" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="kintaro-column">
            <h1 class="title">Kullanıcı Detay</h1>
        </div>
        <div class="kintaro-column w12 form dark marginY-20">
            <div class="kintaro-row" style="padding-bottom:20px;">
                <div class="kintaro-column w2">
                    <asp:Image CssClass="borderRadius-10" ID="Image1" runat="server" />
                </div>
            </div>
            <div class="kintaro-column">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label light">Kullanıcı ID</label>
                    <asp:TextBox CssClass="kintaro-combined-input-textbox light" Enabled="false" ID="TextBoxID"
                        runat="server">
                    </asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label light">Tarih</label>
                    <asp:TextBox CssClass="kintaro-combined-input-textbox light" Enabled="false" ID="TextBoxTarih"
                        runat="server">
                    </asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label light">Yetki</label>
                    <asp:TextBox CssClass="kintaro-combined-input-textbox light" Enabled="false" ID="TextBoxYetki"
                        runat="server">
                    </asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column">
                <div class="kintaro-combined-input-layout">
                    <label class="kintaro-combined-input-label light">Kullanıcı Adı</label>
                    <asp:TextBox CssClass="kintaro-combined-input-textbox light" Enabled="false"
                        ID="TextBoxKullaniciAdi" runat="server">
                    </asp:TextBox>
                </div>
            </div>
            <div class="kintaro-column">
                <div class="kintaro-combined-input-layout" style="height: 150px;">
                    <label class="kintaro-combined-input-label light">Biografi</label>
                    <asp:TextBox CssClass="kintaro-combined-input-textbox light" Style="padding-top: 20px;"
                        TextMode="MultiLine" Enabled="false" ID="TextBoxBiografi" runat="server">
                    </asp:TextBox>
                </div>
            </div>
        </div>
    </asp:Content>