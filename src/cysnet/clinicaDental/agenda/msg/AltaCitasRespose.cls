Class cysnet.clinicaDental.agenda.msg.AltaCitasRespose Extends (Ens.Response, cysnet.clinicaDental.agenda.msg.GenericResponse)
{

Property idCita As %Integer;

Storage Default
{
<Data name="AltaCitasResposeDefaultData">
<Subscript>"AltaCitasRespose"</Subscript>
<Value name="1">
<Value>mensaje</Value>
</Value>
<Value name="2">
<Value>exito</Value>
</Value>
<Value name="3">
<Value>idCita</Value>
</Value>
</Data>
<DefaultData>AltaCitasResposeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
