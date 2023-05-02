<%@ Page Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="Lista.aspx.vb" Inherits="Lista" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />

    <script type="text/javascript">
        function mostrarVentanaEmergente(titulo, mensaje) {
            var ventana = $('<div></div>');
            ventana.dialog({
                autoOpen: true,
                resizable: false,
                title: titulo,
                modal: true,
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close");
                        __doPostBack('<%= GridView1.ClientID %>', 'Eliminar');
                    },
                    "Cancelar": function () {
                        $(this).dialog("close");
                    }
                }
            });
            ventana.html(mensaje);
        }
    </script>

    <div class="row">
        <div class="col-md-12">
            <div class ="row">
                <div class="col-md-4">
                <h2>Getting started</h2>
                <p>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Crear.aspx">Crear Nuevo</asp:HyperLink>
                </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p>
                    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" >
                            <ItemStyle Width="180px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" >
                            <ItemStyle Width="180px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" />
                            <asp:BoundField DataField="FechaNac" HeaderText="FechaNac" SortExpression="FechaNac" >
                            <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
                            <asp:TemplateField>
                                  <ItemTemplate>
        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" 
            Text="Borrar" OnClientClick="return confirm('¿Está seguro de que desea borrar este registro?');" />
    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField Text="Editar" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/EditarM.aspx?id={0}" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:institutoConnectionString %>" SelectCommand="SELECT * FROM [Estudiantes]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Estudiantes] WHERE [id] = @original_id AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([Apellidos] = @original_Apellidos) OR ([Apellidos] IS NULL AND @original_Apellidos IS NULL)) AND (([Cedula] = @original_Cedula) OR ([Cedula] IS NULL AND @original_Cedula IS NULL)) AND (([FechaNac] = @original_FechaNac) OR ([FechaNac] IS NULL AND @original_FechaNac IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL))" InsertCommand="INSERT INTO [Estudiantes] ([Nombres], [Apellidos], [Cedula], [FechaNac], [edad]) VALUES (@Nombres, @Apellidos, @Cedula, @FechaNac, @edad)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Estudiantes] SET [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Cedula] = @Cedula, [FechaNac] = @FechaNac, [edad] = @edad WHERE [id] = @original_id AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([Apellidos] = @original_Apellidos) OR ([Apellidos] IS NULL AND @original_Apellidos IS NULL)) AND (([Cedula] = @original_Cedula) OR ([Cedula] IS NULL AND @original_Cedula IS NULL)) AND (([FechaNac] = @original_FechaNac) OR ([FechaNac] IS NULL AND @original_FechaNac IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_Nombres" Type="String" />
                            <asp:Parameter Name="original_Apellidos" Type="String" />
                            <asp:Parameter Name="original_Cedula" Type="String" />
                            <asp:Parameter Name="original_FechaNac" Type="DateTime" />
                            <asp:Parameter Name="original_edad" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Nombres" Type="String" />
                            <asp:Parameter Name="Apellidos" Type="String" />
                            <asp:Parameter Name="Cedula" Type="String" />
                            <asp:Parameter Name="FechaNac" Type="DateTime" />
                            <asp:Parameter Name="edad" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Nombres" Type="String" />
                            <asp:Parameter Name="Apellidos" Type="String" />
                            <asp:Parameter Name="Cedula" Type="String" />
                            <asp:Parameter Name="FechaNac" Type="DateTime" />
                            <asp:Parameter Name="edad" Type="Int32" />
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_Nombres" Type="String" />
                            <asp:Parameter Name="original_Apellidos" Type="String" />
                            <asp:Parameter Name="original_Cedula" Type="String" />
                            <asp:Parameter Name="original_FechaNac" Type="DateTime" />
                            <asp:Parameter Name="original_edad" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
