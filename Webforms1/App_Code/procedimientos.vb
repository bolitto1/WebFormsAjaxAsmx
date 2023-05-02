Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlTypes
Imports System.Diagnostics


Public Class procedimientos

    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim sql As String
    Dim cadena As String
    Public Function conectar() As String
        cadena = System.Configuration.ConfigurationManager.ConnectionStrings("institutoConnectionString").ConnectionString
        Console.WriteLine(cadena)
        Debug.WriteLine(cadena)
        If (String.IsNullOrEmpty(cadena)) Then
            Return "No hay cadena de conexion"
        End If
        conn = New SqlConnection(cadena)
        Try
            If conn.State <> ConnectionState.Open Then
                conn.Open()
                Return constantes.Ok
            End If
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function


    Public Function ConsultarRepetido(cedula1 As String) As String
        Dim res As String
        sql = "SELECT *  FROM [instituto].[dbo].[Estudiantes] where cedula='" + Trim(cedula1) + "'"
        Dim ds As New Data.DataSet
        Dim tabla As New Data.DataTable
        Dim da As SqlDataAdapter

        da = New SqlDataAdapter(sql, conn)
        Try
            da.Fill(ds, "Estudiantes")
            If ds.Tables(0).Rows.Count > 0 Then
                tabla = ds.Tables(0)
                res = "ya existe: " + tabla.Rows(0).Item("Nombres") + " " + tabla.Rows(0).Item("Apellidos")
            Else
                res = constantes.Ok
            End If
        Catch ex As Exception
            res = ex.Message
        End Try
        Return res
    End Function


    Public Function ConsultarRepetidoN(cedula1 As String) As String
        Dim resultado As String = constantes.Ok
        If conectar() = constantes.Ok Then
            resultado = ConsultarRepetido(cedula1)
            ''ok significa que no esta repedio
        End If
        Return resultado
    End Function




    Public Function Consultar(id As String) As Estudiante
        Dim est As New Estudiante
        If conectar() = constantes.Ok Then
            sql = "SELECT *  FROM [instituto].[dbo].[Estudiantes] where id=" + Trim(id)
            Dim ds As New Data.DataSet
            Dim tabla As New Data.DataTable
            Dim da As SqlDataAdapter
            da = New SqlDataAdapter(sql, conn)
            Try
                da.Fill(ds, "Estudiantes")
                If ds.Tables(0).Rows.Count > 0 Then
                    tabla = ds.Tables(0)
                    est.Nombres = tabla.Rows(0).Item("Nombres")
                    est.Apellidos = tabla.Rows(0).Item("Apellidos")
                    est.Cedula = tabla.Rows(0).Item("Cedula")
                    est.FechaNac = tabla.Rows(0).Item("FechaNac")
                    est.edad = tabla.Rows(0).Item("edad")
                Else
                    est.Cedula = ""
                    est.error1 = "No existe"
                End If
            Catch ex As Exception
                est.error1 = ex.Message
            End Try
        End If
        Return est
    End Function


    Public Function insertar(est As Estudiante) As String
        Dim resultado As String = "Error"
        Dim daysAgo = DateDiff(DateInterval.Day, est.FechaNac.Date, Now.Date,)
        Dim edad1 As Double
        Dim res As Integer
        edad1 = Math.Floor(daysAgo / 365.25)
        est.edad = edad1

        If conectar() = constantes.Ok Then
            resultado = ConsultarRepetido(est.Cedula)
            If resultado = constantes.Ok Then
                sql = "INSERT INTO [dbo].[Estudiantes]
                   ([Nombres]
                   ,[Apellidos]
                   ,[Cedula]
                   ,[FechaNac]
                   ,[edad])
                     VALUES
                    ('" + est.Nombres + "'" +
                    ",'" + est.Apellidos + "'" +
                    ",'" + est.Cedula + "'" +
                    ",CONVERT(DATETIME , '" + est.FechaNac.ToString("yyyy/MM/dd") + "', 120)" +
                    "," + est.edad.ToString + ")"
                cmd = New SqlCommand(sql, conn)
                Try
                    res = cmd.ExecuteNonQuery
                    If res = 1 Then
                        resultado = constantes.Ok
                    End If
                Catch ex As Exception
                    resultado = ex.Message
                End Try
            End If
        End If
        Return resultado
    End Function


    Public Function Actualizar(est As Estudiante) As String
        Dim resultado As String = "Error"
        Dim daysAgo = DateDiff(DateInterval.Day, est.FechaNac.Date, Now.Date,)
        Dim edad1 As Double
        Dim res As Integer
        edad1 = Math.Floor(daysAgo / 365.25)
        est.edad = edad1

        If conectar() = constantes.Ok Then
            sql = "UPDATE [dbo].[Estudiantes]
                   SET [Nombres] = '" + est.Nombres + "'" +
                  ",[Apellidos] ='" + est.Apellidos + "'" +
                  ",[Cedula] = '" + est.Cedula.Trim + "'" +
                  ",[FechaNac] =" + "CONVERT(DATETIME , '" + est.FechaNac.ToString("yyyy/MM/dd") + "', 120)" +
                  ",[edad] = " + est.edad.ToString +
                    " WHERE id =" + est.id.ToString

            cmd = New SqlCommand(sql, conn)
            Try
                res = cmd.ExecuteNonQuery
                If res = 1 Then
                    resultado = constantes.Ok
                End If
            Catch ex As Exception
                resultado = ex.Message
            End Try
        End If
        Return resultado
    End Function


End Class
