import json

with open("json.txt", "r", encoding="utf-8") as f:
    data = json.loads(f.read())

print(type(data))
# print(data)
for item in data["channel"]["item"]:
    print(item["author"], item["title"])