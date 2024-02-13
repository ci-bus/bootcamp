/// 
Class cysnet.clinicaDental.agenda.bp.ProcesoNotificaciones Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='cysnet.miguel.msg.EnviarEmailResponse' height='2000' width='2000' >
<context>
<property name='objReq' type='cysnet.clinicaDental.agenda.data.Notificaciones' instantiate='0' />
<property name='Paciente' type='cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse' instantiate='0' />
</context>
<sequence xend='200' yend='1050' >
<assign name="Asigar objReq" property="context.objReq" value="request" action="set" xpos='200' ypos='250' />
<call name='Buscar paciente' target='PacientesSQL' async='0' xpos='200' ypos='350' >
<request type='cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDRequest' >
<assign property="callrequest.idPaciente" value="context.objReq.idPaciente" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse' >
<assign property="context.Paciente" value="callresponse" action="set" />
</response>
</call>
<if name='Paciente existe' condition='context.Paciente.email &apos;= ""' xpos='200' ypos='450' xend='200' yend='950' >
<true>
<if name='Permite notificar?' condition='context.Paciente.permiteNotificaciones = 1' xpos='470' ypos='600' xend='470' yend='850' >
<true>
<call name='Enviar email' target='EnviarEmail' async='0' xpos='605' ypos='750' >
<request type='cysnet.miguel.msg.EnviarEmailRequest' >
<assign property="callrequest.asunto" value="context.objReq.asunto" action="set" />
<assign property="callrequest.destinatario" value="context.Paciente.email" action="set" />
<assign property="callrequest.mensaje" value="context.objReq.mensaje" action="set" />
</request>
<response type='cysnet.miguel.msg.EnviarEmailResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
</if>
</true>
<false>
<call name='Enviar error' target='EnviarEmail' async='0' xpos='200' ypos='600' >
<request type='cysnet.miguel.msg.EnviarEmailRequest' >
<assign property="callrequest.asunto" value="&quot;Error en notificaciones&quot;" action="set" />
<assign property="callrequest.destinatario" value="&quot;miguel@cysnet.es&quot;" action="set" />
<assign property="callrequest.mensaje" value="&quot;No se encuentra o no tiene email definido el paciente con id &quot;_request.idPaciente" action="set" />
</request>
<response type='cysnet.miguel.msg.EnviarEmailResponse' />
</call>
<assign name="Mensaje error" property="response.error" value="&quot;No se encuentra o no tiene email definido el paciente con id &quot;_request.idPaciente" action="set" xpos='200' ypos='700' />
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
