Class cysnet.miguel.msg.ObtenerPersonaResponse Extends Ens.Response
{

Property idPersona As %String;

Property nombre As %String;

Property apellido As %String;

Property direccion As %String(MAXLEN = "");

Property codigoPostal As %Integer;

Property mensaje As %String;

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="ObtenerPersonaResponseDefaultData">
<Subscript>"ObtenerPersonaResponse"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellido</Value>
</Value>
<Value name="3">
<Value>mensaje</Value>
</Value>
<Value name="4">
<Value>exito</Value>
</Value>
<Value name="5">
<Value>error</Value>
</Value>
<Value name="6">
<Value>direccion</Value>
</Value>
<Value name="7">
<Value>codigoPostal</Value>
</Value>
<Value name="8">
<Value>idPersona</Value>
</Value>
</Data>
<DefaultData>ObtenerPersonaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
