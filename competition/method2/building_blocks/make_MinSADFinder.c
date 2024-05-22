// Generates MinSADFinder.v

#include <stdio.h>
#include <assert.h>

int main() {
    // Write verilog header.
    FILE* file;
    file = fopen("MinSADFinder.v", "w");
    fprintf(file, "`timescale 1ns / 1ps\n");
    fprintf(file, "\n");
    fprintf(file, "module MinSADFinder(SADValues, MinI, MinJ, MinVal);\n");
    fprintf(file, "\n");
    fprintf(file, "    input [64*64*12-1:0] SADValues;\n");
    fprintf(file, "    output wire [5:0] MinI, MinJ;\n");
    fprintf(file, "    output wire [11:0] MinVal;\n");
    fprintf(file, "\n");

    int numRows = 64;
    int numCols = 64;
    int windowWidth = 4;
    int windowHeight = 4;

    // Generate and store zig zag search pattern.
    int searchPattern[61*61+1]; // Add 1 so that it is even.
    searchPattern[0] = 0;
    int searchPatternI = 1;
    int i = 0; int j = 0;
    int direction = 1;  // 1 is up, 0 is down.
    searchPattern[searchPatternI] = i * numCols + j;
    searchPatternI++;
    while (1) {
        if (i == numRows - windowHeight && j == numCols - windowWidth) {
            break;
        }
        int nextI;
        int nextJ;
        if (direction) {
            nextI = i - 1;
            nextJ = j + 1;
        } else {
            nextI = i + 1;
            nextJ = j - 1;
        }
        // Check if out of bounds. If nextIJ out of bounds, switch direction.
        if (nextI < 0 || nextI >= numRows - windowHeight + 1 || nextJ < 0 || nextJ >= numCols - windowWidth + 1) {
            if (i == 0 && j != numCols - windowWidth) {
                // Go right.
                j += 1;
            } else if (j == numCols - windowWidth) {
                // Go down.
                i += 1;
            } else if (j == 0 && i != numRows - windowHeight) {
                // Go down.
                i += 1;
            } else {
                // Go right.
                j += 1;
            }
            direction = !direction;
        } else {
            i = nextI;
            j = nextJ;
        }
        searchPattern[searchPatternI] = i * numCols + j;
        searchPatternI++;
    }
    assert(searchPatternI == 61*61+1);

    // Write the search pattern in verilog.
    int comparatorI = 0;
    // Level 1.
    for (int i = 0; i < 61*61+1; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(SADValues[%d*12 +: 12], %d, %d, SADValues[%d*12 +: 12], %d, %d, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            searchPattern[i], searchPattern[i] / 64, searchPattern[i] % 64,
            searchPattern[i+1], searchPattern[i+1] / 64, searchPattern[i+1] % 64,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 2.
    fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
    fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
    fprintf(file, "    assign comp%dminVal = 4095;\n", comparatorI);
    fprintf(file, "    assign comp%dminI = 0;\n", comparatorI);
    fprintf(file, "    assign comp%dminJ = 0;\n", comparatorI);
    comparatorI++;
    for (int i = 0; i < 1861; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 3.
    fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
    fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
    fprintf(file, "    assign comp%dminVal = 4095;\n", comparatorI);
    fprintf(file, "    assign comp%dminI = 0;\n", comparatorI);
    fprintf(file, "    assign comp%dminJ = 0;\n", comparatorI);
    comparatorI++;
    for (int i = 1862; i < 2793; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 4.
    for (int i = 2794; i < 3259; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 5.
    fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
    fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
    fprintf(file, "    assign comp%dminVal = 4095;\n", comparatorI);
    fprintf(file, "    assign comp%dminI = 0;\n", comparatorI);
    fprintf(file, "    assign comp%dminJ = 0;\n", comparatorI);
    comparatorI++;
    for (int i = 3260; i < 3493; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }
    
    // Level 6.
    fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
    fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
    fprintf(file, "    assign comp%dminVal = 4095;\n", comparatorI);
    fprintf(file, "    assign comp%dminI = 0;\n", comparatorI);
    fprintf(file, "    assign comp%dminJ = 0;\n", comparatorI);
    comparatorI++;
    for (int i = 3494; i < 3611; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 7.
    fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
    fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
    fprintf(file, "    assign comp%dminVal = 4095;\n", comparatorI);
    fprintf(file, "    assign comp%dminI = 0;\n", comparatorI);
    fprintf(file, "    assign comp%dminJ = 0;\n", comparatorI);
    comparatorI++;
    for (int i = 3612; i < 3671; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 8.
    for (int i = 3672; i < 3701; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 9.
    fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
    fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
    fprintf(file, "    assign comp%dminVal = 4095;\n", comparatorI);
    fprintf(file, "    assign comp%dminI = 0;\n", comparatorI);
    fprintf(file, "    assign comp%dminJ = 0;\n", comparatorI);
    comparatorI++;
    for (int i = 3702; i < 3717; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 10.
    for (int i = 3718; i < 3725; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 11.
    for (int i = 3726; i < 3729; i += 2) {
        fprintf(file, "    wire [11:0] comp%dminVal;\n", comparatorI);
        fprintf(file, "    wire [5:0] comp%dminI, comp%dminJ;\n", comparatorI, comparatorI);
        fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ);\n", comparatorI,
            i, i, i,
            i+1, i+1, i+1,
            comparatorI, comparatorI, comparatorI);
        comparatorI++;
    }

    // Level 12.
    fprintf(file, "    Comparator comp%d(comp%dminVal, comp%dminI, comp%dminJ, comp%dminVal, comp%dminI, comp%dminJ, MinVal, MinI, MinJ);\n", comparatorI,
        3730, 3730, 3730,
        3731, 3731, 3731);
    comparatorI++;

    fprintf(file, "\nendmodule\n");
    fclose(file);
    return 0;
}

