Class cysnet.clinicaDental.agenda.msg.NuevaAltaRequest Extends Ens.Request
{

Property idCita As %String;

Property fechaAlta As %TimeStamp;

Property indEnviada As %Boolean;

Storage Default
{
<Data name="NuevaAltaRequestDefaultData">
<Subscript>"NuevaAltaRequest"</Subscript>
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>fechaAlta</Value>
</Value>
<Value name="3">
<Value>indEnviada</Value>
</Value>
</Data>
<DefaultData>NuevaAltaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
