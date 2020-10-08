/// 
/// FOI Request application data fields
Class App.Data.FOIRequest Extends (%Persistent, %Populate)
{

/// title / salutation
Property Title As %String;

/// first name
Property FirstName As %String(MAXLEN = "");

/// middle name
Property MiddleName As %String(MAXLEN = "");

/// last name
Property LastName As %String(MAXLEN = "");

/// building name
Property BuildingName As %String;

/// street number
Property Number As %String;

/// street name
Property Street As %String(MAXLEN = "");

/// town or Dublin district
Property Town As %String;

/// County
Property County As %String;

/// EIRCode
Property EIRCode As %String(MAXLEN = 7);

/// email
Property Email As %String;

/// home phone
Property HomePhone As %String;

/// business phone
Property BusinessPhone As %String;

/// mobile
Property Mobile As %String;

/// type of record personal / non-personal
Property TypeOfRecord As %String;

/// form of access requested post / other
Property FormOfAccessChoice As %String;

/// form of access specify if other
Property FormOfAccessSpecify As %String;

/// request free text
Property RequestText As %String(MAXLEN = "");

/// date of request
Property DateOfRequest As %String(MAXLEN = "");

Index LastNameIdx On LastName;

/// create a JSON object from FOIRequest properties
Method CopyToObject(object As %DynamicObject) As %Status
{
	set object.ID = ..%Id()
  set object.Title = ..Title
  set object.FirstName = ..FirstName
  set object.MiddleName = ..MiddleName
  set object.LastName = ..LastName
  set object.BuildingName = ..BuildingName
  set object.Number = ..Number
  set object.Street = ..Street
  set object.Town = ..Town
  set object.County = ..County
  set object.EIRCode = ..EIRCode
  set object.Email = ..Email
  set object.HomePhone = ..HomePhone
  set object.BusinessPhone = ..BusinessPhone
  set object.Mobile = ..Mobile
  set object.TypeOfRecord = ..TypeOfRecord
  set object.FormOfAccessChoice = ..FormOfAccessChoice
  set object.FormOfAccessSpecify = ..FormOfAccessSpecify
  set object.RequestText = ..RequestText
  set object.DateOfRequest = ..DateOfRequest
	return $$$OK
}

Method GetID(object As %DynamicObject) As %Status
{
  set object.ID = ..%Id()
  return $$$OK
}

/// copy a JSON object into FOIRequest properties
Method CopyFromObject(object As %DynamicObject) As %Status
{
  set ..Title = object.Title
  set ..FirstName = object.FirstName
  set ..MiddleName = object.MiddleName
  set ..LastName = object.LastName
  set ..BuildingName = object.BuildingName
  set ..Number = object.Number
  set ..Street = object.Street
  set ..Town = object.Town
  set ..County = object.County
  set ..EIRCode = object.EIRCode
  set ..Email = object.Email
  set ..HomePhone = object.HomePhone
  set ..BusinessPhone = object.BusinessPhone
  set ..Mobile = object.Mobile
  set ..TypeOfRecord = object.TypeofRecord
  set ..FormOfAccessChoice = object.FormOfAccessChoice
  set ..FormOfAccessSpecify = object.FormOfAccessSpecify
  set ..RequestText = object.RequestText
  set ..DateOfRequest = object.DateOfRequest
	return $$$OK
}

Storage Default
{
<Data name="FOIRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Title</Value>
</Value>
<Value name="3">
<Value>FirstName</Value>
</Value>
<Value name="4">
<Value>MiddleName</Value>
</Value>
<Value name="5">
<Value>LastName</Value>
</Value>
<Value name="6">
<Value>BuildingName</Value>
</Value>
<Value name="7">
<Value>Number</Value>
</Value>
<Value name="8">
<Value>Street</Value>
</Value>
<Value name="9">
<Value>Town</Value>
</Value>
<Value name="10">
<Value>County</Value>
</Value>
<Value name="11">
<Value>EIRCode</Value>
</Value>
<Value name="12">
<Value>Email</Value>
</Value>
<Value name="13">
<Value>HomePhone</Value>
</Value>
<Value name="14">
<Value>BusinessPhone</Value>
</Value>
<Value name="15">
<Value>Mobile</Value>
</Value>
<Value name="16">
<Value>TypeOfRecord</Value>
</Value>
<Value name="17">
<Value>FormOfAccessChoice</Value>
</Value>
<Value name="18">
<Value>FormOfAccessSpecify</Value>
</Value>
<Value name="19">
<Value>RequestText</Value>
</Value>
<Value name="20">
<Value>DateOfRequest</Value>
</Value>
</Data>
<DataLocation>^App.Data.FOIRequestD</DataLocation>
<DefaultData>FOIRequestDefaultData</DefaultData>
<IdLocation>^App.Data.FOIRequestD</IdLocation>
<IndexLocation>^App.Data.FOIRequestI</IndexLocation>
<StreamLocation>^App.Data.FOIRequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
