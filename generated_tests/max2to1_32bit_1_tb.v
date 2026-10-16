`timescale 1ns/1ps

module tb_max2to1_32bit;

    reg signed [31:0] in0;
    reg signed [31:0] in1;
    wire signed [31:0] out0;

    // Instantiate the module under test (uut)
    max2to1_32bit uut (
        .in0(in0),
        .in1(in1),
        .out0(out0)
    );

    initial begin
        // Test case 1: in0 > in1
        in0 = 32'd10; 
        in1 = 32'd5;
        #10;
        if (out0 !== in0) begin
            $display("FAIL: Test case 1 failed, expected %d but got %d", in0, out0);
            $finish;
        end

        // Test case 2: in0 < in1
        in0 = 32'd3; 
        in1 = 32'd7;
        #10;
        if (out0 !== in1) begin
            $display("FAIL: Test case 2 failed, expected %d but got %d", in1, out0);
            $finish;
        end

        // Test case 3: in0 == in1
        in0 = 32'd15; 
        in1 = 32'd15;
        #10;
        if (out0 !== in0) begin
            $display("FAIL: Test case 3 failed, expected %d but got %d", in0, out0);
            $finish;
        end

        // Test case 4: in0 is negative, in1 is positive
        in0 = -32'd5; 
        in1 = 32'd5;
        #10;
        if (out0 !== in1) begin
            $display("FAIL: Test case 4 failed, expected %d but got %d", in1, out0);
            $finish;
        end

        // Test case 5: in0 is positive, in1 is negative
        in0 = 32'd5; 
        in1 = -32'd5;
        #10;
        if (out0 !== in0) begin
            $display("FAIL: Test case 5 failed, expected %d but got %d", in0, out0);
            $finish;
        end

        // Test case 6: both inputs negative
        in0 = -32'd10; 
        in1 = -32'd5;
        #10;
        if (out0 !== in1) begin
            $display("FAIL: Test case 6 failed, expected %d but got %d", in1, out0);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule