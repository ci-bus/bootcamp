Class cysnet.miguel.ws.MiServicio.MiServicioSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://localhost:52773/csp/healthshare/BOOTCAMP-ENERO-2024/cysnet.miguel.ws.MiServicio.cls";

/// This is the namespace used by the Service
Parameter NAMESPACE = "BOOTCAMP-ENERO-2024";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "MiServicio";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

Method crearPersona(nombre As %String, apellido As %String) As cysnet.miguel.ws.MiServicio.s0.CrearPersonaResponse1 [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("crearPersona").Invoke($this,"BOOTCAMP-ENERO-2024/cysnet.miguel.ws.MiServicio.crearPersona",.nombre,.apellido)
}

Method obtenerPersona(idPersona As %String) As cysnet.miguel.ws.MiServicio.s0.ObtenerPersonaResponse1 [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("obtenerPersona").Invoke($this,"BOOTCAMP-ENERO-2024/cysnet.miguel.ws.MiServicio.obtenerPersona",.idPersona)
}

}
