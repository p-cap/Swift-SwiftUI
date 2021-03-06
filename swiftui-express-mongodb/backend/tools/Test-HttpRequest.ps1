####################################
#
# Test-HttpRequest
#
###################################

<#
    .SYNOPSIS

    This is script is utilized to test endpoints via http requests
    

    .EXAMPLE
    
    PS > .\Test-HttpRequest.ps1 -Method Get

    StatusCode        : 200
    StatusDescription : OK
    Content           : {"_id":"5fd93c6509b6691e0c69519d","name":"ate","__v":0}
    RawContent        : HTTP/1.1 200 OK
                        Connection: keep-alive
                        Content-Length: 55
                        Content-Type: application/json; charset=utf-8
                        Date: Tue, 15 Dec 2020 22:44:53 GMT
                        ETag: W/"37-hUi7j8Xm8BI/YUR6ygPV2Eub1oU"
                        X-Powered-By:...
    Forms             : 
    Headers           : {[Connection, keep-alive], [Content-Length, 55], [Content-Type, application/json; charset=utf-8], [Date, Tue, 15 Dec 2020 22:44:53 GMT]...}
    Images            : {}
    InputFields       : {}
    Links             : {}
    ParsedHtml        : 
    RawContentLength  : 55

    .EXAMPLE

    PS > .\Test-HttpRequest.ps1 -Method Post -file .\body.txt

    NOTE: Provide a text file in a json format
    
        PS > cat .\body.txt
        {
            "name" : "ate"
        }

    StatusCode        : 200
    StatusDescription : OK
    Content           : {"_id":"5fd93ddd09b6691e0c69519e","name":"ate","__v":0}
    RawContent        : HTTP/1.1 200 OK
                        Connection: keep-alive
                        Content-Length: 55
                        Content-Type: application/json; charset=utf-8
                        Date: Tue, 15 Dec 2020 22:51:09 GMT
                        ETag: W/"37-1NXQw206IPyP40wpLjFWQOGZWJY"
                        X-Powered-By:...
    Forms             : 
    Headers           : {[Connection, keep-alive], [Content-Length, 55], [Content-Type, application/json; charset=utf-8], [Date, Tue, 15 Dec 2020 22:51:09 GMT]...}
    Images            : {}
    InputFields       : {}
    Links             : {}
    ParsedHtml        : 
    RawContentLength  : 55

    .EXAMPLE

    PS > .\Test-HttpRequest.ps1 -Method Put -file .\body.txt

    NOTE: Change the url path to the info you want to update and the body.txt is the new value

    StatusCode        : 200
    StatusDescription : OK
    Content           : {"n":1,"nModified":1,"ok":1}
    RawContent        : HTTP/1.1 200 OK
                        Connection: keep-alive
                        Content-Length: 28
                        Content-Type: application/json; charset=utf-8
                        Date: Tue, 15 Dec 2020 23:13:58 GMT
                        ETag: W/"1c-9CSp0YZbwVi1S/g+0CyT4pOh1+k"
                        X-Powered-By:...
    Forms             : 
    Headers           : {[Connection, keep-alive], [Content-Length, 28], [Content-Type, application/json; charset=utf-8], [Date, Tue, 15 Dec 2020 23:13:58 GMT]...}
    Images            : {}
    InputFields       : {}
    Links             : {}
    ParsedHtml        : 
    RawContentLength  : 28

    .EXAMPLE

    PS > .\Test-HttpRequest.ps1 -Method delete 

    NOTE: Update url path to the value you want to delete

    StatusCode        : 204
    StatusDescription : No Content
    Content           : {}
    RawContent        : HTTP/1.1 204 No Content
                        Connection: keep-alive
                        Date: Tue, 15 Dec 2020 23:14:36 GMT
                        ETag: W/"21-jpjqTng1P4DwjAZEsyC0/4/FOfo"
                        X-Powered-By: Express
                    
                    
    Headers           : {[Connection, keep-alive], [Date, Tue, 15 Dec 2020 23:14:36 GMT], [ETag, W/"21-jpjqTng1P4DwjAZEsyC0/4/FOfo"], [X-Powered-By, Express]}
    RawContentLength  : 0
#>

param(
    ##HTTP method
    [Parameter(Mandatory = $true,
                ValueFromPipeline=$True
    )] [String] $Method,

    [String]$file
)

if ($file) {
    $jsonFile = Get-Content $file
}

Switch($Method) {
    Get { Invoke-WebRequest http://localhost:5555/apps -UseBasicParsing }
    Post {
        Invoke-WebRequest http://localhost:5555/add `
            -Method 'POST' `
            -ContentType 'application/json; charset=utf-8' `
            -Body @( $jsonFile ) `
            -UseBasicParsing
        break
    }
    Put {
        Invoke-WebRequest http://localhost:5555/update/Tresom`
            -Method 'PUT' `
            -ContentType 'application/json; charset=utf-8' `
            -Body @( $jsonFile ) `
            -UseBasicParsing
        break
    }
    Delete {
        Invoke-WebRequest http://localhost:5555/delete/Tin`
            -Method 'DELETE' `
            -UseBasicParsing
        break
    }
}
  