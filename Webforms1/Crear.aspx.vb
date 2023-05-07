
Imports System.EnterpriseServices

Partial Class Crear
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim fecha As Date
            fecha = CDate(Now)
            Dim dia As String = fecha.Day.ToString()
            If fecha.Day < 10 Then
                dia = "0" + dia
            End If

            Dim mes As String = fecha.Month.ToString()
            If fecha.Month < 10 Then
                mes = "0" + mes
            End If
            Dim anio As Int32
            anio = fecha.Year - 20
            'Formatea la fecha (por ejemplo, "dd/mm/yyyy")
            Dim fechaFormateada As String = anio.ToString() + "-" + mes + "-" + dia
            'Asigna el valor formateado al control de entrada de fecha
            txtDatePicker.Text = fechaFormateada
        End If
    End Sub

    Protected Sub btnInsertar_Click(sender As Object, e As EventArgs) Handles btnInsertar.Click
        Dim obj As New procedimientos
        Dim estu As New Estudiante
        Dim res As String

        estu.Cedula = txtcedula.Text
        estu.Apellidos = txtapellidos.Text
        estu.Nombres = txtnombres.Text
        estu.FechaNac = txtDatePicker.Text

        res = obj.insertar(estu)
        If res = constantes.Ok Then
            Response.Redirect("/Lista")
        Else
            lblmsj.Text = res
        End If

    End Sub


End Class
