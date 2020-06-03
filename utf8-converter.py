import os
import os.path

dirpath = "D:/FBX SDK/FBX SDK/2020.1/samples/ImportScene"
files  = os.listdir(dirpath)
for f in files:
    p = dirpath+"/"+f
    if os.path.isfile(p):
        print(p)
        f1  = open(p, encoding="windows 1252")
        c1  = f1.read()
        
        f1.close()
        f2 = open(p, 'w',encoding="utf-8")
        f2.write(c1)
        f2.close()
# path1 = "D:/FBX SDK/FBX SDK/2020.1/samples/ImportScene/DisplayCommon.cxx"
# path2 = "D:/FBX SDK/FBX SDK/2020.1/samples/ImportScene/DisplayCommon2.cxx"
# coding1 = "windows 1252"
# coding2 = "utf-8"
# f= open(path1, 'r', encoding=coding1)
# content= f.read()
# f.close()
# f= open(path2, 'w', encoding=coding2)
# f.write(content)
# f.close()
# print("done")
