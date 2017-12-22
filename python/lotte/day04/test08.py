import json
from urllib.request import urlopen

request_url = "https://apis.daum.net/search/cafe"
request_url += ""
request_url += "&q=python&result=5&output=json"

data = urlopen(request_url).read().decode("utf-8")
data = json.loads(data)

print(data)

for item in data["channel"]["item"]:
    print(item["link"])