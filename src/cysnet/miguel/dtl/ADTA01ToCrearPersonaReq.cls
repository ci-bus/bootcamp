Class cysnet.miguel.dtl.ADTA01ToCrearPersonaReq Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, cysnet.miguel.ws.MiServicio.req.crearPersonaRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='cysnet.miguel.ws.MiServicio.req.crearPersonaRequest' sourceDocType='2.5:ADT_A01' create='new' language='objectscript' >
<annotation>Transformar el mensaje HL7 ADT A01 en el mensaje Crear Persona</annotation>
<assign value='source.{PID:PatientName().GivenName}' property='target.nombre' action='set' />
<assign value='source.{PID:PatientName().FamilyName}' property='target.apellido' action='set' />
</transform>
}

}
