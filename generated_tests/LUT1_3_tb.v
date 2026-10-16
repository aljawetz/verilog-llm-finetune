`timescale 1ns/1ps

module tb_LUT1;

    reg in1, in2, in3;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    LUT1 uut (
        .out(out),
        .in1(in1),
        .in2(in2),
        .in3(in3)
    );

    initial begin
        // Test cases
        // Test case 1: in3=0, in2=0, in1=0 -> out should be 3'b000
        in3 = 0; in2 = 0; in1 = 0;
        #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected out=3'b000, got out=%b", out);
            $finish;
        end

        // Test case 2: in3=0, in2=0, in1=1 -> out should be 3'b001
        in3 = 0; in2 = 0; in1 = 1;
        #10;
        if (out !== 3'b001) begin
            $display("FAIL: Expected out=3'b001, got out=%b", out);
            $finish;
        end

        // Test case 3: in3=0, in2=1, in1=0 -> out should be 3'b001
        in3 = 0; in2 = 1; in1 = 0;
        #10;
        if (out !== 3'b001) begin
            $display("FAIL: Expected out=3'b001, got out=%b", out);
            $finish;
        end

        // Test case 4: in3=0, in2=1, in1=1 -> out should be 3'b010
        in3 = 0; in2 = 1; in1 = 1;
        #10;
        if (out !== 3'b010) begin
            $display("FAIL: Expected out=3'b010, got out=%b", out);
            $finish;
        end

        // Test case 5: in3=1, in2=0, in1=0 -> out should be 3'b001
        in3 = 1; in2 = 0; in1 = 0;
        #10;
        if (out !== 3'b001) begin
            $display("FAIL: Expected out=3'b001, got out=%b", out);
            $finish;
        end

        // Test case 6: in3=1, in2=0, in1=1 -> out should be 3'b010
        in3 = 1; in2 = 0; in1 = 1;
        #10;
        if (out !== 3'b010) begin
            $display("FAIL: Expected out=3'b010, got out=%b", out);
            $finish;
        end

        // Test case 7: in3=1, in2=1, in1=0 -> out should be 3'b010
        in3 = 1; in2 = 1; in1 = 0;
        #10;
        if (out !== 3'b010) begin
            $display("FAIL: Expected out=3'b010, got out=%b", out);
            $finish;
        end

        // Test case 8: in3=1, in2=1, in1=1 -> out should be 3'b011
        in3 = 1; in2 = 1; in1 = 1;
        #10;
        if (out !== 3'b011) begin
            $display("FAIL: Expected out=3'b011, got out=%b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule