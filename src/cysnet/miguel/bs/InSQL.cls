Class cysnet.miguel.bs.InSQL Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    #dim req as cysnet.miguel.msg.AltaPacienteRequest
    #dim rsp As cysnet.miguel.msg.AltaPacienteResponse

    set req = ##class(cysnet.miguel.msg.AltaPacienteRequest).%New()
    set req.idRegistro = pInput.Get("ID")
    set req.idPersona = pInput.Get("IdPersona")
    set req.fechaAlta = pInput.Get("FechaAlta")

    quit ..SendRequestSync("ProcesoAltaPaciente",req,.rsp)
}

}
