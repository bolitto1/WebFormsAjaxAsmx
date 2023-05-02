<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Crear.aspx.vb" Inherits="Crear" %>

           
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

      <script language="javascript" type="text/javascript">
        $(document).ready(function () {
           // alert("Hola, este es un mensaje de alerta!");
            $(function () {

                $('#btnCallService').click(function () {
                    $.ajax({
                        type: 'POST',
                        url: 'HelloService.asmx/GetEmployeeDetail',
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {
                            $('#lblData').html(JSON.stringify(response));
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });
                });
            });

           <%-- $("#<%=txtcedula.ClientID %>").on("blur", function () {
                alert("El foco se ha perdido en el campo cédula.");
                //llamada json
                $.ajax({
                    type: "POST",
                    url: "Crear.aspx/ComprobarRepetido",
                    data: "{'cedula':'" + cedula + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == false) {
                            alert("La cédula ingresada es inválida.");
                            return false;
                        }
                    },
                    failure: function (response) {
                        alert("Ha ocurrido un error en el servidor.");
                        return false;
                    }
                });
            });--%>
            $("#<%=txtDatePicker.ClientID %>").on("blur", function () {
               // alert("fch");
                var Variablessss1 = $(this).val();
                var dataToSend = {
                    Variable1: Variablessss1
                };
               // alert(Variablessss1);
                //llamada json
                var ajaxData = JSON.stringify(dataToSend);
                $.ajax({
                    type: "POST",
                    url: "~/servicio.asmx/HelloWorld",
                    data: ajaxData, 
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: SetTabSessionValueSucceed,
                    error: SetTabSessionValueFailed
                });

            });

            function SetTabSessionValueSucceed(result) {
               // alert("text from server: " + result.d);
            }

            function SetTabSessionValueFailed() {
              //  alert('call failed');
            }

            $("#<%=txtnombres.ClientID %>").on("blur", function () {
               // alert("nombres");
               
                var name = $.trim($("#txtnombres").val());
                var age = $.trim($("#txtnombres").val());
                //$.ajax({
                //    type: "POST",
                //    url: "servicio.asmx/GetDetails",
                //    data: "{ name: '" + name + "', age: " + age + "}",
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (r) {
                //        alert(r.d);
                //    },
                //    error: function (r) {
                //        alert(r.responseText);
                //    },
                //    failure: function (r) {
                //        Console.write(r.responseText);
                //        alert(r.responseText);
                //    }
                //});

            });
            
            $("#<%=txtapellidos.ClientID %>").on("blur", function () {
               // alert("apellidos");

                var cedula = $(this).val();
                // Crear objeto con el valor de la cédula
                var data = {
                    cedula: cedula
                };
                //llamada json
                //$.ajax({
                //    type: "POST",
                //    url: "~/servicio.asmx/HelloWorld",
                //  //  data: "{'apellido':'" + $("#txtapellidos").val() + "'}",
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (mgs) {
                //        Result = mgs.d;
                //     //   alert(Result);
                //       // $("#txtName").val(mgs.d);
                //    },
                //    error: function (mgs) {
                //     //   alert(msg.responseText);
                //        Result = mgs.d;
                //      //  alert(Result);
                //    }
                //});
            });


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
                            alert('La cedula '+resultado)
                        }
                       // $('#lblData').html(JSON.stringify(response));
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });

      <%--      $("#<%=btnInsertar.ClientID %>").on("click", function () {
              alert("boton");
                 var cedula = $("#<%=txtcedula.ClientID %>").val();
                 if (cedula == "") {
                     alert("Debe ingresar una cédula.");
                     return false;
                 }
            });--%>
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
                <asp:TextBox ID="txtDatePicker" runat="server"></asp:TextBox> 
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDatePicker" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 195px; text-align: right;">
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" />
                  <input type="button" id="btnCallService" value="GetEmployeeDetail" />
  <label id="lblData"></label>
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

