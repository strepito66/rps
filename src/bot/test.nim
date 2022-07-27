import std/json
import std/httpclient
import std/asyncdispatch
var texto = "Rocks"
proc apireq(x: string): Future[string] {.async.} =
  var client = newAsyncHttpClient()
  return await client.getContent("http://localhost:5000/api/play/" & x)

if true:
    var req = waitFor apireq(texto)
    var json = parseJson(req)
    var text = json{"result"}.getStr()
    echo text