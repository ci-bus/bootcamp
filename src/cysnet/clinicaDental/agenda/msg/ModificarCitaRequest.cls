Class cysnet.clinicaDental.agenda.msg.ModificarCitaRequest Extends (Ens.Request, cysnet.clinicaDental.agenda.msg.AltaCitasRequest)
{

Property idCita As %Integer;

Property paciente As cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse;

Storage Default
{
<Data name="ModificarCitaRequestDefaultData">
<Subscript>"ModificarCitaRequest"</Subscript>
<Value name="1">
<Value>idPaciente</Value>
</Value>
<Value name="2">
<Value>descCita</Value>
</Value>
<Value name="3">
<Value>fechaCita</Value>
</Value>
<Value name="4">
<Value>idCita</Value>
</Value>
<Value name="5">
<Value>paciente</Value>
</Value>
</Data>
<DefaultData>ModificarCitaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
