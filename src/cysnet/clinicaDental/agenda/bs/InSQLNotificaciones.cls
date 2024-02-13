Class cysnet.clinicaDental.agenda.bs.InSQLNotificaciones Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    #dim req as cysnet.clinicaDental.agenda.data.Notificaciones
    #dim rsp As cysnet.miguel.msg.EnviarEmailResponse

    set req = ##class(cysnet.clinicaDental.agenda.data.Notificaciones).%New()
    set req.idNotificacion = pInput.Get("IdNotificacion")
    set req.idPaciente = pInput.Get("IdPaciente")
    set req.asunto = pInput.Get("Asunto")
    set req.mensaje = pInput.Get("Mensaje")
    set req.indEnviada = pInput.Get("IndEnviada")

    quit ..SendRequestSync("ProcesoNotificaciones",req,.rsp)
}

}
