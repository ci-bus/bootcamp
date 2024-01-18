Class cysnet.miguel.ws.data.Persona Extends %Persistent
{

Property nombre As %String;

Property apellido As %String;

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
</Data>
<DataLocation>^cysnet.miguel.ws.data.PersonaD</DataLocation>
<DefaultData>PersonaDefaultData</DefaultData>
<IdLocation>^cysnet.miguel.ws.data.PersonaD</IdLocation>
<IndexLocation>^cysnet.miguel.ws.data.PersonaI</IndexLocation>
<StreamLocation>^cysnet.miguel.ws.data.PersonaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
