Class cysnet.miguel.data.Persona Extends %Persistent
{

Property nombre As %String;

Property apellido As %String;

Property direccion As %String(MAXLEN = "");

Property codigoPostal As %Integer;

Storage Default
{
<Data name="PersonaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
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
<DataLocation>^cysnet.miguel.data.PersonaD</DataLocation>
<DefaultData>PersonaDefaultData</DefaultData>
<IdLocation>^cysnet.miguel.data.PersonaD</IdLocation>
<IndexLocation>^cysnet.miguel.data.PersonaI</IndexLocation>
<StreamLocation>^cysnet.miguel.data.PersonaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
