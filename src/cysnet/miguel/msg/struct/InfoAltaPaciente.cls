Class cysnet.miguel.msg.struct.InfoAltaPaciente Extends (%SerialObject, %XML.Adaptor)
{

Property idPersona As %BigInt;

Property fechaAlta As %TimeStamp;

Property nombre As %String;

Property apellido As %String;

Storage Default
{
<Data name="InfoAltaPacienteState">
<Value name="1">
<Value>idPersona</Value>
</Value>
<Value name="2">
<Value>fechaAlta</Value>
</Value>
<Value name="3">
<Value>nombre</Value>
</Value>
<Value name="4">
<Value>apellido</Value>
</Value>
</Data>
<State>InfoAltaPacienteState</State>
<StreamLocation>^cysnet.mig70F3.InfoAltaPacD889S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
