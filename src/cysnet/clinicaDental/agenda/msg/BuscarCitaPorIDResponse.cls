Class cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDResponse Extends (Ens.Response, cysnet.clinicaDental.agenda.msg.GenericResponse)
{

Property idCita As %Integer;

Property idPaciente As %Integer;

Property descCita As %String(MAXLEN = "");

Property fechaCita As %TimeStamp;

Property codEstado As %Integer;

Storage Default
{
<Data name="BuscarCitaPorIDResquestDefaultData">
<Subscript>"BuscarCitaPorIDResquest"</Subscript>
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>idPaciente</Value>
</Value>
<Value name="3">
<Value>descCita</Value>
</Value>
<Value name="4">
<Value>fechaCita</Value>
</Value>
<Value name="5">
<Value>codEstado</Value>
</Value>
<Value name="6">
<Value>mensaje</Value>
</Value>
<Value name="7">
<Value>exito</Value>
</Value>
</Data>
<DefaultData>BuscarCitaPorIDResquestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
