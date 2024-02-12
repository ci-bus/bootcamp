Class cysnet.clinicaDental.agenda.bs.InSQLAltas Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    #dim req as cysnet.clinicaDental.agenda.msg.AltaRequest
    #dim rsp As cysnet.clinicaDental.agenda.msg.AltaResponse

    set req = ##class(cysnet.clinicaDental.agenda.msg.AltaRequest).%New()
    set req.idAlta = pInput.Get("IdAlta")
    set req.idCita = pInput.Get("IdCita")
    set req.fechaAlta = pInput.Get("FechaAlta")
    set req.indEnviada = pInput.Get("IndEnviada")

    quit ..SendRequestSync("ProcesoAltas",req,.rsp)
}

}
