var httpRequest;
var serviceURL = './api/wsc'

document.addEventListener("DOMContentLoaded", () => {
  var request = {"services":[]};
  var sl = document.getElementsByClassName("serviceplaceholder");
  for (let item of sl) {
    request.services.push({
      id: item.id,
      service: item.attributes.service.nodeValue,
      args: item.attributes.args.nodeValue
    });
  };
  makeRequest(request);
});


function makeRequest(request) {
  httpRequest = new XMLHttpRequest();

  if (!httpRequest) {
    alert('Giving up :( Cannot create an XMLHTTP instance');
    return false;
  }
  httpRequest.onreadystatechange = processResponse;
  httpRequest.open('POST', serviceURL);
  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  httpRequest.send( "data="+JSON.stringify(request) );
}

function processResponse() {
  if (httpRequest.readyState === XMLHttpRequest.DONE) {
    if (httpRequest.status === 200) {
       var response = JSON.parse(httpRequest.responseText);
       for(let item of response.services) {
         console.log(item);
         document.getElementById(item.id).innerHTML = decodeHtml(item.html);
       }
    } else {
      alert('There was a problem with the request.');
    }
  }
}

function decodeHtml(str)
{
    var map =
    {
        '&amp;': '&',
        '&lt;': '<',
        '&gt;': '>',
        '&quot;': '"',
        '&#039;': "'"
    };
    return str.replace(/&amp;|&lt;|&gt;|&quot;|&#039;/g, function(m) {return map[m];});
}
