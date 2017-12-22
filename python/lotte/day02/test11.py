flist = [lambda x, y: x+y, lambda x, y: x-y, lambda x, y: x*y]

for f in flist:
    print(f(20, 10))

func1 = lambda x: "100보다 크다." if x > 100 else "100보다 작다."

print(func1(120))
print(func1(20))

x = 49

if x > 50:
    pass
else:
    print(x)