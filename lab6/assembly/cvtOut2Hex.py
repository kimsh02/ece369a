# python3 cvtOut2Hex.py xxxxx.out

import sys

def main():
    path = sys.argv[1]
    with open(path) as file:
        for line in file:
            line = line.strip()
            if line.startswith("PC:"):
                print(cvt_line(line))
            else:
                print(line)

def cvt_line(line):
    line = line.split()
    if line[1].lower() == "x":
        pc = "x"
    else:
        pc = hex(int(line[1]))[2:]
    if line[4].lower() == "x":
        write_data = "x"
    else:
        write_data = hex(int(line[4]))[2:]
    return f"PC: {pc} | WriteData: {write_data}"

if __name__ == "__main__":
    main()

