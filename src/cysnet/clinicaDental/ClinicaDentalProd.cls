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
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="AltasSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.AltasSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
  </Item>
  <Item Name="CitasSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.CitasSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="PacientesSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.PacientesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
  </Item>
  <Item Name="MiServicio" Category="" ClassName="cysnet.miguel.ws.MiServicio" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcesoPersona" Category="" ClassName="cysnet.miguel.bp.ProcesoPersona" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcesoPersonaCodigo" Category="" ClassName="cysnet.miguel.bp.MiProcesoCodigo" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="DBCache" Category="" ClassName="cysnet.miguel.bo.DBCache" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="infileHL7" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/shared/hl7/out/</Setting>
    <Setting Target="Adapter" Name="FilePath">/shared/hl7/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/shared/hl7/proc/</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7RoutingRule</Setting>
    <Setting Target="Host" Name="DefCharEncoding">utf-8</Setting>
  </Item>
  <Item Name="HL7RoutingRule" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cysnet.miguel.rules.HL7RoutingRule</Setting>
    <Setting Target="Host" Name="ResponseFrom">MiServicioSoap</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="IncludeDetails">1</Setting>
    <Setting Target="Adapter" Name="Credentials">CuentaGmail</Setting>
    <Setting Target="Adapter" Name="From">miguelelinventor@gmail.com</Setting>
    <Setting Target="Adapter" Name="Recipient">miguel@cysnet.es</Setting>
    <Setting Target="Adapter" Name="SMTPPort">587</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ISC.FeatureTracker.SSL.Config*</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
  </Item>
  <Item Name="MiServicioSoap" Category="" ClassName="cysnet.miguel.ws.MiServicio.bo.MiServicioSoap" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">http://localhost:1980/csp/healthshare/BOOTCAMP-ENERO-2024/cysnet.miguel.ws.MiServicio.cls</Setting>
  </Item>
  <Item Name="EnviarEmail" Category="" ClassName="cysnet.miguel.bo.EnviarEmail" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">CuentaGmail</Setting>
    <Setting Target="Adapter" Name="SMTPPort">587</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ISC.FeatureTracker.SSL.Config*</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="From">miguelelinventor@gmail.com</Setting>
    <Setting Target="Adapter" Name="Recipient">miguel@cysnet.es</Setting>
  </Item>
  <Item Name="MySQLOp" Category="" ClassName="cysnet.miguel.bo.MySQLOp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="JavaGateway" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ClassPath">/shared/mysql/mysql-connector-java-5.1.49.jar</Setting>
    <Setting Target="Host" Name="JavaHome">/usr/lib/jvm/temurin-8-jdk-arm64</Setting>
  </Item>
  <Item Name="InSQL" Category="" ClassName="cysnet.miguel.bs.InSQL" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">UPDATE AltaPaciente 
SET IndRealizado = 1 
WHERE ID = ?</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="Query">SELECT ID, IdPersona, FechaAlta 
FROM AltaPaciente 
WHERE IndRealizado = 0 
ORDER BY ID</Setting>
  </Item>
  <Item Name="ProcesoAltaPaciente" Category="" ClassName="cysnet.miguel.bp.ProcesoAltaPaciente" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OutFileHL7" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/shared/hl7/salida-hl7/</Setting>
  </Item>
  <Item Name="InSQLAdmisiones" Category="" ClassName="cysnet.clinicaDental.agenda.bs.InSQLAdmisiones" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="Query">SELECT IdCita, FechaAdmision 
FROM Admision 
WHERE IndEnviada = 0 
ORDER BY IdCita</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">UPDATE Admision 
SET IndEnviada = 1 
WHERE IdCita = ?</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">IdCita</Setting>
  </Item>
  <Item Name="InSQLAltas" Category="" ClassName="cysnet.clinicaDental.agenda.bs.InSQLAltas" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="Query">SELECT IdAlta, IdCita, FechaAlta 
FROM Alta 
WHERE IndEnviada = 0 
ORDER BY IdCita</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">UPDATE Alta 
SET IndEnviada = 1 
WHERE IdCita = ?</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">IdCita</Setting>
  </Item>
  <Item Name="InSQLNotificaciones" Category="" ClassName="cysnet.clinicaDental.agenda.bs.InSQLNotificaciones" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="Query">SELECT IdNotificacion, IdPaciente, Asunto, Mensaje  
FROM Notificacion 
WHERE IndEnviada = 0 
ORDER BY IdNotificacion</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">UPDATE Notificacion 
SET IndEnviada = 1 
WHERE IdNotificacion = ?</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">IdNotificacion</Setting>
  </Item>
  <Item Name="ProcesoPaciente" Category="" ClassName="cysnet.clinicaDental.agenda.bp.ProcesoPaciente" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="NotificacionesSQL" Category="" ClassName="cysnet.clinicaDental.agenda.bo.NotificacionesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">Mysql</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:mysql://mysql:3306/iris?useSSL=false</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.mysql.jdbc.Driver</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="ProcesoCitas" Category="" ClassName="cysnet.clinicaDental.agenda.bp.ProcesoCitas" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcesoAdmisiones" Category="" ClassName="cysnet.clinicaDental.agenda.bp.ProcesoAdmisiones" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcesoAltas" Category="" ClassName="cysnet.clinicaDental.agenda.bp.ProcesoAltas" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcesoNotificaciones" Category="" ClassName="cysnet.clinicaDental.agenda.bp.ProcesoNotificaciones" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
