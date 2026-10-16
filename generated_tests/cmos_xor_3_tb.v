`timescale 1ns/1ps

module tb_cmos_xor;

    reg in_a;
    reg in_b;
    wire out;

    // Instantiate the module under test
    cmos_xor uut (
        .in_a(in_a),
        .in_b(in_b),
        .out(out)
    );

    initial begin
        // Test case 1: in_a = 0, in_b = 0; Expected out = 0
        in_a = 0; in_b = 0;
        #10;
        if (out !== 1'b0) begin
            $display("FAIL: Test case 1 failed (in_a=0, in_b=0)");
            $finish;
        end

        // Test case 2: in_a = 0, in_b = 1; Expected out = 1
        in_a = 0; in_b = 1;
        #10;
        if (out !== 1'b1) begin
            $display("FAIL: Test case 2 failed (in_a=0, in_b=1)");
            $finish;
        end

        // Test case 3: in_a = 1, in_b = 0; Expected out = 1
        in_a = 1; in_b = 0;
        #10;
        if (out !== 1'b1) begin
            $display("FAIL: Test case 3 failed (in_a=1, in_b=0)");
            $finish;
        end

        // Test case 4: in_a = 1, in_b = 1; Expected out = 0
        in_a = 1; in_b = 1;
        #10;
        if (out !== 1'b0) begin
            $display("FAIL: Test case 4 failed (in_a=1, in_b=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule