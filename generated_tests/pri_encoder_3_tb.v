`timescale 1ns/1ps

module tb_pri_encoder;

    reg [7:0] in;
    wire [2:0] out;
    wire valid;

    // Instantiate the unit under test (uut)
    pri_encoder uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        // Test case 1: All inputs low
        in = 8'b0000_0000; #10;
        if (out !== 3'bxxx || valid !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Only LSB active
        in = 8'b0000_0001; #10;
        if (out !== 3'b000 || valid !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Second LSB active
        in = 8'b0000_0010; #10;
        if (out !== 3'b001 || valid !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Third LSB active
        in = 8'b0000_0100; #10;
        if (out !== 3'b010 || valid !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Fourth LSB active
        in = 8'b0000_1000; #10;
        if (out !== 3'b011 || valid !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Fifth LSB active
        in = 8'b0001_0000; #10;
        if (out !== 3'b100 || valid !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Sixth LSB active
        in = 8'b0010_0000; #10;
        if (out !== 3'b101 || valid !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: Seventh LSB active
        in = 8'b0100_0000; #10;
        if (out !== 3'b110 || valid !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: Eighth LSB active
        in = 8'b1000_0000; #10;
        if (out !== 3'b111 || valid !== 1) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: Multiple inputs active (highest priority)
        in = 8'b1100_0000; #10;
        if (out !== 3'b111 || valid !== 1) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        // Test case 11: Multiple inputs active (lower priority)
        in = 8'b0011_0000; #10;
        if (out !== 3'b101 || valid !== 1) begin
            $display("FAIL: Test case 11 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule