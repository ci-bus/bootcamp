Class cysnet.miguel.bo.DBCache Extends Ens.BusinessOperation
{

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.miguel.msg.ObtenerPersonaRequest, Output pResponse As cysnet.miguel.msg.ObtenerPersonaResponse) As %Status
{
    set pResponse = ##class(cysnet.miguel.msg.ObtenerPersonaResponse).%New()

    set stm = ##class(%SQL.Statement).%New()
    do stm.%Prepare("SELECT nombre, apellido FROM cysnet_miguel_ws_data.Persona WHERE ID = "_pRequest.idPersona)

    set rs = stm.%Execute()

    if (rs.%Next()) {
        set pResponse.nombre = rs.nombre
        set pResponse.apellido = rs.apellido
    } else {
        set pResponse.mensaje = "No existen datos para ese identificador ("_pRequest.idPersona_")"
    }
    
    quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.miguel.msg.ObtenerPersonaRequest">
        <Method>obtenerPersona</Method>
    </MapItem>
</MapItems>
}

}
