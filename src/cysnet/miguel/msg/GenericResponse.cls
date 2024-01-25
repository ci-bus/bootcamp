Class cysnet.miguel.msg.GenericResponse Extends Ens.Response
{

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="GenericResponseDefaultData">
<Subscript>"GenericResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>error</Value>
</Value>
</Data>
<DefaultData>GenericResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
