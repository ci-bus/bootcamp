Class cysnet.clinicaDental.agenda.bo.AltasSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Método que registra un alta
Method NuevaAlta(pRequest As cysnet.clinicaDental.agenda.msg.NuevaAltaRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.NuevaAltaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    
    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.NuevaAltaResponse).%New()
    #dim numRows As %Integer
    Set sql = "INSERT INTO Alta (IdCita, FechaAlta, IndEnviada) VALUES (?, ?, ?)"
    Set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.idCita, pRequest.fechaAlta, pRequest.indEnviada)
    
    If ($$$ISOK(sc)) {
        Set pResponse.exito = (numRows > 0)
        If (pResponse.exito) {
            Set pResponse.mensaje = "El alta se ha creado con éxito"
        } Else {
            Set pResponse.mensaje = "No se ha podido crear el alta"
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
    <MapItem MessageType="cysnet.clinicaDental.agenda.msg.NuevaAltaRequest">
        <Method>NuevaAlta</Method>
    </MapItem>
</MapItems>
}

}
