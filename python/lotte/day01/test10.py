s1 = {10, 20, 30, 40, 50}
s2 = {30, 40, 50, 60, 70}
print(s1)
print(s2)
print(type(s1))
print(type(s2))
s = s1.union(s2)
print(s)
s = s1 | s2
print(s)
s = s1.intersection(s2)
print(s)
s = s1 & s2
print(s)
s = s1 - s2
print(s)
s = s1.difference(s2)