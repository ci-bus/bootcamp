Class cysnet.clinicaDental.agenda.msg.BuscarCitaPorIDRequest Extends Ens.Request
{

Property idCita As %Integer;

Storage Default
{
<Data name="BuscarCitaPorIDResponseDefaultData">
<Subscript>"BuscarCitaPorIDResponse"</Subscript>
<Value name="1">
<Value>idCita</Value>
</Value>
</Data>
<DefaultData>BuscarCitaPorIDResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
