Class cysnet.clinicaDental.agenda.data.Notificaciones Extends %Persistent
{

Property idNotificacion As %Integer;

Property idPaciente As %Integer;

Property asunto As %String;

Property mensaje As %String;

Property indEnviada As %Boolean;

Storage Default
{
<Data name="NotificacionesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>idNotificacion</Value>
</Value>
<Value name="3">
<Value>idPaciente</Value>
</Value>
<Value name="4">
<Value>asunto</Value>
</Value>
<Value name="5">
<Value>mensaje</Value>
</Value>
<Value name="6">
<Value>indEnviada</Value>
</Value>
</Data>
<DataLocation>^cysnet.clin505B.NotificacionesD</DataLocation>
<DefaultData>NotificacionesDefaultData</DefaultData>
<IdLocation>^cysnet.clin505B.NotificacionesD</IdLocation>
<IndexLocation>^cysnet.clin505B.NotificacionesI</IndexLocation>
<StreamLocation>^cysnet.clin505B.NotificacionesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
