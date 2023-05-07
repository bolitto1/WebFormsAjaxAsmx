<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="EditarM.aspx.vb" Inherits="EditarM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        EDITAR<br />
    </p>
    <table class="nav-justified">
        <tr>
            <td class="modal-sm" style="width: 195px; height: 22px">ID</td>
            <td style="height: 22px">
                <asp:Label ID="lblId" runat="server" Text="0"></asp:Label>
            </td>  
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px; height: 22px">CEDULA</td>
            <td style="height: 22px">
                <asp:TextBox ID="txtcedula" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 195px">NOMBRES</td>
            <td style="height: 20px">
                <asp:TextBox ID="txtnombres" runat="server" Width="307px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px">APELLIDOS</td>
            <td>
                <asp:TextBox ID="txtapellidos" runat="server" Width="307px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px">FECHA DE NACIMIENTO</td>
            <td>
                <asp:TextBox ID="txtDatePicker" runat="server" Type="DATE" ></asp:TextBox> 
                &nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px">EDAD</td>
            <td>
                <asp:TextBox ID="txtedad" runat="server" Width="60px"></asp:TextBox> 
                </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px; text-align: right;">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" />

                </td>
            <td>
                <asp:Button ID="btnVolver" runat="server" Text="Volver" PostBackUrl="~/Lista.aspx" />
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="lblmsj" runat="server"></asp:Label>
    </p>
</asp:Content>

