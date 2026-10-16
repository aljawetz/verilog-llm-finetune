`timescale 1ns/1ps

module tb_LUT1;

    reg in1, in2, in3;
    wire [2:0] out;
    
    // Instantiate the module under test
    LUT1 uut (
        .out(out),
        .in1(in1),
        .in2(in2),
        .in3(in3)
    );

    initial begin
        // Test cases
        // Test case 1: in3=0, in2=0, in1=0 -> out should be 000
        in3 = 0; in2 = 0; in1 = 0; #10;
        if (out !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", out);

        // Test case 2: in3=0, in2=0, in1=1 -> out should be 001
        in3 = 0; in2 = 0; in1 = 1; #10;
        if (out !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", out);

        // Test case 3: in3=0, in2=1, in1=0 -> out should be 001
        in3 = 0; in2 = 1; in1 = 0; #10;
        if (out !== 3'b001) $display("FAIL: Test case 3 failed, expected 001, got %b", out);

        // Test case 4: in3=0, in2=1, in1=1 -> out should be 010
        in3 = 0; in2 = 1; in1 = 1; #10;
        if (out !== 3'b010) $display("FAIL: Test case 4 failed, expected 010, got %b", out);

        // Test case 5: in3=1, in2=0, in1=0 -> out should be 001
        in3 = 1; in2 = 0; in1 = 0; #10;
        if (out !== 3'b001) $display("FAIL: Test case 5 failed, expected 001, got %b", out);

        // Test case 6: in3=1, in2=0, in1=1 -> out should be 010
        in3 = 1; in2 = 0; in1 = 1; #10;
        if (out !== 3'b010) $display("FAIL: Test case 6 failed, expected 010, got %b", out);

        // Test case 7: in3=1, in2=1, in1=0 -> out should be 010
        in3 = 1; in2 = 1; in1 = 0; #10;
        if (out !== 3'b010) $display("FAIL: Test case 7 failed, expected 010, got %b", out);

        // Test case 8: in3=1, in2=1, in1=1 -> out should be 011
        in3 = 1; in2 = 1; in1 = 1; #10;
        if (out !== 3'b011) $display("FAIL: Test case 8 failed, expected 011, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule