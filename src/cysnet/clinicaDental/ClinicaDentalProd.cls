Class cysnet.clinicaDental.ClinicaDentalProd Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="cysnet.clinicaDental.ClinicaDentalProd" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="GestionCitas" Category="" ClassName="cysnet.clinicaDental.agenda.ws.GestionCitas" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">1982</Setting>
  </Item>
  <Item Name="GestionPacientes" Category="" ClassName="cysnet.clinicaDental.agenda.ws.GestionPacientes" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">1981</Setting>
  </Item>
  <Item Name="AdmisionesSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.AdmisionesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AltasSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.AltasSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="CitasSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.CitasSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PacientesSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.PacientesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="NotificacionesSQL" Category="" ClassName="cysnet.clinicaDental.notificaciones.bo.NotificacionesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MiServicio" Category="" ClassName="cysnet.miguel.ws.MiServicio" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcesoPersona" Category="" ClassName="cysnet.miguel.bp.ProcesoPersona" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcesoPersonaCodigo" Category="" ClassName="cysnet.miguel.bp.MiProcesoCodigo" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="DBCache" Category="" ClassName="cysnet.miguel.bo.DBCache" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="infileHL7" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/shared/hl7/out/</Setting>
    <Setting Target="Adapter" Name="FilePath">/shared/hl7/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/shared/hl7/proc/</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7RoutingRule</Setting>
    <Setting Target="Host" Name="DefCharEncoding">utf-8</Setting>
  </Item>
  <Item Name="HL7RoutingRule" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cysnet.miguel.rules.HL7RoutingRule</Setting>
  </Item>
</Production>
}

}
