Imports System.ComponentModel
Imports System.Data
Imports System.IO
Imports System.Web.Script.Services
Imports System.Web.Services
Imports Newtonsoft.Json


' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Partial Class Crear
    Inherits System.Web.UI.Page

    Private Shared Function SerializarXml(ByVal tabla As DataTable) As String
        Dim retorno = String.Empty
        If tabla Is Nothing Then
            Return retorno
        End If
        Using writer As New StringWriter()
            tabla.WriteXml(writer, XmlWriteMode.WriteSchema, False)
            retorno = writer.ToString()
        End Using
        Return retorno
    End Function

    Private Shared Function SerializarJson(ByVal valor As Object) As String
        Dim retorno = String.Empty
        If valor Is Nothing Then
            Return retorno
        End If
        Return JsonConvert.SerializeObject(valor)
    End Function

    <WebMethod>
    <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function get1(ByVal documentoSustentoId As String) As Object

        Return SerializarJson(documentoSustentoId)
    End Function
    <WebMethod>
    <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function ComprobarRepetido(cedula As String) As Object
        Try
            Console.WriteLine(cedula)

            Return SerializarJson("true")
        Catch ex As Exception
            Return SerializarJson("false")
        End Try
    End Function

    <WebMethod>
    <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function doSomething(apellido As String) As String
        Console.WriteLine(apellido)
        Return SerializarJson(apellido + " holis")
    End Function


    '<WebMethod>
    'Public Shared Function EliminarDocumentoSustento(ByVal detalleId As Integer) As Object
    '    Try
    '        Comprobante.EliminarDetalleDocumentoSustento(detalleId)
    '        Return SerializarJson("true")
    '    Catch ex As Exception
    '        Return SerializarJson("false")
    '    End Try
    'End Function

    Protected Sub btnInsertar_Click(sender As Object, e As EventArgs) Handles btnInsertar.Click
        Dim obj As New procedimientos
        Dim estu As New Estudiante
        Dim res As String

        estu.Cedula = txtcedula.Text
        estu.Apellidos = txtapellidos.Text
        estu.Nombres = txtnombres.Text
        Try
            Dim dt As Date

            Dim fechaOriginal As String = txtDatePicker.Text
            Dim dia As String = fechaOriginal.Substring(0, 2)
            Dim mes As String = fechaOriginal.Substring(3, 2)
            Dim anio As String = fechaOriginal.Substring(6, 4)
            Dim fechaConvertida As String = mes & "/" & dia & "/" & anio
            dt = Convert.ToDateTime(fechaConvertida)
            estu.FechaNac = dt
            res = obj.insertar(estu)
            If res = constantes.Ok Then
                Response.Redirect("/Lista")
            Else
                lblmsj.Text = res
            End If
        Catch ex As Exception
            lblmsj.Text = ex.Message
        End Try


    End Sub
End Class
