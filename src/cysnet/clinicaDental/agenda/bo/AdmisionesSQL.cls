Class cysnet.clinicaDental.agenda.bo.AdmisionesSQL Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Método que registra una admision
Method NuevaAdmision(pRequest As cysnet.clinicaDental.agenda.msg.NuevaAdmisionRequest, Output pResponse As cysnet.clinicaDental.agenda.msg.NuevaAdmisionResponse) As %Status
{
    #dim sc As %Status = $$$OK
    
    Set pResponse = ##class(cysnet.clinicaDental.agenda.msg.NuevaAdmisionResponse).%New()
    #dim numRows As %Integer
    Set sql = "INSERT INTO Admision (IdCita, FechaAdmision, IndEnviada) VALUES (?, ?, ?)"
    Set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.idCita, pRequest.fechaAdmision, pRequest.indEnviada)
    
    If ($$$ISOK(sc)) {
        Set pResponse.exito = (numRows > 0)
        If (pResponse.exito) {
            Set pResponse.mensaje = "La admision se ha creado con éxito"
        } Else {
            Set pResponse.mensaje = "No se ha podido crear la admision"
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
    <MapItem MessageType="cysnet.clinicaDental.agenda.msg.NuevaAdmisionRequest">
        <Method>NuevaAdmision</Method>
    </MapItem>
</MapItems>
}

}
