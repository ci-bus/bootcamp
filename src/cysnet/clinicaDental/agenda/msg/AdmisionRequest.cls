Class cysnet.clinicaDental.agenda.msg.AdmisionRequest Extends Ens.Request
{

Property idAdmision As %Integer;

Property idCita As %Integer;

Property fechaAdmision As %TimeStamp;

Property indEnviada As %Integer;

Property paciente As cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse;

Property cita As cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDResponse;

Storage Default
{
<Data name="AdmisionRequestDefaultData">
<Subscript>"AdmisionRequest"</Subscript>
<Value name="1">
<Value>idAdmision</Value>
</Value>
<Value name="2">
<Value>idCita</Value>
</Value>
<Value name="3">
<Value>fechaAdmision</Value>
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
<DefaultData>AdmisionRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
