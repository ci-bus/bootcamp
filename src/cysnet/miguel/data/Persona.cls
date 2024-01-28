Class cysnet.miguel.data.Persona Extends %Persistent
{

Property nombre As %String;

Property apellido As %String;

Property direccion As %String(MAXLEN = "");

Property codigoPostal As %Integer;

Storage Default
{
<Data name="PersonaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nombre</Value>
</Value>
<Value name="3">
<Value>apellido</Value>
</Value>
<Value name="4">
<Value>direccion</Value>
</Value>
<Value name="5">
<Value>codigoPostal</Value>
</Value>
</Data>
<DataLocation>^cysnet.miguel.data.PersonaD</DataLocation>
<DefaultData>PersonaDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^cysnet.miguel.data.PersonaD</IdLocation>
<IndexLocation>^cysnet.miguel.data.PersonaI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="apellido">
<AverageFieldSize>11</AverageFieldSize>
<OutlierSelectivity>.999999:"DE PRUEBA"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="codigoPostal">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="direccion">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="nombre">
<AverageFieldSize>10</AverageFieldSize>
<OutlierSelectivity>.999999:"PACIENTE"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^cysnet.miguel.data.PersonaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
