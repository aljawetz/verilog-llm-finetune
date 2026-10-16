`timescale 1ns/1ps

module tb_parity_check;

    reg [7:0] in;
    wire parity;

    // Instantiate the module under test (uut)
    parity_check uut (
        .in(in),
        .parity(parity)
    );

    initial begin
        // Test cases
        // Test case 1: All zeros
        in = 8'b00000000; #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected parity 0, got %b", parity);
            $finish;
        end

        // Test case 2: One bit set (odd number of 1s)
        in = 8'b00000001; #10;
        if (parity !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected parity 1, got %b", parity);
            $finish;
        end

        // Test case 3: Two bits set (even number of 1s)
        in = 8'b00000011; #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 3 failed, expected parity 0, got %b", parity);
            $finish;
        end

        // Test case 4: Four bits set (even number of 1s)
        in = 8'b11110000; #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 4 failed, expected parity 0, got %b", parity);
            $finish;
        end

        // Test case 5: Five bits set (odd number of 1s)
        in = 8'b11111000; #10;
        if (parity !== 1'b1) begin
            $display("FAIL: Test case 5 failed, expected parity 1, got %b", parity);
            $finish;
        end

        // Test case 6: All ones
        in = 8'b11111111; #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 6 failed, expected parity 0, got %b", parity);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule