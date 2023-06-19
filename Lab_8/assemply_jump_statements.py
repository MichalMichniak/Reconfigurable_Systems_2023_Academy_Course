
dict_aliases = {}

def to_asm_map(directive : str, nr_line : int):
    for n,i in enumerate(directive):
        if i == "/":
            directive = directive[:n]
    directive = directive.replace(",", " ")
    tokens = directive.split()
    tokens_parse = []
    for i in tokens:
        if i[0] == '@':
            dict_aliases[i[1:]] = nr_line
        else:
            tokens_parse.append(i)
    if tokens == []:
        return " "
    return tokens_parse[0] + " " + ", ".join(tokens_parse[1:])

def to_asm_substitute(directive : str):
    directive = directive.replace(",", " ")
    tokens = directive.split()
    for n,i in enumerate(tokens):
        if i in dict_aliases.keys():
            h_num = hex(dict_aliases[i])
            if len(h_num) == 3:
                 h_num = h_num[:2] + '0' + h_num[2]
            if len(h_num) < 4:
                raise ValueError(h_num)
            tokens[n] = h_num
    return tokens[0] + " " + ", ".join(tokens[1:])

def consolidate_jmp(path):
    lst = []
    nr = 0
    lst2 = []
    with open(path) as file:
        for line in file.readlines():
            if line.isspace():
                continue
            directive = line if line[-1] != '\n' else line[:-1]
            line2 = to_asm_map(directive, nr)
            if line2.isspace():
                continue
            lst.append(line2)
            nr += 1
        nr = 0
        for line in lst:
            lst2.append(to_asm_substitute(line))
    with open("./code_test_asm.txt","w") as file:
        for i in lst2:
            file.write(i + "\n")
    print(lst2)



if __name__ == '__main__':
    consolidate_jmp("./code_test_plain.txt")