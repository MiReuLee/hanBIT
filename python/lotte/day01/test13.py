val1 = {"a": "aa", "b": "bb", "c": "cc"}

print(val1)
print(type(val1))

val2 = dict()
val2["a"] = "aa"
val2["b"] = "bb"
val2["c"] = "cc"

print(val2)
print(type(val2))

word = {"a":"apple", "b":"banana"}

print("-" * 30)

for d in word.items():
    print(d)

print("-" * 30)

for k, v in word.items():
    print(k, v)

print("-" * 30)

for k in word.keys():
    print(k)

print("-" * 30)

for v in word.values():
    print(v)

print("-" * 30)