Class cysnet.clinicaDental.agenda.msg.NuevaNotificacionRequest Extends Ens.Request
{

Property idPaciente As %Integer;

Property asunto As %String(MAXLEN = "");

Property mensaje As %String(MAXLEN = "");

Storage Default
{
<Data name="NuevaNotificacionRequestDefaultData">
<Subscript>"NuevaNotificacionRequest"</Subscript>
<Value name="1">
<Value>idPaciente</Value>
</Value>
<Value name="2">
<Value>asunto</Value>
</Value>
<Value name="3">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>NuevaNotificacionRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
