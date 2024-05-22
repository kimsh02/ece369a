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
    pc = hex(int(line[1]))[2:]
    write_data = hex(int(line[4]))[2:]
    return f"PC: {pc} | WriteData: {write_data}"

if __name__ == "__main__":
    main()

