Class cysnet.miguel.ws.MiServicio.req.obtenerPersonaRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "cysnet.miguel.ws.MiServicio.rsp.obtenerPersonaResponse";

Property idPersona As %String;

Storage Default
{
<Data name="obtenerPersonaRequestDefaultData">
<Subscript>"obtenerPersonaRequest"</Subscript>
<Value name="1">
<Value>idPersona</Value>
</Value>
</Data>
<DefaultData>obtenerPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
