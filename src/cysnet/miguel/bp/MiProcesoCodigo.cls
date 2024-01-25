Class cysnet.miguel.bp.MiProcesoCodigo Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    #dim sc As %Status = $$$OK
    If (pRequest.%ClassName() = "CrearPersonaRequest") {
        Set pResponse = ##class(cysnet.miguel.msg.CrearPersonaResponse).%New()
        
        Do ..SendRequestSync("DBCache", pRequest, .pResponse)
    } ElseIf (pRequest.%ClassName() = "ObtenerPersonaRequest") {
        Set pResponse = ##class(cysnet.miguel.msg.ObtenerPersonaResponse).%New()

        If (pRequest.idPersona > 0) {
            Do ..SendRequestSync("DBCache", pRequest, .pResponse)
        }

    }

        Quit sc
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
