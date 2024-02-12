Class cysnet.clinicaDental.agenda.bo.NotificacionesSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Método que crea una notificación
Method NuevaNotificacion(pRequest As cysnet.clinicaDental.agenda.msg.NuevaNotificacionRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.NuevaNotificacionResponse) As %Status
{
    #dim sc As %Status = $$$OK
    
    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.NuevaNotificacionResponse).%New()
    #dim numRows As %Integer
    Set sql = "INSERT INTO Notificacion (IdPaciente, Asunto, Mensaje, IndEnviada) VALUES (?, ?, ?, ?)"
    Set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.idPaciente, pRequest.asunto, pRequest.mensaje, 0)
    
    If ($$$ISOK(sc)) {
        Set pResponse.exito = (numRows > 0)
        If (pResponse.exito) {
            Set pResponse.mensaje = "La notificación se ha creado con éxito"
        } Else {
            Set pResponse.mensaje = "No se ha podido crear la notificación"
        }
    } Else {
        Set pResponse.exito = 0
        Set pResponse.mensaje = "Error en consulta: "_sql
    }

    Return $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.clinicaDental.agenda.msg.NuevaNotificacionRequest">
        <Method>NuevaNotificacion</Method>
    </MapItem>
</MapItems>
}

}
