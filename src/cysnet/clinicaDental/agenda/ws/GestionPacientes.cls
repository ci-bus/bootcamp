Class cysnet.clinicaDental.agenda.ws.GestionPacientes Extends EnsLib.SOAP.Service [ ProcedureBlock ]
{

/// Nombre de servicio web.
Parameter SERVICENAME = "GestionPacientes";

/// Namespace SOAP para servicio web
Parameter NAMESPACE = "BOOTCAMP-ENERO-2024";

/// Se utilizarán namespaces de clases referenciadas en WSDL.
Parameter USECLASSNAMESPACES = 1;

/// Método para crear nuevo paciente
Method NuevoPaciente(nombre As %String, apellidos As %String, email As %String) As cysnet.clinicaDental.agenda.msg.NuevoPacienteResponse [ WebMethod ]
{
	#dim req As cysnet.clinicaDental.agenda.msg.NuevoPacienteRequest
	#dim rsp As cysnet.clinicaDental.agenda.msg.NuevoPacienteResponse
	
	Set req = ##class(cysnet.clinicaDental.agenda.msg.NuevoPacienteRequest).%New()
	Set req.apellidos = apellidos
	Set req.email = email
	Set req.nombre = nombre
	
	Do ..SendRequestSync("ProcesoPaciente", req, .rsp)
	
	Quit rsp
}

// 

Method BajaPaciente(ID As %Integer) As cysnet.clinicaDental.agenda.msg.BajaPacienteResponse [ WebMethod ]
{
	#dim req As cysnet.clinicaDental.agenda.msg.BajaPacienteRequest
	#dim rsp As cysnet.clinicaDental.agenda.msg.BajaPacienteResponse
	
	Set req = ##class(cysnet.clinicaDental.agenda.msg.BajaPacienteRequest).%New()
	Set req.ID = ID
	
	Do ..SendRequestSync("ProcesoPaciente", req, .rsp)
	
	Quit rsp
}

/// Método que obtiene los datos de un paciente a partir de su ID
Method BuscarPacientePorID(idPaciente As %Integer) As cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse [ WebMethod ]
{
	#dim req As cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDRequest
	#dim rsp As cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDResponse
	
	Set req = ##class(cysnet.clinicaDental.agenda.msg.BuscarPacientePorIDRequest).%New()
	Set req.idPaciente = idPaciente
  
	Do ..SendRequestSync("PacientesSQL", req, .rsp)

	Quit rsp
}

/// Método para listar todos los pacientes
Method ListarPacientes() As cysnet.clinicaDental.agenda.msg.ListarPacientesResponse [ WebMethod ]
{
	#dim req As cysnet.clinicaDental.agenda.msg.ListarPacientesRequest
	#dim rsp As cysnet.clinicaDental.agenda.msg.ListarPacientesResponse
	
	Set req = ##class(cysnet.clinicaDental.agenda.msg.ListarPacientesRequest).%New()
	
	Do ..SendRequestSync("PacientesSQL", req, .rsp)
	
	Quit rsp
}

}
