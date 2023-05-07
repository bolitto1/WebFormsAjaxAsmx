<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Crear.aspx.vb" Inherits="Crear" %>

           
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

      <script language="javascript" type="text/javascript">
        $(document).ready(function () {
           // alert("Hola, este es un mensaje de alerta!");
            $("#<%=txtcedula.ClientID %>").on("blur", function () {
                var cedu = $(this).val();
                //alert(cedu);
                // Crear objeto con el valor de la cédula
                var data = {
                    cedu: cedu
                };
                // alert(JSON.stringify(data));
                var ajaxData = JSON.stringify(data);
                //  alert(ajaxData);
                //llamada json
                $.ajax({
                    type: 'POST',
                    url: 'WebService.asmx/CedulaRepetida',
                    dataType: 'json',
                    data: ajaxData,
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {
                        //alert(response.d);
                        var resultado = response.d;
                        if (resultado != "Ok") {
                            //''ok significa que no esta repedio
                            alert('La cedula ' + resultado)
                        }
                        // $('#lblData').html(JSON.stringify(response));
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });;
        });
      </script>

    <table class="nav-justified">
        <tr>  
            <td class="modal-sm" style="width: 195px; height: 22px">CEDULA</td>
            <td style="height: 22px">
                <asp:TextBox ID="txtcedula" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcedula" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 195px">NOMBRES</td>
            <td style="height: 20px">
                <asp:TextBox ID="txtnombres" runat="server" Width="307px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnombres" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px">APELLIDOS</td>
            <td>
                <asp:TextBox ID="txtapellidos" runat="server" Width="307px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtapellidos" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px">FECHA DE NACIMIENTO</td>
            <td>
                <asp:TextBox ID="txtDatePicker" runat="server" Type="date" ></asp:TextBox> 
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDatePicker" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px; text-align: right;">
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClientClick="btnclick" />

                </td>
            <td>
                <asp:Button ID="btnVolver" runat="server" PostBackUrl="~/Lista.aspx" Text="Volver" />
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="lblmsj" runat="server"></asp:Label>
    </p>
</asp:Content>

