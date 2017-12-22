import random
try:
    num = random.randint(1, 10)
    print("숫자가 홀수일 경우 오류 강제 발생시킴")
    print("발생 숫자 : {}".format(num))
    if num % 2:
        raise Exception("홀수 에러 발생")
except Exception as err:
    print("에러 발생 {}".format(err))
