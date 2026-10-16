`timescale 1ns/1ps

module tb_odd_parity_df;

    reg [2:0] data;
    wire odd_p;

    // Instantiate the module under test (uut)
    odd_parity_df uut (
        .data(data),
        .odd_p(odd_p)
    );

    initial begin
        // Test case 1: data = 3'b000
        data = 3'b000; #10;
        if (odd_p !== 1'b1) begin
            $display("FAIL: Test case 1 failed for data = 3'b000");
            $finish;
        end

        // Test case 2: data = 3'b001
        data = 3'b001; #10;
        if (odd_p !== 1'b0) begin
            $display("FAIL: Test case 2 failed for data = 3'b001");
            $finish;
        end

        // Test case 3: data = 3'b010
        data = 3'b010; #10;
        if (odd_p !== 1'b0) begin
            $display("FAIL: Test case 3 failed for data = 3'b010");
            $finish;
        end

        // Test case 4: data = 3'b011
        data = 3'b011; #10;
        if (odd_p !== 1'b1) begin
            $display("FAIL: Test case 4 failed for data = 3'b011");
            $finish;
        end

        // Test case 5: data = 3'b100
        data = 3'b100; #10;
        if (odd_p !== 1'b0) begin
            $display("FAIL: Test case 5 failed for data = 3'b100");
            $finish;
        end

        // Test case 6: data = 3'b101
        data = 3'b101; #10;
        if (odd_p !== 1'b1) begin
            $display("FAIL: Test case 6 failed for data = 3'b101");
            $finish;
        end

        // Test case 7: data = 3'b110
        data = 3'b110; #10;
        if (odd_p !== 1'b1) begin
            $display("FAIL: Test case 7 failed for data = 3'b110");
            $finish;
        end

        // Test case 8: data = 3'b111
        data = 3'b111; #10;
        if (odd_p !== 1'b0) begin
            $display("FAIL: Test case 8 failed for data = 3'b111");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule