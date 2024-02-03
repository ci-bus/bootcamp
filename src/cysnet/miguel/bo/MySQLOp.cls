Class cysnet.miguel.bo.MySQLOp Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method crearPersona(pRequest As cysnet.miguel.msg.CrearPersonaRequest, Output pResponse As cysnet.miguel.msg.CrearPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim rs As EnsLib.SQL.GatewayResultSet

    Set pResponse = ##class(cysnet.miguel.msg.CrearPersonaResponse).%New()
    Set pResponse.exito = 1
    Try {
        // Comprobar si el usuario existe
        Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
        Set sql = "SELECT ID FROM Persona WHERE Nombre = ? AND Apellidos = ?"
        Set sc = ..Adapter.ExecuteQuery(.rs, sql, pRequest.nombre, pRequest.apellido)
        If ($$$ISOK(sc)) {
            If (rs.Next(.sc)) {
                Set pResponse.exito = $$$OK
                Set pResponse.mensaje = "El usuario ya existe"
            } Else {
                #dim numRows As %Integer = 0

                Set sql = "INSERT INTO Persona (Nombre, Apellidos, Direccion, CodigoPostal) VALUES (?, ?, ?, ?)"

                Set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.nombre, pRequest.apellido, pRequest.direccion, pRequest.codigoPostal)
                If ($$$ISOK(sc)) {
                    If (numRows = 0) {
                        Set pResponse.exito = 0
                        Set pResponse.error = "No se ha insertado ninguna fila"
                    } Else {
                        // Consultamos los datos insertados
                        Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
                        Set sql = "SELECT ID, Nombre, Apellidos, Direccion, CodigoPostal FROM Persona WHERE Nombre = ? AND Apellidos = ? ORDER BY ID DESC"
                        Set sc = ..Adapter.ExecuteQuery(.rs, sql, pRequest.nombre, pRequest.apellido)
                        If ($$$ISOK(sc)) {
                            If (rs.Next(.sc)) {
                                Set pResponse.idPersona = rs.Get("ID")
                                Set pResponse.nombre = rs.Get("Nombre")
                                Set pResponse.apellido = rs.Get("Apellidos")
                                Set pResponse.direccion = rs.Get("Direccion")
                                Set pResponse.codigoPostal = rs.Get("CodigoPostal")
                            } Else {
                                Set pResponse.exito = 0
                                Set pResponse.error = "Los datos no se han insertado correctamente"
                            }
                        }
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
    #dim rs As EnsLib.SQL.GatewayResultSet

    Set pResponse = ##class(cysnet.miguel.msg.ObtenerPersonaResponse).%New()
    Set pResponse.exito = 1
    Try {
        Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()

        Set sql = "SELECT ID, Nombre, Apellidos, Direccion, CodigoPostal FROM Persona WHERE ID = ?"
        Set sc = ..Adapter.ExecuteQuery(.rs, sql, pRequest.idPersona)
        If ($$$ISOK(sc)) {
            If (rs.Next(.sc)) {
                Quit:$$$ISERR(sc)
                Set pResponse.idPersona = rs.Get("ID")
                Set pResponse.nombre = rs.Get("Nombre")
                Set pResponse.apellido = rs.Get("Apellidos")
                Set pResponse.direccion = rs.Get("Direccion")
                Set pResponse.codigoPostal = rs.Get("CodigoPostal")
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
