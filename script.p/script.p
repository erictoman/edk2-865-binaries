from os import listdir
from os.path import isfile, join
from shutil import copyfile

path = "./"
savePath="./full/"
onlyfiles = [f for f in listdir(path) if isfile(join(path, f))]
from pathlib import Path


def getName(file):
    name = file[:file.rfind("_body")]
    name = name[name.rfind("_")+1:]
    return name

for file in onlyfiles:
    name = getName(file)
    Path(savePath+name+"/").mkdir(parents=True, exist_ok=True)

for file in onlyfiles:
    name = getName(file)
    originalName = name 
    if "dependency" in file:
        name=name+".depex"
    if "PE32" in file:
        name=name+".efi"
    copyfile("./"+file,savePath+"/"+originalName+"/"+name)