Class cysnet.clinicaDental.agenda.msg.ListarPacientesResponse Extends (Ens.Response, cysnet.clinicaDental.agenda.msg.GenericResponse)
{

Property pacientes As list Of cysnet.clinicaDental.agenda.data.Pacientes;

Storage Default
{
<Data name="ListarPacientesResponseDefaultData">
<Subscript>"ListarPacientesResponse"</Subscript>
<Value name="1">
<Value>pacientes</Value>
</Value>
<Value name="2">
<Value>mensaje</Value>
</Value>
<Value name="3">
<Value>exito</Value>
</Value>
</Data>
<DefaultData>ListarPacientesResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
