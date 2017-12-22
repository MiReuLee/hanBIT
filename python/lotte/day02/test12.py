def a(b):
    c = ""
    for i in b:
        if ord("a") <= ord(i) <= ord("x") or ord("A") <= ord(i) <= ord("X"):
            i = chr(ord(i) + 2)
        elif ord("y") <= ord(i) <= ord("z") or ord("Y") <= ord(i) <= ord("Z"):
            i = chr(ord(i)-(ord("z")-ord("b")))

        c += i
    return c

d = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."

e = a(d)

f = str.maketrans(e, e)

print(f.keys())