Class cysnet.miguel.ws.MiServicio Extends EnsLib.SOAP.Service [ ProcedureBlock ]
{

/// Nombre de servicio web.
Parameter SERVICENAME = "MiServicio";

/// Namespace SOAP para servicio web
Parameter NAMESPACE = "PRUEBAS";

/// Se utilizarán namespaces de clases referenciadas en WSDL.
Parameter USECLASSNAMESPACES = 1;

Method saludo(idPersona As %String) As cysnet.miguel.msg.ObtenerPersonaResponse [ WebMethod ]
{
	#dim req As cysnet.miguel.msg.ObtenerPersonaRequest
	#dim rsp As cysnet.miguel.msg.ObtenerPersonaResponse
	
	set req = ##class(cysnet.miguel.msg.ObtenerPersonaRequest).%New()
	set req.idPersona = idPersona
	
	do ..SendRequestSync("ProcesoPersonaCodigo", req, .rsp)
	
	quit rsp
}

}
