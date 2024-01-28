/// 
Class cysnet.miguel.bp.ProcesoPersona Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='cysnet.miguel.msg.GenericResponse' height='2000' width='2000' >
<sequence xend='200' yend='950' >
<switch name='Según mensaje' xpos='200' ypos='250' xend='200' yend='850' >
<case condition='request.%ClassName() = "CrearPersonaRequest"' name='CrearPersona' >
<call name='Crear Persona' target='DBCache' async='0' xpos='335' ypos='400' >
<request type='cysnet.miguel.msg.CrearPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.miguel.msg.CrearPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "ObtenerPersonaRequest"' name='ObtenerPersona' >
<if name='¿ID &gt; 0?' condition='request.idPersona &gt; 0' xpos='605' ypos='400' xend='605' yend='750' >
<true>
<call name='Obtener persona' target='DBCache' async='0' xpos='605' ypos='550' >
<request type='cysnet.miguel.msg.ObtenerPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.miguel.msg.ObtenerPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
<false>
<assign name="Estado de error" property="response.exito" value="0" action="set" xpos='875' ypos='550' />
<assign name="Mensaje de error" property="response.error" value="&quot;El ID debe ser mayor a 0&quot;" action="set" xpos='875' ypos='650' />
</false>
</if>
</case>
<default name='default' />
</switch>
</sequence>
</process>
}

}
