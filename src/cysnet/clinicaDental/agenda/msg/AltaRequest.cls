Class cysnet.clinicaDental.agenda.msg.AltaRequest Extends Ens.Request
{

Property idAlta As %Integer;

Property idCita As %Integer;

Property fechaAlta As %TimeStamp;

Property indEnviada As %Integer;

Property paciente As cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse;

Property cita As cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDResponse;

Storage Default
{
<Data name="AltaRequestDefaultData">
<Subscript>"AltaRequest"</Subscript>
<Value name="1">
<Value>idAlta</Value>
</Value>
<Value name="2">
<Value>idCita</Value>
</Value>
<Value name="3">
<Value>fechaAlta</Value>
</Value>
<Value name="4">
<Value>indEnviada</Value>
</Value>
<Value name="5">
<Value>paciente</Value>
</Value>
<Value name="6">
<Value>cita</Value>
</Value>
</Data>
<DefaultData>AltaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
