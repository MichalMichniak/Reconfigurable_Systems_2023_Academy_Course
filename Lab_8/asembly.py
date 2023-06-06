def to_bin(directive : str):
    directive = directive.replace(",", " ")
    tokens = directive.split()
    R = {f"R{i}" : f"{bin(i)[2:]:0>3}" for i in range(8)}
    r = {f"r{i}" : f"{bin(i)[2:]:0>3}" for i in range(8)}
    R.update(r)
    print(tokens)
    strr_bin = "000000"
    if tokens[0] == "nop":
        return "00000000000000000000011000000000"
    elif tokens[0] == "jump":
        strr_bin = strr_bin + "0100010" + R[tokens[1]] + "0" + R["R6"] + "0" + R["R6"] + "00000000"
        return strr_bin
    elif tokens[0] == "jumpi":
        strr_bin = strr_bin + "0100010" + R["R6"] + "10000" + R["R6"] + f"{bin(int(tokens[1],base=0))[2:]:0>8}"
        return strr_bin
    elif tokens[0] == "jz":
        strr_bin = strr_bin + "1100110" + R[tokens[1]] + "10000" + R["R6"] + f"{bin(int(tokens[2],base=0))[2:]:0>8}"
        return strr_bin
    elif tokens[0] == "jnz":
        strr_bin = strr_bin + "1000110" + R[tokens[1]] + "10000" + R["R6"] + f"{bin(int(tokens[2],base=0))[2:]:0>8}"
        return strr_bin
    elif tokens[0] == "add":
        strr_bin = strr_bin + "0000010" + R[tokens[2]] + "0"+ R[tokens[3]] + "0" + R[tokens[1]] + "00000000"
        return strr_bin
    elif tokens[0] == "addi":
        strr_bin = strr_bin + "0000010" + R[tokens[2]] + "1000" + "0" + R[tokens[1]] + f"{bin(int(tokens[3],base=0))[2:]:0>8}"
        return strr_bin
    elif tokens[0] == "and":
        strr_bin = strr_bin + "0000000" + R[tokens[2]] + "0"+ R[tokens[3]] + "0" + R[tokens[1]] + "00000000"
        return strr_bin
    elif tokens[0] == "andi":
        strr_bin = strr_bin + "0000000" + R[tokens[2]] + "1000" + "0" + R[tokens[1]] + f"{bin(int(tokens[3],base=0))[2:]:0>8}"
        return strr_bin
    elif tokens[0] == "load":
        strr_bin = strr_bin + "00001100000" + R[tokens[2]] + "1" + R[tokens[1]] + "00000000"
        return strr_bin
    elif tokens[0] == "loadi":
        strr_bin = strr_bin + "00001100001" + "000" + "1" + R[tokens[1]] + f"{bin(int(tokens[2],base=0))[2:]:0>8}"
        return strr_bin
    elif tokens[0] == "mov":
        strr_bin = strr_bin + "0000010" + R["R6"] + "0"+ R[tokens[2]] + "0" + R[tokens[1]] + "00000000"
        return strr_bin
    elif tokens[0] == "movi":
        strr_bin = strr_bin + "0000010" + R["R6"] + "1000" + "0" + R[tokens[1]] + f"{bin(int(tokens[2],base=0))[2:]:0>8}"
        return strr_bin
    else:
        raise ValueError(f"invalid token: {tokens[0]}")
        
    pass



def translate(path):
    lst = []
    with open(path) as file:
        for line in file.readlines():
            if line.isspace():
                continue
            directive = line if line[-1] != '\n' else line[:-1]
            lst.append(to_bin(directive))
    with open("./code_bin.txt","w") as file:
        for i in lst:
            file.write(i + "\n")
    with open("./verilog_code.txt","w") as file:
        for n,i in enumerate(lst):
            file.write(f"assign program[{n}]=32'b"+ i +";\n")
    print(lst)
    pass






if __name__ == '__main__':
    translate("./code.txt")