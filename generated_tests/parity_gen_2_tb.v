`timescale 1ns/1ps

module tb_parity_gen;

    reg [2:0] a;
    wire even;

    // Instantiate the module under test (uut)
    parity_gen uut (
        .a(a),
        .even(even)
    );

    initial begin
        // Test cases
        // Test case 1: a = 3'b000 (even parity)
        a = 3'b000; #10;
        if (even !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected even = 0 for a = 000");
            $finish;
        end

        // Test case 2: a = 3'b001 (odd parity)
        a = 3'b001; #10;
        if (even !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected even = 1 for a = 001");
            $finish;
        end

        // Test case 3: a = 3'b010 (odd parity)
        a = 3'b010; #10;
        if (even !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected even = 1 for a = 010");
            $finish;
        end

        // Test case 4: a = 3'b011 (even parity)
        a = 3'b011; #10;
        if (even !== 1'b0) begin
            $display("FAIL: Test case 4 failed, expected even = 0 for a = 011");
            $finish;
        end

        // Test case 5: a = 3'b100 (odd parity)
        a = 3'b100; #10;
        if (even !== 1'b1) begin
            $display("FAIL: Test case 5 failed, expected even = 1 for a = 100");
            $finish;
        end

        // Test case 6: a = 3'b101 (even parity)
        a = 3'b101; #10;
        if (even !== 1'b0) begin
            $display("FAIL: Test case 6 failed, expected even = 0 for a = 101");
            $finish;
        end

        // Test case 7: a = 3'b110 (even parity)
        a = 3'b110; #10;
        if (even !== 1'b0) begin
            $display("FAIL: Test case 7 failed, expected even = 0 for a = 110");
            $finish;
        end

        // Test case 8: a = 3'b111 (odd parity)
        a = 3'b111; #10;
        if (even !== 1'b1) begin
            $display("FAIL: Test case 8 failed, expected even = 1 for a = 111");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule