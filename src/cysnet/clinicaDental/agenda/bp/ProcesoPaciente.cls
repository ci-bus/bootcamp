/// 
Class cysnet.clinicaDental.agenda.bp.ProcesoPaciente Extends Ens.BusinessProcessBPL
{

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
<sequence xend='200' yend='900' >
<assign name="Asignar objReq" property="context.objReq" value="request" action="set" xpos='200' ypos='250' />
<assign name="Nombre Clase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<code name='Log clase' xpos='200' ypos='450' >
<![CDATA[
  $$$LOGINFO(context.nombreClase)]]>
</code>
<switch name='Tipo Entrada' xpos='200' ypos='550' xend='200' yend='800' >
<case condition='context.nombreClase = "cysnet.clinicaDental.agenda.msg.NuevoPacienteRequest"' name='NuevoPacienteRequest' >
<call name='NuevoPaciente' target='PacientesSQL' async='0' xpos='200' ypos='700' >
<request type='cysnet.clinicaDental.agenda.msg.NuevoPacienteRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.NuevoPacienteResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<default name='default' >
<code name='Log clase desconocida' xpos='470' ypos='700' >
<![CDATA[
  $$$LOGINFO("Falta implementación en el proceso para la clase: "_context.nombreClase)]]>
</code>
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
