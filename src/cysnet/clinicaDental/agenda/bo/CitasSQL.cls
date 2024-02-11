Class cysnet.clinicaDental.agenda.bo.CitasSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Método para cancelar una cita
Method cancelarCita(pRequest As cysnet.clinicaDental.agenda.msg.CancelarCitaRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.CancelarCitaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet

    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.CancelarCitaResponse).%New()

    Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
    Set sql = "SELECT IdCita FROM Cita WHERE IdCita = ?"
    Set sc = ..Adapter.ExecuteQuery(.rs, sql, pRequest.idCita)

    If ($$$ISOK(sc)) {
        If (rs.Next(.sc)) {
            #dim numRows As %Integer
            Set sql = "UPDATE Cita SET CodEstado = 4 WHERE IdCita = ?"
            Set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.idCita)
            If ($$$ISOK(sc)) {
                Set pResponse.exito = (numRows > 0)
                If (pResponse.exito) {
                    Set pResponse.mensaje = "La cita ha sido cancelada"
                } Else {
                    Set pResponse.mensaje = "La cita no se ha podido cancelar"
                }
            } Else {
                Set pResponse.exito = 0
                Set pResponse.mensaje = "Error en sql: "_sql
            }
        } Else {
            Set pResponse.exito = 0
            Set pResponse.mensaje = "No se encontró la cita"
        }
    } Else {
        Set pResponse.exito = 0
        Set pResponse.mensaje = "Error en sql: "_sql
    }
    
    Quit $$$OK
}

Method altaCitas(pRequest As cysnet.clinicaDental.agenda.msg.AltaCitasRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.AltaCitasRespose) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet

    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.AltaCitasRespose).%New()

    Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
    Set sc = ..Adapter.ExecuteQuery(.rs, "SELECT * FROM Cita WHERE IdPaciente = ?", pRequest.idPaciente)
    If ($$$ISOK(sc)) {
        If (rs.Next(.sc)) {
            Set pResponse.exito = 0
            Set pResponse.mensaje = "Ya existe una cita id: "_rs.Get("IdCita")
            Quit sc
        }

        #dim numRows As %Integer = 0
    
        Set sql = "INSERT INTO Cita (IdPaciente, DescCita, FechaCita, CodEstado) VALUES (?,?,?,?) "
        Set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.idPaciente, pRequest.descCita, pRequest.fechaCita, 1)
        If ($$$ISOK(sc)) {
            If (numRows > 0) {
                Set pResponse.mensaje = "La cita se ha creado con éxito"
            } Else {
                Set pResponse.mensaje = "No se ha podido crear la cita"
            }
            Set pResponse.exito = sc
        } Else {
            Set pResponse.mensaje = "Error en consulta: "_sql
            Set pResponse.exito = 0
        }
    } Else {
        Set pResponse.mensaje = "Error en consulta: "_sql
        Set pResponse.exito = 0
    }
    
    Quit numRows
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.clinicaDental.agenda.msg.CancelarCitaRequest">
        <Method>cancelarCita</Method>
    </MapItem>
     <MapItem MessageType="cysnet.clinicaDental.agenda.msg.AltaCitasRequest">
        <Method>altaCitas</Method>
    </MapItem>
</MapItems>
}

}
