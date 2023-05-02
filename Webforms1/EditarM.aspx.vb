
Partial Class EditarM
    Inherits System.Web.UI.Page

    Dim est As Estudiante
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim id As String = Request.QueryString("id")
            lblId.Text = id
            If IsNumeric(id) Then
                Dim obj As New procedimientos
                est = obj.Consultar(id)
                If est.Cedula <> "" Then
                    txtapellidos.Text = est.Apellidos
                    txtnombres.Text = est.Nombres
                    txtcedula.Text = est.Cedula
                    txtDatePicker.Text = est.FechaNac.ToShortDateString
                    txtedad.Text = est.edad.ToString
                End If
            End If
        End If
    End Sub

    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs) Handles btnActualizar.Click
        Dim obj As New procedimientos
        Dim estu As New Estudiante
        Dim res As String
        If Trim(lblId.Text) <> "" Then
            estu.Cedula = txtcedula.Text
            estu.id = lblId.Text
            estu.Apellidos = txtapellidos.Text
            estu.Nombres = txtnombres.Text
            estu.FechaNac = txtDatePicker.Text

            res = obj.Actualizar(estu)
            If res = constantes.Ok Then
                Response.Redirect("/Lista")
            Else
                lblmsj.Text = res
            End If
        Else
            lblmsj.Text = "Id vacio, no hay datos"

        End If
    End Sub
End Class
