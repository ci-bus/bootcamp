Class cysnet.miguel.bo.DBCache Extends Ens.BusinessOperation
{

Method crearPersona(pRequest As cysnet.miguel.msg.CrearPersonaRequest, Output pResponse As cysnet.miguel.msg.CrearPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult

    Set pResponse = ##class(cysnet.miguel.msg.CrearPersonaResponse).%New()
    Set pResponse.exito = 1
    try {
        Set stm = ##class(%SQL.Statement).%New()
        &sql(INSERT INTO cysnet_miguel_data.Persona (apellido, nombre) VALUES (:pRequest.nombre, :pRequest.apellido))
        &sql(SELECT LAST_IDENTITY() INTO :insertID FROM cysnet_miguel_data.Persona)
        if ($$$ISOK(sc)) {
            Set rs = stm.%Execute(pRequest.apellido, pRequest.nombre)

            If (insertID > 0) {
                Set pResponse.idPersona = insertID
                Set pResponse.nombre = pRequest.nombre
                Set pResponse.apellido = pRequest.apellido
                Set pResponse.mensaje = "Registro creado con éxito!"
            } Else {
                Set pResponse.mensaje = "No se ha podido crear ("_pRequest.nombre_" "_pRequest.apellido_")"
            }
        }
    } catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
        if (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            set sc = err.status
        } else {
            set sc = $System.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }

    if ($$$ISERR(sc)) {
        set pResponse.exito = 0
        set pResponse.error = $System.Status.GetErrorText(sc)
    }
    
    Quit sc
}

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.miguel.msg.ObtenerPersonaRequest, Output pResponse As cysnet.miguel.msg.ObtenerPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult

    Set pResponse = ##class(cysnet.miguel.msg.ObtenerPersonaResponse).%New()
    Set pResponse.exito = 1
    try {
        Set stm = ##class(%SQL.Statement).%New()
        set sc = stm.%Prepare("SELECT nombre, apellido FROM cysnet_miguel_data.Persona WHERE ID = "_pRequest.idPersona)
        if ($$$ISOK(sc)) {
            Set rs = stm.%Execute()

            If (rs.%Next(.sc)) {
                Set pResponse.nombre = rs.nombre
                Set pResponse.apellido = rs.apellido
            } Else {
                Set pResponse.mensaje = "No existen datos para ese identificador ("_pRequest.idPersona_")"
            }
        }
    } catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
        if (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            set sc = err.status
        } else {
            set sc = $System.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }

    if ($$$ISERR(sc)) {
        set pResponse.exito = 0
        set pResponse.error = $System.Status.GetErrorText(sc)
    }
    
    Quit sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.miguel.msg.CrearPersonaRequest">
        <Method>crearPersona</Method>
    </MapItem>
    <MapItem MessageType="cysnet.miguel.msg.ObtenerPersonaRequest">
        <Method>obtenerPersona</Method>
    </MapItem>
</MapItems>
}

}
