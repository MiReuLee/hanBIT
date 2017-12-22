result = "100" if 100 > 50 else "50" if "a" else  "b"

print(range(10, 20, 2))
for i in range(len(range(10, 20, 2))):
    print("index: {0}, value: {1}".format(i, range(10, 20, 2)[i]))

print("-" * 30)

l = [10, 20, 30, 40, 50];
l2= [i**2 for i in l]
print(l2)
t = ("baseball", "score", "swimming")
l3 = [len(i) for i in t]
print(l3)
d = {1:"baseball", 2:"score", 3:"swimming"}
l4 = [v.upper() for v in d.values()]
print(l4)
l5 = [i**2 for i in range(10)]
print(l5)
