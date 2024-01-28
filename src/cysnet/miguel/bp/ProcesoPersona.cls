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
<context>
<property name='objReq' type='Ens.Request' instantiate='0' />
<property name='nombreClase' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='resultadoRegla' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1150' >
<assign name="Asignar objReq" property="context.objReq" value="request" action="set" xpos='200' ypos='250' />
<assign name="Asignar nombreClase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<rule name='Check datos válidos' rule='cysnet.miguel.rules.CheckDatosValidos'  resultLocation='context.resultadoRegla' ruleContext='context' xpos='200' ypos='450' >
</rule>
<if name='Cumple regla' condition='context.resultadoRegla = ""' xpos='200' ypos='550' xend='200' yend='1050' >
<true>
<switch name='Según mensaje' xpos='470' ypos='700' xend='470' yend='950' >
<case condition='request.%ClassName() = "CrearPersonaRequest"' name='CrearPersona' >
<call name='Crear Persona' target='DBCache' async='0' xpos='605' ypos='850' >
<request type='cysnet.miguel.msg.CrearPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.miguel.msg.CrearPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "ObtenerPersonaRequest"' name='ObtenerPersona' >
<call name='Obtener persona' target='DBCache' async='0' xpos='875' ypos='850' >
<request type='cysnet.miguel.msg.ObtenerPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.miguel.msg.ObtenerPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<default name='default' />
</switch>
</true>
<false>
<assign name="Estado de error" property="response.exito" value="0" action="set" xpos='200' ypos='700' />
<assign name="Mensaje de error" property="response.error" value="context.resultadoRegla" action="set" xpos='200' ypos='800' />
</false>
</if>
</sequence>
</process>
}

}
