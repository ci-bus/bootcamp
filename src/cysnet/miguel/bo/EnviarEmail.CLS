Class cysnet.miguel.bo.EnviarEmail Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.EMail.OutboundAdapter";

Property Adapter As EnsLib.EMail.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method enviarEmail(pRequest As cysnet.miguel.msg.EnviarEmailRequest, pResponse As cysnet.miguel.msg.EnviarEmailResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim msg As %Net.MailMessage

    Set pResponse = ##class(cysnet.miguel.msg.EnviarEmailResponse).%New()
    Set pResponse.exito = 1

    // He preferido sacar esto del try catch por si falla la función de envío
    Set destinatarioOriginal = ..Adapter.Recipient

    Try {
        Set msg = ##class(%Net.MailMessage).%New()
        Set msg.Subject = pRequest.asunto
        Set sc = msg.TextData.WriteLine(pRequest.mensaje)

        If ($$$ISOK(sc)) {
            If ((pRequest.destinatario '= "")&&($LENGTH(pRequest.destinatario) > 1)) {
                Set ..Adapter.Recipient = pRequest.destinatario
            }
            Set sc = ..Adapter.SendMail(msg)
        }
    } Catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
        If (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            Set sc = err.status
        } Else {
            Set sc = $SYSTEM.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }

    // He preferido sacar esto del try catch por si falla la función de envío
    Set ..Adapter.Recipient = destinatarioOriginal

    If ($$$ISERR(sc)) {
        Set pResponse.exito = 0
        Set pResponse.error = $SYSTEM.Status.GetErrorText(sc)
    }

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.miguel.msg.EnviarEmailRequest">
        <Method>enviarEmail</Method>
    </MapItem>
</MapItems>
}

}
