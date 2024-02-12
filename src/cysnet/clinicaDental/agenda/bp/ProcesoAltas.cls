/// 
Class cysnet.clinicaDental.agenda.bp.ProcesoAltas Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='objReq' type='cysnet.clinicaDental.agenda.msg.AltaRequest' instantiate='0' />
<property name='AdtA03' type='EnsLib.HL7.Message' instantiate='0' />
</context>
<sequence xend='200' yend='750' >
<assign name="Asignar objReq" property="context.objReq" value="request" action="set" xpos='200' ypos='250' />
<call name='Buscar cita' target='CitasSQL' async='0' xpos='200' ypos='350' >
<request type='cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDRequest' >
<assign property="callrequest.idCita" value="request.idCita" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDResponse' >
<assign property="context.objReq.cita" value="callresponse" action="set" />
</response>
</call>
<call name='Buscar paciente' target='PacientesSQL' async='0' xpos='200' ypos='450' >
<request type='cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDRequest' >
<assign property="callrequest.idPaciente" value="context.objReq.cita.idPaciente" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse' >
<assign property="context.objReq.paciente" value="callresponse" action="set" />
</response>
</call>
<transform name='Adt A03' class='cysnet.clinicaDental.agenda.dtl.AdtA03ToHL7DefaultDTL' source='context.objReq' target='context.AdtA03' xpos='200' ypos='550' />
<call name='Guardar HL7' target='OutFileHL7' async='0' xpos='200' ypos='650' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.AdtA03" action="set" />
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
