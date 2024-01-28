Class cysnet.miguel.msg.CrearPersonaRequest Extends Ens.Request
{

Property idPersona As %String;

Property nombre As %String;

Property apellido As %String;

Property direccion As %String(MAXLEN = "");

Property codigoPostal As %Integer;

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
<Value name="4">
<Value>direccion</Value>
</Value>
<Value name="5">
<Value>codigoPostal</Value>
</Value>
</Data>
<DefaultData>CrearPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
