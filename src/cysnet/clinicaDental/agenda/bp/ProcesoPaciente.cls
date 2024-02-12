/// 
Class cysnet.clinicaDental.agenda.bp.ProcesoPaciente Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='cysnet.clinicaDental.agenda.msg.GenericResponse' height='2000' width='2000' >
<context>
<property name='objReq' type='Ens.Request' instantiate='0' />
<property name='nombreClase' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1250' >
<assign name="Asignar objReq" property="context.objReq" value="request" action="set" xpos='200' ypos='250' />
<assign name="Nombre Clase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<code name='Log clase' xpos='200' ypos='450' >
<![CDATA[
  $$$LOGINFO(context.nombreClase)]]>
</code>
<switch name='Tipo Entrada' xpos='200' ypos='550' xend='200' yend='1150' >
<case condition='context.nombreClase = "NuevoPacienteRequest"' name='NuevoPacienteRequest' >
<call name='NuevoPaciente' target='PacientesSQL' async='0' xpos='200' ypos='700' >
<request type='cysnet.clinicaDental.agenda.msg.NuevoPacienteRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.NuevoPacienteResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='context.nombreClase = "BajaPacienteRequest"' name='BajaPacienteRequest' >
<call name='BajaPaciente' target='PacientesSQL' async='0' xpos='740' ypos='700' >
<request type='cysnet.clinicaDental.agenda.msg.BajaPacienteRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.BajaPacienteResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<if name='Baja paciente' condition='response.exito &apos;= 0' xpos='740' ypos='800' xend='740' yend='1050' >
<true>
<call name='Crear notificación' target='NotificacionesSQL' async='0' xpos='875' ypos='950' >
<request type='cysnet.clinicaDental.agenda.msg.NuevaNotificacionRequest' >
<assign property="callrequest.asunto" value="&quot;Baja paciente&quot;" action="set" />
<assign property="callrequest.mensaje" value="&quot;Se ha dado de baja como paciente en el sistema&quot;" action="set" />
<assign property="callrequest.idPaciente" value="request.ID" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.NuevaNotificacionResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
</if>
</case>
<default name='default' >
<code name='Log clase desconocida' xpos='470' ypos='700' >
<![CDATA[
  $$$LOGINFO("Falta implementación en el proceso para la clase: "_context.nombreClase)]]>
</code>
<assign name="Exito 0" property="response.exito" value="0" action="set" xpos='470' ypos='800' />
<assign name="Mensaje" property="response.mensaje" value="&quot;Falta implementación en el proceso para la clase: &quot;_context.nombreClase" action="set" xpos='470' ypos='900' />
</default>
</switch>
</sequence>
</process>
}

}
