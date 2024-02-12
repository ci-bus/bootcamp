/// 
Class cysnet.clinicaDental.bp.ProcesoCitas Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='cysnet.clinicaDental.agenda.msg.GenericResponse' height='2350' width='2420' >
<context>
<property name='objReq' type='Ens.Request' instantiate='0' />
<property name='nombreClase' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='hl7SiuS15' type='EnsLib.HL7.Message' instantiate='0' />
<property name='hl7SiuS12' type='EnsLib.HL7.Message' instantiate='0' />
<property name='idPaciente' type='%Integer' instantiate='0' />
</context>
<sequence xend='200' yend='800' >
<assign name="Asignar objReq" property="context.objReq" value="request" action="set" xpos='200' ypos='250' />
<assign name="Nombre clase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<switch name='Según consulta' xpos='200' ypos='450' xend='200' yend='700' >
<case condition='context.nombreClase = "AltaCitasRequest"' name='AltaCitasRequest' >
<call name='Alta cita' target='CitasSQL' async='0' xpos='200' ypos='600' >
<request type='cysnet.clinicaDental.agenda.msg.AltaCitasRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.AltaCitasRespose' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='context.nombreClase = "BuscarCitaPorIDRequest"' name='BuscarCitaPorIDRequest' >
<call name='Buscar cita' target='CitasSQL' async='0' xpos='470' ypos='600' >
<request type='cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='context.nombreClase = "ModificarCitaRequest"' name='ModificarCitaRequest' >
<sequence name='Modificar cita' xpos='740' ypos='600' xend='200' yend='1650' >
<call name='Buscar paciente' target='PacientesSQL' async='0' xpos='200' ypos='250' >
<request type='cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDRequest' >
<assign property="callrequest.idPaciente" value="request.idPaciente" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse' >
<assign property="context.objReq.paciente" value="callresponse" action="set" />
</response>
</call>
<transform name='SIU_S15' class='cysnet.clinicaDental.agenda.dtl.SiuS15ToHL7DefaultDTL' source='context.objReq' target='context.hl7SiuS15' xpos='200' ypos='350' />
<call name='Enviar SIU_S15' target='OutFileHL7' async='0' xpos='200' ypos='450' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.hl7SiuS15" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
<call name='Cancelar cita' target='CitasSQL' async='0' xpos='200' ypos='550' >
<request type='cysnet.clinicaDental.agenda.msg.CancelarCitaRequest' >
<assign property="callrequest.idCita" value="context.objReq.idCita" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.CancelarCitaResponse' >
<assign property="response.exito" value="callresponse.exito" action="set" />
<assign property="response.mensaje" value="callresponse.mensaje" action="set" />
</response>
</call>
<if name='Éxito?' condition='response.exito = 1' xpos='200' ypos='650' xend='200' yend='1550' >
<true>
<transform name='SIU_S12' class='cysnet.clinicaDental.agenda.dtl.SiuS12ToHL7DefaultDTL' source='context.objReq' target='context.hl7SiuS12' xpos='335' ypos='800' />
<call name='Enviar SIU_S12' target='OutFileHL7' async='0' xpos='335' ypos='900' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.hl7SiuS12" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
<call name='Crear cita' target='CitasSQL' async='0' xpos='335' ypos='1000' >
<request type='cysnet.clinicaDental.agenda.msg.AltaCitasRequest' >
<assign property="callrequest.idPaciente" value="request.idPaciente" action="set" />
<assign property="callrequest.descCita" value="request.descCita" action="set" />
<assign property="callrequest.fechaCita" value="request.fechaCita" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.AltaCitasRespose' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<if name='Cita creada?' condition='response.exito = 1' xpos='335' ypos='1100' xend='335' yend='1450' >
<true>
<call name='Enviar notificación' target='NotificacionesSQL' async='0' xpos='470' ypos='1250' >
<request type='cysnet.clinicaDental.agenda.msg.NuevaNotificacionRequest' >
<assign property="callrequest.asunto" value="&quot;Cambio cita&quot;" action="set" />
<assign property="callrequest.idPaciente" value="request.idPaciente" action="set" />
<assign property="callrequest.mensaje" value="&quot;Su cita se ha actualizado. &quot;_request.fechaCita_&quot; &quot;_request.descCita" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.NuevaNotificacionResponse' />
</call>
<assign name="Mensaje éxito" property="response.mensaje" value="&quot;Cita actualizada con éxito&quot;" action="set" xpos='470' ypos='1350' />
</true>
</if>
</true>
</if>
</sequence>
</case>
<case condition='context.nombreClase = "CancelarCitaRequest"' name='CancelarCitaRequest' >
<sequence name='Cancelar cita' xpos='1010' ypos='600' xend='200' yend='800' >
<call name='Buscar cita 2' target='CitasSQL' async='0' xpos='200' ypos='250' >
<request type='cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDRequest' >
<assign property="callrequest.idCita" value="request.idCita" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDResponse' >
<assign property="context.idPaciente" value="callresponse.idPaciente" action="set" />
</response>
</call>
<call name='Cancelar cita 2' target='CitasSQL' async='0' xpos='200' ypos='350' >
<request type='cysnet.clinicaDental.agenda.msg.CancelarCitaRequest' >
<assign property="callrequest.idCita" value="request.idCita" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.CancelarCitaResponse' >
<assign property="response.exito" value="callresponse.exito" action="set" />
<assign property="response.mensaje" value="callresponse.mensaje" action="set" />
</response>
</call>
<if name='Cita cancelada?' condition='response.exito = 1' xpos='200' ypos='450' xend='200' yend='700' >
<true>
<call name='Enviar notificación 2' target='NotificacionesSQL' async='0' xpos='335' ypos='600' >
<request type='cysnet.clinicaDental.agenda.msg.NuevaNotificacionRequest' >
<assign property="callrequest.asunto" value="&quot;Cita cancelada&quot;" action="set" />
<assign property="callrequest.idPaciente" value="context.idPaciente" action="set" />
<assign property="callrequest.mensaje" value="&quot;Su cita ha sido cancelada&quot;" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.NuevaNotificacionResponse' />
</call>
</true>
</if>
</sequence>
</case>
<default name='default' >
<sequence name='No implementado' xpos='1280' ypos='600' xend='200' yend='550' >
<code name='Clase desconocida' xpos='200' ypos='250' >
<![CDATA[
  $$$LOGINFO("Falta implementación en el proceso para la clase: "_context.nombreClase)]]>
</code>
<assign name="Exito 0" property="response.exito" value="0" action="set" xpos='200' ypos='350' />
<assign name="Mensaje" property="response.mensaje" value="&quot;Falta implementación en el proceso para la clase: &quot;_context.nombreClase" action="set" xpos='200' ypos='450' />
</sequence>
</default>
</switch>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
