Class cysnet.miguel.ws.MiServicio.bo.MiServicioSoap Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method crearPersona(pRequest As cysnet.miguel.ws.MiServicio.req.crearPersonaRequest, Output pResponse As cysnet.miguel.ws.MiServicio.rsp.crearPersonaResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "cysnet.miguel.ws.MiServicio.MiServicioSoap"
 Set tSC = ..Adapter.InvokeMethod("crearPersona",.crearPersonaResult,pRequest.nombre,pRequest.apellido)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.crearPersonaResult=$get(crearPersonaResult)
 Quit $$$OK
}

Method obtenerPersona(pRequest As cysnet.miguel.ws.MiServicio.req.obtenerPersonaRequest, Output pResponse As cysnet.miguel.ws.MiServicio.rsp.obtenerPersonaResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "cysnet.miguel.ws.MiServicio.MiServicioSoap"
 Set tSC = ..Adapter.InvokeMethod("obtenerPersona",.obtenerPersonaResult,pRequest.idPersona)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.obtenerPersonaResult=$get(obtenerPersonaResult)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="cysnet.miguel.ws.MiServicio.req.crearPersonaRequest">
		<Method>crearPersona</Method>
	</MapItem>
	<MapItem MessageType="cysnet.miguel.ws.MiServicio.req.obtenerPersonaRequest">
		<Method>obtenerPersona</Method>
	</MapItem>
</MapItems>
}

}
