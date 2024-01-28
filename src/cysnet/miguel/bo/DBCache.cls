Class cysnet.miguel.bo.DBCache Extends Ens.BusinessOperation
{

Method crearPersona(pRequest As cysnet.miguel.msg.CrearPersonaRequest, Output pResponse As cysnet.miguel.msg.CrearPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult

    Set pResponse = ##class(cysnet.miguel.msg.CrearPersonaResponse).%New()
    Set pResponse.exito = 1
    Try {
        // Comprobar si el usuario existe
        Set stm = ##class(%SQL.Statement).%New()
        Set sc = stm.%Prepare("SELECT ID FROM cysnet_miguel_data.Persona WHERE nombre = '"_pRequest.nombre_"' AND apellido = '"_pRequest.apellido_"'")
                
        If ($$$ISOK(sc)) {
            Set rs = stm.%Execute()
            If (rs.%Next(.sc)) {
                Set pResponse.exito = $$$OK
                Set pResponse.mensaje = "El usuario ya existe"
            } Else {
                Set stm = ##class(%SQL.Statement).%New()
                &sql(INSERT INTO cysnet_miguel_data.Persona (nombre, apellido, direccion, codigoPostal) VALUES (:pRequest.nombre, :pRequest.apellido, :pRequest.direccion, :pRequest.codigoPostal))
                &sql(SELECT LAST_IDENTITY() INTO :insertID FROM cysnet_miguel_data.Persona)
                If ($$$ISOK(sc)) {
                    Set rs = stm.%Execute(pRequest.apellido, pRequest.nombre, pRequest.direccion, pRequest.codigoPostal)

                    If (insertID > 0) {
                        Set pResponse.idPersona = insertID
                        Set pResponse.nombre = pRequest.nombre
                        Set pResponse.apellido = pRequest.apellido
                        Set pResponse.mensaje = "Registro creado con éxito!"
                    } Else {

                        Set pResponse.mensaje = "No se ha podido crear ("_pRequest.nombre_" "_pRequest.apellido_")"
                    }
                }
            }
        }
    } Catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
        If (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            Set sc = err.status
        } Else {
            Set sc = $SYSTEM.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }

    If ($$$ISERR(sc)) {
        Set pResponse.exito = 0
        Set pResponse.error = $SYSTEM.Status.GetErrorText(sc)
    }
    
    Quit $$$OK
}

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.miguel.msg.ObtenerPersonaRequest, Output pResponse As cysnet.miguel.msg.ObtenerPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult

    Set pResponse = ##class(cysnet.miguel.msg.ObtenerPersonaResponse).%New()
    Set pResponse.exito = 1
    Try {
        Set stm = ##class(%SQL.Statement).%New()
        Set sc = stm.%Prepare("SELECT ID, nombre, apellido, direccion, codigoPostal FROM cysnet_miguel_data.Persona WHERE ID = "_pRequest.idPersona)
        If ($$$ISOK(sc)) {
            Set rs = stm.%Execute()

            If (rs.%Next(.sc)) {
                Set pResponse.idPersona = rs.ID
                Set pResponse.nombre = rs.nombre
                Set pResponse.apellido = rs.apellido
                Set pResponse.direccion = rs.direccion
                Set pResponse.codigoPostal = rs.codigoPostal
            } Else {
                Set pResponse.mensaje = "No existen datos para ese identificador ("_pRequest.idPersona_")"
            }
        }
    } Catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
        If (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            Set sc = err.status
        } Else {
            Set sc = $SYSTEM.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }

    If ($$$ISERR(sc)) {
        Set pResponse.exito = 0
        Set pResponse.error = $SYSTEM.Status.GetErrorText(sc)
    }
    
    Quit $$$OK
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
