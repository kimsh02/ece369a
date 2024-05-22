import os

def main():
    filenames = os.listdir()
    for filename in filenames:
        if filename.endswith(".s"):
            remove_nops(filename)

def remove_nops(filename):
    lines = []
    with open(filename) as file:
        for line in file:
            if line.strip() == "nop":
                pass
            else:
                lines.append(line)
    with open(filename, "w") as file:
        file.writelines(lines)

if __name__ == "__main__":
    main()

