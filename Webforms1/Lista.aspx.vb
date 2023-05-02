
Imports System.Data.Entity.ModelConfiguration.Configuration.Properties

Partial Class Lista
    Inherits System.Web.UI.Page
    Dim id, nombres, apellidos, cedula, fecha As String

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim index As Int32 = GridView1.SelectedIndex
        '' Obtener los datos de la fila seleccionada
        id = GridView1.DataKeys(index).Value.ToString()
        nombres = GridView1.SelectedRow.Cells(1).Text
        apellidos = GridView1.SelectedRow.Cells(2).Text
        cedula = GridView1.SelectedRow.Cells(3).Text
        fecha = GridView1.SelectedRow.Cells(4).Text
    End Sub
End Class
