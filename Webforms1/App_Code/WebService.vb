Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Services
Imports System.Web.Script.Serialization
Imports System.Web.Script.Services

'mejorado
' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<System.ComponentModel.ToolboxItem(False)>
<ScriptService>
Public Class WebService
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Function HelloWorld() As String
        Return "Hola a todos"
    End Function


    <WebMethod>
    Public Function CedulaRepetida(ByVal cedu As String) As String
        Dim obj As New procedimientos
        Dim res As String
        res = obj.ConsultarRepetidoN(cedu)
        Return res
    End Function

End Class