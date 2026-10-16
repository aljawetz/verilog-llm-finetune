`timescale 1ns/1ps

module tb_min4to1_3bit;

    // Inputs
    reg [2:0] in0;
    reg [2:0] in1;
    reg [2:0] in2;
    reg [2:0] in3;

    // Outputs
    wire [2:0] out0;

    // Instantiate the Unit Under Test (UUT)
    min4to1_3bit uut (
        .in0(in0), 
        .in1(in1), 
        .in2(in2), 
        .in3(in3), 
        .out0(out0)
    );

    initial begin
        // Test case 1: all inputs are equal
        in0 = 3'b010; in1 = 3'b010; in2 = 3'b010; in3 = 3'b010;
        #10;
        if (out0 !== 3'b010) $display("FAIL: Test case 1 failed");

        // Test case 2: distinct values
        in0 = 3'b001; in1 = 3'b010; in2 = 3'b011; in3 = 3'b000;
        #10;
        if (out0 !== 3'b000) $display("FAIL: Test case 2 failed");

        // Test case 3: minimum is in in1
        in0 = 3'b100; in1 = 3'b000; in2 = 3'b010; in3 = 3'b011;
        #10;
        if (out0 !== 3'b000) $display("FAIL: Test case 3 failed");

        // Test case 4: minimum is in in2
        in0 = 3'b110; in1 = 3'b101; in2 = 3'b001; in3 = 3'b111;
        #10;
        if (out0 !== 3'b001) $display("FAIL: Test case 4 failed");

        // Test case 5: minimum is in in3
        in0 = 3'b111; in1 = 3'b110; in2 = 3'b101; in3 = 3'b000;
        #10;
        if (out0 !== 3'b000) $display("FAIL: Test case 5 failed");

        // Test case 6: random values
        in0 = 3'b011; in1 = 3'b101; in2 = 3'b010; in3 = 3'b001;
        #10;
        if (out0 !== 3'b001) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule