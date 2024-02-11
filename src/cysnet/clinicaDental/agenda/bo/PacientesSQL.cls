Class cysnet.clinicaDental.agenda.bo.PacientesSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Método que crea un paciente
Method NuevoPaciente(pRequest As cysnet.clinicaDental.agenda.msg.NuevoPacienteRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.NuevoPacienteResponse) As %Status
{
  
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet
    
    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.NuevoPacienteResponse).%New()
    Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()

    Set sql = "SELECT IdPaciente FROM Paciente WHERE Email = ? "
    Set sc = ..Adapter.ExecuteQuery(.rs, sql, pRequest.email)

    If ($$$ISOK(sc)) {
        If (rs.Next(.sc)) {
            Set pResponse.mensaje = "Ya existe"
        } Else {
            #dim numRows As %Integer = 0

            Set sql = "INSERT INTO Paciente (Apellidos,Baja,Email,Nombre,PermiteNotificaciones) VALUES (?, ?, ?, ?, ?)"
            Set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.apellidos, 0, pRequest.email, pRequest.nombre, 1)
            
            If ($$$ISOK(sc)) {
                Set pResponse.exito = (numRows > 0)
                If (pResponse.exito) {
                    Set pResponse.mensaje = "El paciente se ha creado con éxito"
                } Else {
                    Set pResponse.mensaje = "No se ha podido insertar"
                }
            } Else {
                Set pResponse.exito = 0
                Set pResponse.mensaje = "Error en consulta: "_sql
            }
        }
    } Else {
        Set pResponse.exito = 0
        Set pResponse.mensaje = "Error en consulta: "_sql
    }
    Return $$$OK
}

/// Método que da de baja un paciente por id
Method BajaPaciente(pRequest As cysnet.clinicaDental.agenda.msg.BajaPacienteRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.BajaPacienteResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet
    
    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.BajaPacienteResponse).%New()
    Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()

    #dim numRows As %Integer = 0

    Set sql = "UPDATE Paciente SET Baja = 1 WHERE IdPaciente = ?"
    Set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.ID)
    
    If ($$$ISOK(sc)) {
        Set pResponse.exito = (numRows > 0)
        If (pResponse.exito) {
            Set pResponse.mensaje = "El paciente ha sido dado de baja"
        } Else {
            Set pResponse.mensaje = "No se ha podido dar de baja"
        }
    } Else {
        Set pResponse.exito = 0
        Set pResponse.mensaje = "Error en consulta: "_sql
    }

    Return $$$OK
}

/// Método que obtiene los datos de un paciente a partir de su ID
Method BuscarPacientePorID(pRequest As cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet

    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse).%New()
    Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()

    #dim numRows As %Integer = 0

    Set sql = "SELECT IdPaciente, Nombre, Apellidos, Email, Baja, PermiteNotificaciones FROM Paciente WHERE IdPaciente = ?"
    Set sc = ..Adapter.ExecuteQuery(.rs, sql, pRequest.idPaciente)

    If ($$$ISOK(sc)) {
        If (rs.Next(.sc)) {
            Set pResponse.exito = 1
            Set pResponse.idPaciente = rs.Get("IdPaciente")
            Set pResponse.nombre = rs.Get("Nombre")
            Set pResponse.apellidos = rs.Get("Apellidos")
            Set pResponse.email = rs.Get("Email")
            Set pResponse.baja = rs.Get("Baja")
            Set pResponse.permiteNotificaciones = rs.Get("PermiteNotificaciones")
            Set pResponse.mensaje = "Paciente encontrado"
        } Else {
            Set pResponse.mensaje = "No existen datos para ese identificador ("_pRequest.idPaciente_")"
        }
    } Else {
        Set pResponse.exito = 0
        Set pResponse.mensaje = "Error en la consulta: "_sql
    }
    
    Quit $$$OK
}

/// Método que obtiene los datos de un paciente a partir de su ID
Method ListarPacientes(pRequest As cysnet.clinicaDental.agenda.msg.ListarPacientesRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.ListarPacientesResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet

    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.ListarPacientesResponse).%New()
    Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()

    Set pacientes = ##class(%ListOfObjects).%New()

    Set sql = "SELECT IdPaciente, Nombre, Apellidos, Email, Baja, PermiteNotificaciones FROM Paciente"
    Set sc = ..Adapter.ExecuteQuery(.rs, sql)
    If ($$$ISOK(sc)) {
        Set pResponse.exito = 1
        While rs.Next(.sc) {
            Set paciente = ##class(cysnet.clinicaDental.agenda.data.Pacientes).%New()
            Set paciente.idPaciente = rs.Get("IdPaciente")
            Set paciente.nombre = rs.Get("Nombre")
            Set paciente.apellidos = rs.Get("Apellidos")
            Set paciente.email = rs.Get("Email")
            Set paciente.baja = rs.Get("Baja")
            Set paciente.permiteNotificaciones = rs.Get("PermiteNotificaciones")
            Do pacientes.Insert(paciente)
        }
        Set pResponse.pacientes = pacientes
    } Else {
        Set pResponse.exito = 0
        Set pResponse.mensaje = "Error en la consulta: "_sql
    }
    
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.clinicaDental.agenda.msg.NuevoPacienteRequest">
        <Method>NuevoPaciente</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.agenda.msg.BajaPacienteRequest">
        <Method>BajaPaciente</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDRequest">
        <Method>BuscarPacientePorID</Method>
    </MapItem>
    <MapItem MessageType="cysnet.clinicaDental.agenda.msg.ListarPacientesRequest">
        <Method>ListarPacientes</Method>
    </MapItem>
</MapItems>
}

}
