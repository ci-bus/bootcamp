Class cysnet.miguel.ws.MiServicio.req.crearPersonaRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "cysnet.miguel.ws.MiServicio.rsp.crearPersonaResponse";

Property nombre As %String;

Property apellido As %String;

Storage Default
{
<Data name="crearPersonaRequestDefaultData">
<Subscript>"crearPersonaRequest"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellido</Value>
</Value>
</Data>
<DefaultData>crearPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
