/// Creado desde: http://localhost:52773/csp/healthshare/BOOTCAMP-ENERO-2024/cysnet.miguel.ws.MiServicio.cls?WSDL
Class cysnet.miguel.ws.MiServicio.s0.CrearPersonaResponse1 Extends cysnet.miguel.ws.MiServicio.s0.EnsResponse [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "BOOTCAMP-ENERO-2024";

Parameter XMLNAME = "CrearPersonaResponse";

Parameter XMLTYPE = "CrearPersonaResponse";

Property idPersona As %String(MAXLEN = "", XMLNAME = "idPersona");

Property nombre As %String(MAXLEN = "", XMLNAME = "nombre");

Property apellido As %String(MAXLEN = "", XMLNAME = "apellido");

Property direccion As %String(MAXLEN = "", XMLNAME = "direccion");

Property codigoPostal As %Integer(XMLNAME = "codigoPostal");

Property mensaje As %String(MAXLEN = "", XMLNAME = "mensaje");

Property exito As %Boolean(XMLNAME = "exito");

Property error As %String(MAXLEN = "", XMLNAME = "error");

Storage Default
{
<Data name="CrearPersonaResponse1State">
<Subscript>"CrearPersonaResponse1"</Subscript>
<Value name="1">
<Value>idPersona</Value>
</Value>
<Value name="2">
<Value>nombre</Value>
</Value>
<Value name="3">
<Value>apellido</Value>
</Value>
<Value name="4">
<Value>direccion</Value>
</Value>
<Value name="5">
<Value>codigoPostal</Value>
</Value>
<Value name="6">
<Value>mensaje</Value>
</Value>
<Value name="7">
<Value>exito</Value>
</Value>
<Value name="8">
<Value>error</Value>
</Value>
</Data>
<State>CrearPersonaResponse1State</State>
<Type>%Storage.Serial</Type>
}

}
