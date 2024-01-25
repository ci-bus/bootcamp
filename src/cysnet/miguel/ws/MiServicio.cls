Class cysnet.miguel.ws.MiServicio Extends EnsLib.SOAP.Service [ ProcedureBlock ]
{

/// Nombre de servicio web.
Parameter SERVICENAME = "MiServicio";

/// Namespace SOAP para servicio web
Parameter NAMESPACE = "PRUEBAS";

/// Se utilizarán namespaces de clases referenciadas en WSDL.
Parameter USECLASSNAMESPACES = 1;

Method obtenerPersona(idPersona As %String) As cysnet.miguel.msg.ObtenerPersonaResponse [ WebMethod ]
{
	#dim req As cysnet.miguel.msg.ObtenerPersonaRequest
	#dim rsp As cysnet.miguel.msg.ObtenerPersonaResponse

	set req = ##class(cysnet.miguel.msg.ObtenerPersonaRequest).%New()
	set req.idPersona = idPersona

	do ..SendRequestSync("ProcesoPersona", req, .rsp)

	quit rsp
}

Method crearPersona(nombre As %String, apellido As %String) As cysnet.miguel.msg.ObtenerPersonaResponse [ WebMethod ]
{
	#dim req As cysnet.miguel.msg.CrearPersonaRequest
	#dim rsp As cysnet.miguel.msg.CrearPersonaResponse

	set req = ##class(cysnet.miguel.msg.CrearPersonaRequest).%New()
	set req.nombre = nombre
	set req.apellido = apellido

	do ..SendRequestSync("ProcesoPersona", req, .rsp)

	quit rsp
}

}
