`timescale 1ns/1ps

module tb_top_module;

    reg [7:0] in;
    wire parity;

    // Instantiate the module under test (uut)
    top_module uut (
        .in(in),
        .parity(parity)
    );

    initial begin
        // Test case 1: Input with 0 ones (00000000)
        in = 8'b00000000;
        #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected parity 0, got %b", parity);
            $finish;
        end

        // Test case 2: Input with 1 one (00000001)
        in = 8'b00000001;
        #10;
        if (parity !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected parity 1, got %b", parity);
            $finish;
        end

        // Test case 3: Input with 2 ones (00000011)
        in = 8'b00000011;
        #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 3 failed, expected parity 0, got %b", parity);
            $finish;
        end

        // Test case 4: Input with 3 ones (00000111)
        in = 8'b00000111;
        #10;
        if (parity !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected parity 1, got %b", parity);
            $finish;
        end

        // Test case 5: Input with 4 ones (11110000)
        in = 8'b11110000;
        #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected parity 0, got %b", parity);
            $finish;
        end

        // Test case 6: Input with 5 ones (11111000)
        in = 8'b11111000;
        #10;
        if (parity !== 1'b1) begin
            $display("FAIL: Test case 6 failed, expected parity 1, got %b", parity);
            $finish;
        end

        // Test case 7: Input with 6 ones (11111100)
        in = 8'b11111100;
        #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 7 failed, expected parity 0, got %b", parity);
            $finish;
        end

        // Test case 8: Input with 7 ones (11111110)
        in = 8'b11111110;
        #10;
        if (parity !== 1'b1) begin
            $display("FAIL: Test case 8 failed, expected parity 1, got %b", parity);
            $finish;
        end

        // Test case 9: Input with 8 ones (11111111)
        in = 8'b11111111;
        #10;
        if (parity !== 1'b0) begin
            $display("FAIL: Test case 9 failed, expected parity 0, got %b", parity);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule