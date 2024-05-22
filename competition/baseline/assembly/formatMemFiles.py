# Load assembly file into MipsHelper2018

# CHECK Include Original Code as Comments
# CHECK Output 32 bit Hexadecimal Values
# UNCHECK Output Verilog Code
# CHECK Output Data Memory
# CHECK Nonblocking Assignment in Verilog Code

# Click on Assemble
# File -> Save -> Instruction Memory into instruction_memoryxxxxx.mem
# File -> Save -> Data Memory into data_memoryxxxxx.mem
# Put this script into same directory as these 2 mem files

# Run script: python3 formatMemFiles.py

# Formats all instruction and data mem files in current directory
# Can be run multiple times

import os

def main():
    filenames = os.listdir()
    for filename in filenames:
        if (filename.startswith("instruction_memory") and
            filename.endswith(".mem")):
            formatInstrMem(filename)
        elif (filename.startswith("data_memory") and
              filename.endswith(".mem")):
            formatDataMem(filename)

def formatInstrMem(filename):
    temp = []
    with open(filename) as file:
        for line in file:
            line = line[:8]
            if len(line) == 8:
                temp.append(line + "\n")
    with open(filename, "w") as file:
        file.writelines(temp)

def formatDataMem(filename):
    temp = []
    with open(filename) as file:
        for line in file:
            if len(line) == 8 + 1:
                temp.append(line)
            elif len(line) > 8 + 1:
                last_word = line.split()[-1][:-1]
                neg = last_word[0] == "-"
                if neg:
                    hex_str = last_word[5:]
                else:
                    hex_str = last_word[4:]
                dec_val = int(hex_str, 16)
                if neg:
                    dec_val = 2**32 - dec_val
                hex_str = hex(dec_val)[2:]
                hex_str = hex_str.rjust(8, "0")
                temp.append(hex_str + "\n")
    with open(filename, "w") as file:
        file.writelines(temp)

if __name__ == "__main__":
    main()

