/// Comprueba que los datos recibidos sean válidos
Class cysnet.miguel.rules.CheckDatosValidos Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="cysnet.miguel.bp.ProcesoPersona.Context" production="">
<variable name="cysnet"></variable>
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Comprobar ObtenerPersona" disabled="false">
<when condition="nombreClase = &quot;ObtenerPersonaRequest&quot;" comment="">
<rule name="Comprobar idPersona" disabled="false">
<when condition="(objReq.idPersona!=&quot;&quot;)&amp;&amp;(objReq.idPersona&gt;0)" comment="">
<return>""</return>
</when>
<otherwise>
<return>"El ID de persona no es válido"</return>
</otherwise>
</rule>
<assign property="destinatario" value="&quot;miguel@cysnet.es&quot;"></assign>
</when>
</rule>
<rule name="Comprobar CrearPersona" disabled="false">
<when condition="nombreClase = &quot;CrearPersonaRequest&quot;" comment="">
<rule name="Comprobar nombre y apellido" disabled="false">
<when condition="((objReq.nombre!=&quot;&quot;)&amp;&amp;Length(objReq.nombre,) &gt; 1)&amp;&amp;objReq.apellido!=&quot;&quot;&amp;&amp;(Length(objReq.apellido,))&gt;1" comment="">
<return>""</return>
</when>
<otherwise>
<return>"El nombre y apellido son obligatorios"</return>
</otherwise>
</rule>
<assign property="destinatario" value="&quot;miguel@cysnet.es&quot;"></assign>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
