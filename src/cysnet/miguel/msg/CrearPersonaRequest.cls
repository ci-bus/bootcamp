Class cysnet.miguel.msg.CrearPersonaRequest Extends Ens.Response
{

Property idPersona As %String;

Property nombre As %String;

Property apellido As %String;

Storage Default
{
<Data name="CrearPersonaRequestDefaultData">
<Subscript>"CrearPersonaRequest"</Subscript>
<Value name="1">
<Value>idPersona</Value>
</Value>
<Value name="2">
<Value>nombre</Value>
</Value>
<Value name="3">
<Value>apellido</Value>
</Value>
</Data>
<DefaultData>CrearPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
