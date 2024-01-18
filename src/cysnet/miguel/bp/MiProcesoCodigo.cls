Class cysnet.miguel.bp.MiProcesoCodigo Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As cysnet.miguel.msg.ObtenerPersonaRequest, Output pResponse As cysnet.miguel.msg.ObtenerPersonaResponse) As %Status
{
    set pResponse = ##class(cysnet.miguel.msg.ObtenerPersonaResponse).%New()

    if (pRequest.idPersona > 0) {
        do ..SendRequestSync("DBCache", pRequest, .pResponse)
    }

    quit $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
