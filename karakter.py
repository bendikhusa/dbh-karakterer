import json
import urllib.request

url2 = "https://api.nsd.no/dbhapitjener/Tabeller/hentJSONTabellData"

with urllib.request.urlopen(url2) as url:
    data = json.loads(url.read().decode())
    print(data)
