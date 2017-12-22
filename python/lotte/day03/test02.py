import pickle

data = ["Python", "is", "Simple"]

f = open("test02.txt", "wb")

pickle.dump(data, f)

print("-" * 30)
print("객체 저장 성공")

f.close()

f = open("test02.txt", "rb")

result = pickle.load(f)

print("-" * 30)
print(type(result))
print(result)

f.close()