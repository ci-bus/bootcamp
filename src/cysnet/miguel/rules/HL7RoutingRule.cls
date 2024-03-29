/// 
Class cysnet.miguel.rules.HL7RoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="cysnet.clinicaDental.ClinicaDentalProd">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Enrutar mensaje ADT^A01" disabled="false">
<constraint name="source" value="infileHL7"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="cysnet.miguel.dtl.ADTA01ToCrearPersonaReq" target=",MiServicioSoap"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
