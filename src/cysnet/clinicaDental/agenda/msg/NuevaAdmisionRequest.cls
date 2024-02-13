Class cysnet.clinicaDental.agenda.msg.NuevaAdmisionRequest Extends Ens.Request
{

Property idCita As %String;

Property fechaAdmision As %TimeStamp;

Property indEnviada As %Boolean;

Storage Default
{
<Data name="NuevaAdmisionRequestDefaultData">
<Subscript>"NuevaAdmisionRequest"</Subscript>
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>fechaAlta</Value>
</Value>
<Value name="3">
<Value>indEnviada</Value>
</Value>
<Value name="4">
<Value>fechaAdmision</Value>
</Value>
</Data>
<DefaultData>NuevaAdmisionRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
