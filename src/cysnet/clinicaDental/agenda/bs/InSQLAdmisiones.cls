Class cysnet.clinicaDental.agenda.bs.InSQLAdmisiones Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    #dim req as cysnet.clinicaDental.agenda.msg.AdmisionRequest
    #dim rsp As cysnet.clinicaDental.agenda.msg.AdmisionResponse

    set req = ##class(cysnet.clinicaDental.agenda.msg.AdmisionRequest).%New()
    set req.idAdmision = pInput.Get("IdAdmision")
    set req.idCita = pInput.Get("IdCita")
    set req.fechaAdmision = pInput.Get("FechaAdmision")
    set req.indEnviada = pInput.Get("IndEnviada")

    quit ..SendRequestSync("ProcesoAdmisiones",req,.rsp)
}

}
