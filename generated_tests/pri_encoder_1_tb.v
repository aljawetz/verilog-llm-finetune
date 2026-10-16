`timescale 1ns/1ps

module tb_pri_encoder;

    reg [7:0] in;
    wire [2:0] out;
    wire valid;

    // Instantiate the module under test (uut)
    pri_encoder uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        // Test case 1: All zeros
        in = 8'b0000_0000; #10;
        if (out !== 3'bxxx || valid !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Single bit set (0)
        in = 8'b0000_0001; #10;
        if (out !== 3'b000 || valid !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Second bit set
        in = 8'b0000_0010; #10;
        if (out !== 3'b001 || valid !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Third bit set
        in = 8'b0000_0100; #10;
        if (out !== 3'b010 || valid !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Fourth bit set
        in = 8'b0000_1000; #10;
        if (out !== 3'b011 || valid !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Fifth bit set
        in = 8'b0001_0000; #10;
        if (out !== 3'b100 || valid !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Sixth bit set
        in = 8'b0010_0000; #10;
        if (out !== 3'b101 || valid !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: Seventh bit set
        in = 8'b0100_0000; #10;
        if (out !== 3'b110 || valid !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: Eighth bit set
        in = 8'b1000_0000; #10;
        if (out !== 3'b111 || valid !== 1) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: Multiple bits set (first)
        in = 8'b0000_0110; #10;
        if (out !== 3'b010 || valid !== 1) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        // Test case 11: Multiple bits set (second)
        in = 8'b0001_1110; #10;
        if (out !== 3'b100 || valid !== 1) begin
            $display("FAIL: Test case 11 failed");
            $finish;
        end

        // Test case 12: Multiple bits set (third)
        in = 8'b1111_1111; #10;
        if (out !== 3'b111 || valid !== 1) begin
            $display("FAIL: Test case 12 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule