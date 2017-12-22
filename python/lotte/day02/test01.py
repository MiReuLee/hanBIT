value = True
if value:
    print("value is True")
value = 10
if value == 10:
    print("value is 10")
value = 100
if value == 10:
    print("value is 10")
else:
    print("value isn't 10")

num = input(("Input Korean's score"))
print(type(num))
score = int(num)
print(type(score))
if 90 <= score <= 100:
    credits = "A"
elif 80 <= score < 90:
    credits = "B"
elif 70 <= score < 80:
    credits = "C"
elif 60 <= score < 70:
    credits = "D"
else:
    credits = "F"
print(credits)