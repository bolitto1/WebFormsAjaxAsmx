Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Services
Imports System.Web.Script.Serialization
Imports System.Web.Script.Services

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _

<WebService(Namespace:="http://tempuri.org/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<System.ComponentModel.ToolboxItem(False)>
<ScriptService>
Public Class HelloService
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function

    <WebMethod()>
    Public Function GetEmployeeDetail() As Employee
        Dim objEmp As New Employee()
        objEmp.EmpFirstName = "Tech"
        objEmp.EmpLastName = "Illumination"
        Return objEmp
    End Function
End Class

Public Class Employee
    Public Property EmpFirstName As String
    Public Property EmpLastName As String

End Class