Include %occErrors

Class App.Data.FOIRequest.REST Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/FOIRequest" Method="POST" Call="CreateFOIRequest" />
<Route Url="/FOIRequest/:ID" Method="GET" Call="RetrieveFOIRequest" />
<Route Url="/FOIRequest/:ID" Method="PUT" Call="UpdateFOIRequest" />
<Route Url="/FOIRequest/:ID" Method="DELETE" Call="DeleteFOIRequest" />
</Routes>
}

Parameter HTTP422UNPROCESSABLEENTITY As %String = "422 Unprocessible Entity";

/*===========================================================
// Allow Cross Origin scripting request
// or else front-end may not be able to receive response
// resulting in errors like this: 
// Cross-Origin Request Blocked: The Same Origin Policy
// disallows reading the remote resource at 
// http://localhost:9092/doje/api2/FOIRequest.
// (Reason: CORS header 'Access-Control-Allow-Origin' missing).
============================================================*/
Parameter HandleCorsRequest = 1;

/// The default response charset is utf-8
Parameter CHARSET = "utf-8";

ClassMethod CreateFOIRequest() As %Status
{
	#dim %request As %CSP.Request
	set data = ##class(%DynamicObject).%FromJSON(%request.Content)
	#dim FOIRequest as App.Data.FOIRequest
	set FOIRequest = ##class(App.Data.FOIRequest).%New()
	do FOIRequest.CopyFromObject(data)
	set st = FOIRequest.%Save()
	if (st = 1) {
		set jsonID = {}
		set st = FOIRequest.GetID(.jsonID)
		write jsonID.%ToJSON()
	}
	return st
}

ClassMethod RetrieveFOIRequest(FOIRequestID As %String) As %Status
{
	#dim FOIRequest as App.Data.FOIRequest
	set FOIRequest = ##class(App.Data.FOIRequest).%OpenId(FOIRequestID, , .st)
	if (st = 1) {
		set jsonFOIRequest = {}
		set st = FOIRequest.CopyToObject(.jsonFOIRequest)
		write jsonFOIRequest.%ToJSON()
	}
	return st
}

ClassMethod UpdateFOIRequest(FOIRequestID As %String) As %Status
{
	#dim %request As %CSP.Request
	set data = ##class(%DynamicObject).%FromJSON(%request.Content)
	#dim FOIRequest as App.Data.FOIRequest
	set FOIRequest = ##class(App.Data.FOIRequest).%OpenId(FOIRequestID, , .st)
	if (st = 1) {
		set jsonFOIRequest = {}
		set st = FOIRequest.CopyToObject(.jsonFOIRequest)
		write jsonFOIRequest.%ToJSON()
	}
	return st
}

ClassMethod DeleteFOIRequest(FOIRequestID As %String) As %Status
{
	#dim %response As %CSP.Response
	set st = ##class(App.Data.FOIRequest).%DeleteId(FOIRequestID)
	set %response.Status = ..#HTTP204NOCONTENT
	return st
}

/// Issue a '500' error and give some indication as to what occurred
/// (Overridden to interpret some particular %Status values as different HTTP status codes.)
ClassMethod Http500(ex As %Exception.AbstractException) As %Status
{
	set st = ex.AsStatus()
	set code = +$System.Status.GetErrorCodes(st)
    	return ..ReportHttpStatusCode($case(code,
    			$$$LoadObjectNotFound       :..#HTTP404NOTFOUND,
    			$$$DeleteObjectNotFound     :..#HTTP404NOTFOUND,
    			$$$KeyNotUnique             :..#HTTP422UNPROCESSABLEENTITY,
    			$$$PropertyRequired	        :..#HTTP422UNPROCESSABLEENTITY,
    			$$$DatatypeValidationFailed :..#HTTP422UNPROCESSABLEENTITY,
    			$$$AccessDenied             :..#HTTP403FORBIDDEN,
    			                            :..#HTTP500INTERNALSERVERERROR), st)
}

}
