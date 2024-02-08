/// 
Class cysnet.miguel.bp.ProcesoAltaPaciente Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='cysnet.miguel.msg.AltaPacienteRequest' response='cysnet.miguel.msg.AltaPacienteResponse' height='2000' width='2000' >
<context>
<property name='InfoAltaPaciente' type='cysnet.miguel.msg.struct.InfoAltaPaciente' instantiate='0' />
<property name='mensajeHL7' type='EnsLib.HL7.Message' instantiate='0' />
</context>
<sequence xend='200' yend='750' >
<assign name="asignar id persona" property="context.InfoAltaPaciente.idPersona" value="request.idPersona" action="set" xpos='200' ypos='250' />
<assign name="asignar fecha alta" property="context.InfoAltaPaciente.fechaAlta" value="request.fechaAlta" action="set" xpos='200' ypos='350' />
<call name='Obtener Persona' target='MiServicioSoap' async='0' xpos='200' ypos='450' >
<request type='cysnet.miguel.ws.MiServicio.req.obtenerPersonaRequest' >
<assign property="callrequest.idPersona" value="request.idPersona" action="set" />
</request>
<response type='cysnet.miguel.ws.MiServicio.rsp.obtenerPersonaResponse' >
<assign property="context.InfoAltaPaciente.nombre" value="callresponse.obtenerPersonaResult.nombre" action="set" />
<assign property="context.InfoAltaPaciente.apellido" value="callresponse.obtenerPersonaResult.apellido" action="set" />
</response>
</call>
<transform name='transformar hl7' class='cysnet.miguel.dtl.InfoAltaPacienteToADTA03' source='context.InfoAltaPaciente' target='context.mensajeHL7' xpos='200' ypos='550' />
<call name='Enviar hl7' target='OutFileHL7' async='0' xpos='200' ypos='650' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.mensajeHL7" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
