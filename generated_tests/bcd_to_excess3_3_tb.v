`timescale 1ns/1ps

module tb_bcd_to_excess3;

    reg [3:0] bcd_in;
    wire [3:0] xs3_out;

    // Instantiate the module under test (uut)
    bcd_to_excess3 uut (
        .bcd_in(bcd_in),
        .xs3_out(xs3_out)
    );

    initial begin
        // Test cases
        // Test case 0: BCD 0 (0000) -> Excess-3 3 (0011)
        bcd_in = 4'b0000; #10;
        if (xs3_out !== 4'b0011) begin
            $display("FAIL: Test case 0 failed. Expected 0011, got %b", xs3_out);
            $finish;
        end

        // Test case 1: BCD 1 (0001) -> Excess-3 4 (0100)
        bcd_in = 4'b0001; #10;
        if (xs3_out !== 4'b0100) begin
            $display("FAIL: Test case 1 failed. Expected 0100, got %b", xs3_out);
            $finish;
        end

        // Test case 2: BCD 2 (0010) -> Excess-3 5 (0101)
        bcd_in = 4'b0010; #10;
        if (xs3_out !== 4'b0101) begin
            $display("FAIL: Test case 2 failed. Expected 0101, got %b", xs3_out);
            $finish;
        end

        // Test case 3: BCD 3 (0011) -> Excess-3 6 (0110)
        bcd_in = 4'b0011; #10;
        if (xs3_out !== 4'b0110) begin
            $display("FAIL: Test case 3 failed. Expected 0110, got %b", xs3_out);
            $finish;
        end

        // Test case 4: BCD 4 (0100) -> Excess-3 7 (0111)
        bcd_in = 4'b0100; #10;
        if (xs3_out !== 4'b0111) begin
            $display("FAIL: Test case 4 failed. Expected 0111, got %b", xs3_out);
            $finish;
        end

        // Test case 5: BCD 5 (0101) -> Excess-3 8 (1000)
        bcd_in = 4'b0101; #10;
        if (xs3_out !== 4'b1000) begin
            $display("FAIL: Test case 5 failed. Expected 1000, got %b", xs3_out);
            $finish;
        end

        // Test case 6: BCD 6 (0110) -> Excess-3 9 (1001)
        bcd_in = 4'b0110; #10;
        if (xs3_out !== 4'b1001) begin
            $display("FAIL: Test case 6 failed. Expected 1001, got %b", xs3_out);
            $finish;
        end

        // Test case 7: BCD 7 (0111) -> Excess-3 10 (1010)
        bcd_in = 4'b0111; #10;
        if (xs3_out !== 4'b1010) begin
            $display("FAIL: Test case 7 failed. Expected 1010, got %b", xs3_out);
            $finish;
        end

        // Test case 8: BCD 8 (1000) -> Excess-3 11 (1011)
        bcd_in = 4'b1000; #10;
        if (xs3_out !== 4'b1011) begin
            $display("FAIL: Test case 8 failed. Expected 1011, got %b", xs3_out);
            $finish;
        end

        // Test case 9: BCD 9 (1001) -> Excess-3 12 (1100)
        bcd_in = 4'b1001; #10;
        if (xs3_out !== 4'b1100) begin
            $display("FAIL: Test case 9 failed. Expected 1100, got %b", xs3_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule