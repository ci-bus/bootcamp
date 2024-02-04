/// 
Class cysnet.miguel.bp.ProcesoAltaPaciente Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='cysnet.miguel.msg.AltaPacienteRequest' response='cysnet.miguel.msg.AltaPacienteResponse' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<call name='Obtener Persona' target='MiServicioSoap' async='0' xpos='200' ypos='250' >
<request type='cysnet.miguel.ws.MiServicio.req.obtenerPersonaRequest' >
<assign property="callrequest.idPersona" value="request.idPersona" action="set" />
</request>
<response type='cysnet.miguel.ws.MiServicio.rsp.obtenerPersonaResponse' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
