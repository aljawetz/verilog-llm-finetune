`timescale 1ns/1ps

module tb_encoder;

    reg [7:0] in;
    wire [2:0] pow;

    // Instantiate the encoder module
    encoder uut (
        .in(in),
        .pow(pow)
    );

    initial begin
        // Test case 1: All bits low
        in = 8'b00000000; #10;
        if (pow !== 3'd0) begin
            $display("FAIL: Test case 1 failed, expected pow = 0, got pow = %b", pow);
            $finish;
        end

        // Test case 2: LSB set
        in = 8'b00000001; #10;
        if (pow !== 3'd0) begin
            $display("FAIL: Test case 2 failed, expected pow = 0, got pow = %b", pow);
            $finish;
        end

        // Test case 3: Second LSB set
        in = 8'b00000010; #10;
        if (pow !== 3'd1) begin
            $display("FAIL: Test case 3 failed, expected pow = 1, got pow = %b", pow);
            $finish;
        end

        // Test case 4: Middle bit set
        in = 8'b00001100; #10;
        if (pow !== 3'd2) begin
            $display("FAIL: Test case 4 failed, expected pow = 2, got pow = %b", pow);
            $finish;
        end

        // Test case 5: Higher bit set
        in = 8'b01000000; #10;
        if (pow !== 3'd6) begin
            $display("FAIL: Test case 5 failed, expected pow = 6, got pow = %b", pow);
            $finish;
        end

        // Test case 6: MSB set
        in = 8'b10000000; #10;
        if (pow !== 3'd7) begin
            $display("FAIL: Test case 6 failed, expected pow = 7, got pow = %b", pow);
            $finish;
        end

        // Test case 7: Multiple bits set, LSB should take priority
        in = 8'b00001101; #10;
        if (pow !== 3'd0) begin
            $display("FAIL: Test case 7 failed, expected pow = 0, got pow = %b", pow);
            $finish;
        end

        // Test case 8: Multiple bits set, higher priority bit should take precedence
        in = 8'b00101100; #10;
        if (pow !== 3'd2) begin
            $display("FAIL: Test case 8 failed, expected pow = 2, got pow = %b", pow);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule