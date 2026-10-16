`timescale 1ns/1ps

module tb_reg_file;
    parameter BITS = 16;
    parameter DEPTH = 16;
    parameter ADDR = 4;

    reg clk;
    reg rstn;
    reg WE;
    reg RE1;
    reg RE2;
    reg [BITS - 1 : 0] WD;
    reg [ADDR - 1 : 0] WA;
    reg [ADDR - 1 : 0] RA1;
    reg [ADDR - 1 : 0] RA2;
    wire [BITS - 1 : 0] RD1;
    wire [BITS - 1 : 0] RD2;

    reg_file #(BITS, DEPTH, ADDR) uut (
        .clk(clk),
        .rstn(rstn),
        .WE(WE),
        .RE1(RE1),
        .RE2(RE2),
        .WD(WD),
        .WA(WA),
        .RA1(RA1),
        .RA2(RA2),
        .RD1(RD1),
        .RD2(RD2)
    );

    initial begin
        clk = 0;
        rstn = 0;
        WE = 0;
        RE1 = 0;
        RE2 = 0;
        WD = 0;
        WA = 0;
        RA1 = 0;
        RA2 = 0;

        // Reset the register file
        #5 rstn = 1;

        // Test 1: Write to register 0 and read it back
        WE = 1; WA = 0; WD = 16'hA5A5; 
        #10 WE = 0; RE1 = 1; RA1 = 0; 
        #10 if (RD1 !== 16'hA5A5) $display("FAIL: Test 1 failed, expected 0xA5A5, got 0x%h", RD1); 

        // Test 2: Write to register 1 and read it back
        WE = 1; WA = 1; WD = 16'h5A5A; 
        #10 WE = 0; RE2 = 1; RA2 = 1; 
        #10 if (RD2 !== 16'h5A5A) $display("FAIL: Test 2 failed, expected 0x5A5A, got 0x%h", RD2); 

        // Test 3: Read from an uninitialized register
        RE1 = 1; RA1 = 2; 
        #10 if (RD1 !== 16'h0000) $display("FAIL: Test 3 failed, expected 0x0000, got 0x%h", RD1); 

        // Test 4: Write to register 2 and read it back
        WE = 1; WA = 2; WD = 16'hFFFF; 
        #10 WE = 0; RE1 = 1; RA1 = 2; 
        #10 if (RD1 !== 16'hFFFF) $display("FAIL: Test 4 failed, expected 0xFFFF, got 0x%h", RD1); 

        // Test 5: Reset and check all registers
        rstn = 0; 
        #5 rstn = 1; 
        RE1 = 1; RA1 = 0; 
        #10 if (RD1 !== 16'h0000) $display("FAIL: Test 5 failed, expected 0x0000, got 0x%h", RD1); 

        // If all tests pass
        $display("PASS");
        $finish;
    end

    always #5 clk = ~clk;

endmodule