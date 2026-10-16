`timescale 1ns/1ps

module tb_bin_to_one_hot;

    reg [3:0] bin;
    wire [15:0] one_hot;

    // Instantiate the module under test (uut)
    bin_to_one_hot uut (
        .bin(bin),
        .one_hot(one_hot)
    );

    initial begin
        // Test cases
        // Test case 0: bin = 0
        bin = 4'b0000; #10;
        if (one_hot !== 16'b0000000000000001) begin
            $display("FAIL: Expected one_hot = 0000000000000001 for bin = 0000");
            $finish;
        end

        // Test case 1: bin = 1
        bin = 4'b0001; #10;
        if (one_hot !== 16'b0000000000000010) begin
            $display("FAIL: Expected one_hot = 0000000000000010 for bin = 0001");
            $finish;
        end

        // Test case 2: bin = 2
        bin = 4'b0010; #10;
        if (one_hot !== 16'b0000000000000100) begin
            $display("FAIL: Expected one_hot = 0000000000000100 for bin = 0010");
            $finish;
        end

        // Test case 3: bin = 3
        bin = 4'b0011; #10;
        if (one_hot !== 16'b0000000000001000) begin
            $display("FAIL: Expected one_hot = 0000000000001000 for bin = 0011");
            $finish;
        end

        // Test case 4: bin = 4
        bin = 4'b0100; #10;
        if (one_hot !== 16'b0000000000010000) begin
            $display("FAIL: Expected one_hot = 0000000000010000 for bin = 0100");
            $finish;
        end

        // Test case 5: bin = 5
        bin = 4'b0101; #10;
        if (one_hot !== 16'b0000000000100000) begin
            $display("FAIL: Expected one_hot = 0000000000100000 for bin = 0101");
            $finish;
        end

        // Test case 6: bin = 6
        bin = 4'b0110; #10;
        if (one_hot !== 16'b0000000001000000) begin
            $display("FAIL: Expected one_hot = 0000000001000000 for bin = 0110");
            $finish;
        end

        // Test case 7: bin = 7
        bin = 4'b0111; #10;
        if (one_hot !== 16'b0000000010000000) begin
            $display("FAIL: Expected one_hot = 0000000010000000 for bin = 0111");
            $finish;
        end

        // Test case 8: bin = 8
        bin = 4'b1000; #10;
        if (one_hot !== 16'b0000000100000000) begin
            $display("FAIL: Expected one_hot = 0000000100000000 for bin = 1000");
            $finish;
        end

        // Test case 9: bin = 9
        bin = 4'b1001; #10;
        if (one_hot !== 16'b0000001000000000) begin
            $display("FAIL: Expected one_hot = 0000001000000000 for bin = 1001");
            $finish;
        end

        // Test case 10: bin = 10
        bin = 4'b1010; #10;
        if (one_hot !== 16'b0000010000000000) begin
            $display("FAIL: Expected one_hot = 0000010000000000 for bin = 1010");
            $finish;
        end

        // Test case 11: bin = 11
        bin = 4'b1011; #10;
        if (one_hot !== 16'b0000100000000000) begin
            $display("FAIL: Expected one_hot = 0000100000000000 for bin = 1011");
            $finish;
        end

        // Test case 12: bin = 12
        bin = 4'b1100; #10;
        if (one_hot !== 16'b0001000000000000) begin
            $display("FAIL: Expected one_hot = 0001000000000000 for bin = 1100");
            $finish;
        end

        // Test case 13: bin = 13
        bin = 4'b1101; #10;
        if (one_hot !== 16'b0010000000000000) begin
            $display("FAIL: Expected one_hot = 0010000000000000 for bin = 1101");
            $finish;
        end

        // Test case 14: bin = 14
        bin = 4'b1110; #10;
        if (one_hot !== 16'b0100000000000000) begin
            $display("FAIL: Expected one_hot = 0100000000000000 for bin = 1110");
            $finish;
        end

        // Test case 15: bin = 15
        bin = 4'b1111; #10;
        if (one_hot !== 16'b1000000000000000) begin
            $display("FAIL: Expected one_hot = 1000000000000000 for bin = 1111");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule