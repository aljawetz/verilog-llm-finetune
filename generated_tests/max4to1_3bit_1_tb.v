`timescale 1ns/1ps

module tb_max4to1_3bit;

    reg [2:0] in0, in1, in2, in3;
    wire [2:0] out0;

    // Instantiate the module under test (uut)
    max4to1_3bit uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out0(out0)
    );

    initial begin
        // Test case 1
        in0 = 3'b000; in1 = 3'b001; in2 = 3'b010; in3 = 3'b011;
        #10;
        if (out0 !== 3'b011) $display("FAIL: Test case 1 failed, expected 3'b011, got %b", out0);

        // Test case 2
        in0 = 3'b111; in1 = 3'b110; in2 = 3'b101; in3 = 3'b100;
        #10;
        if (out0 !== 3'b111) $display("FAIL: Test case 2 failed, expected 3'b111, got %b", out0);

        // Test case 3
        in0 = 3'b010; in1 = 3'b010; in2 = 3'b010; in3 = 3'b010;
        #10;
        if (out0 !== 3'b010) $display("FAIL: Test case 3 failed, expected 3'b010, got %b", out0);

        // Test case 4
        in0 = 3'b100; in1 = 3'b101; in2 = 3'b110; in3 = 3'b011;
        #10;
        if (out0 !== 3'b110) $display("FAIL: Test case 4 failed, expected 3'b110, got %b", out0);

        // Test case 5
        in0 = 3'b000; in1 = 3'b000; in2 = 3'b000; in3 = 3'b000;
        #10;
        if (out0 !== 3'b000) $display("FAIL: Test case 5 failed, expected 3'b000, got %b", out0);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule