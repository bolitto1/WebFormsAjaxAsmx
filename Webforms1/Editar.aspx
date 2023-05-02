<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Editar.aspx.vb" Inherits="Editar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        Editar</p>
    <p>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Edit" ForeColor="#333333">
            <EditItemTemplate>
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />
                Nombres:
                <asp:TextBox ID="NombresTextBox" runat="server" Text='<%# Bind("Nombres") %>' />
                <br />
                Apellidos:
                <asp:TextBox ID="ApellidosTextBox" runat="server" Text='<%# Bind("Apellidos") %>' />
                <br />
                Cedula:
                <asp:TextBox ID="CedulaTextBox" runat="server" Text='<%# Bind("Cedula") %>' />
                <br />
                FechaNac:
                <asp:TextBox ID="FechaNacTextBox" runat="server" Text='<%# Bind("FechaNac") %>' />
                <br />
                edad:
                <asp:TextBox ID="edadTextBox" runat="server" Text='<%# Bind("edad") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" PostBackUrl="~/Lista.aspx"  />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" PostBackUrl="~/Lista.aspx"  />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                Nombres:
                <asp:TextBox ID="NombresTextBox" runat="server" Text='<%# Bind("Nombres") %>' />
                <br />
                Apellidos:
                <asp:TextBox ID="ApellidosTextBox" runat="server" Text='<%# Bind("Apellidos") %>' />
                <br />
                Cedula:
                <asp:TextBox ID="CedulaTextBox" runat="server" Text='<%# Bind("Cedula") %>' />
                <br />
                FechaNac:
                <asp:TextBox ID="FechaNacTextBox" runat="server" Text='<%# Bind("FechaNac") %>' />
                <br />
                edad:
                <asp:TextBox ID="edadTextBox" runat="server" Text='<%# Bind("edad") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                Nombres:
                <asp:Label ID="NombresLabel" runat="server" Text='<%# Bind("Nombres") %>' />
                <br />
                Apellidos:
                <asp:Label ID="ApellidosLabel" runat="server" Text='<%# Bind("Apellidos") %>' />
                <br />
                Cedula:
                <asp:Label ID="CedulaLabel" runat="server" Text='<%# Bind("Cedula") %>' />
                <br />
                FechaNac:
                <asp:Label ID="FechaNacLabel" runat="server" Text='<%# Bind("FechaNac") %>' />
                <br />
                edad:
                <asp:Label ID="edadLabel" runat="server" Text='<%# Bind("edad") %>' />
                <br />

                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />

                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />

            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:institutoConnectionString %>" SelectCommand="SELECT * FROM [Estudiantes] WHERE ([id] = @id)" UpdateCommand="UPDATE [Estudiantes] SET [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Cedula] = @Cedula, [FechaNac] = @FechaNac, [edad] = @edad WHERE [id] = @original_id AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([Apellidos] = @original_Apellidos) OR ([Apellidos] IS NULL AND @original_Apellidos IS NULL)) AND (([Cedula] = @original_Cedula) OR ([Cedula] IS NULL AND @original_Cedula IS NULL)) AND (([FechaNac] = @original_FechaNac) OR ([FechaNac] IS NULL AND @original_FechaNac IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL))" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Estudiantes] WHERE [id] = @original_id AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([Apellidos] = @original_Apellidos) OR ([Apellidos] IS NULL AND @original_Apellidos IS NULL)) AND (([Cedula] = @original_Cedula) OR ([Cedula] IS NULL AND @original_Cedula IS NULL)) AND (([FechaNac] = @original_FechaNac) OR ([FechaNac] IS NULL AND @original_FechaNac IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL))" InsertCommand="INSERT INTO [Estudiantes] ([Nombres], [Apellidos], [Cedula], [FechaNac], [edad]) VALUES (@Nombres, @Apellidos, @Cedula, @FechaNac, @edad)" OldValuesParameterFormatString="original_{0}">
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
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
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
<script>  
$(function ()  
{  
    $('#FechaNacTextBox').datepicker(  
    {  
        dateFormat: 'dd/mm/yy',  
        changeMonth: true,  
        changeYear: true,  
        yearRange: '1950:2100'  
    });  
})  
</script> 
</asp:Content>


