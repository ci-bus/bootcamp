Class cysnet.miguel.data.Persona Extends %Persistent
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
<DataLocation>^cysnet.miguel.data.PersonaD</DataLocation>
<DefaultData>PersonaDefaultData</DefaultData>
<IdLocation>^cysnet.miguel.data.PersonaD</IdLocation>
<IndexLocation>^cysnet.miguel.data.PersonaI</IndexLocation>
<StreamLocation>^cysnet.miguel.data.PersonaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
