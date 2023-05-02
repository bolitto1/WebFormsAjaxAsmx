<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Editar3.aspx.vb" Inherits="Editar3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <br />
</p>
<p>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
            <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" />
            <asp:BoundField DataField="FechaNac" HeaderText="FechaNac" SortExpression="FechaNac" />
            <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:institutoConnectionString %>" DeleteCommand="DELETE FROM [Estudiantes] WHERE [id] = @original_id AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([Apellidos] = @original_Apellidos) OR ([Apellidos] IS NULL AND @original_Apellidos IS NULL)) AND (([Cedula] = @original_Cedula) OR ([Cedula] IS NULL AND @original_Cedula IS NULL)) AND (([FechaNac] = @original_FechaNac) OR ([FechaNac] IS NULL AND @original_FechaNac IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL))" InsertCommand="INSERT INTO [Estudiantes] ([Nombres], [Apellidos], [Cedula], [FechaNac], [edad]) VALUES (@Nombres, @Apellidos, @Cedula, @FechaNac, @edad)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Estudiantes] WHERE ([id] = @id)" UpdateCommand="UPDATE [Estudiantes] SET [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Cedula] = @Cedula, [FechaNac] = @FechaNac, [edad] = @edad WHERE [id] = @original_id AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([Apellidos] = @original_Apellidos) OR ([Apellidos] IS NULL AND @original_Apellidos IS NULL)) AND (([Cedula] = @original_Cedula) OR ([Cedula] IS NULL AND @original_Cedula IS NULL)) AND (([FechaNac] = @original_FechaNac) OR ([FechaNac] IS NULL AND @original_FechaNac IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL))">
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
            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="id" Type="Int32" />
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
</asp:Content>

