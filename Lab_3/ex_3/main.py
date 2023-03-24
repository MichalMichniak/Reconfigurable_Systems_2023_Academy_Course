if __name__ == '__main__':
    strr = "alamapsaidwakoty"
    with open("./ala_ma_psa.txt","w") as file:
        for i in strr:
            file.write(("0"*(8 - len(str(bin(ord(i)))[2:]))+str(bin(ord(i)))[2:])[::-1] + '\t')
    with open("./ala_ma_psa.bin","wb") as file:
        file.write(strr.encode())