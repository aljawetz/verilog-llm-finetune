`timescale 1ns/1ps

module tb_ShiftLeft1;

    reg [31:0] d_in;
    wire [31:0] d_out;

    // Instantiate the module under test (uut)
    ShiftLeft1 uut (
        .d_in(d_in),
        .d_out(d_out)
    );

    initial begin
        // Test case 1: Shift 0
        d_in = 32'b00000000000000000000000000000000; // Input: 0
        #10;
        if (d_out !== 32'b00000000000000000000000000000000) begin
            $display("FAIL: Test case 1 failed, expected 0, got %b", d_out);
            $finish;
        end

        // Test case 2: Shift 1
        d_in = 32'b00000000000000000000000000000001; // Input: 1
        #10;
        if (d_out !== 32'b00000000000000000000000000000010) begin
            $display("FAIL: Test case 2 failed, expected 2, got %b", d_out);
            $finish;
        end

        // Test case 3: Shift 2
        d_in = 32'b00000000000000000000000000000010; // Input: 2
        #10;
        if (d_out !== 32'b00000000000000000000000000000100) begin
            $display("FAIL: Test case 3 failed, expected 4, got %b", d_out);
            $finish;
        end

        // Test case 4: Shift maximum value
        d_in = 32'b11111111111111111111111111111111; // Input: 2^32 - 1
        #10;
        if (d_out !== 32'b11111111111111111111111111111110) begin
            $display("FAIL: Test case 4 failed, expected 4294967294, got %b", d_out);
            $finish;
        end

        // Test case 5: Shift a random value
        d_in = 32'b10101010101010101010101010101010; // Input: 0xAAAAAAAA
        #10;
        if (d_out !== 32'b01010101010101010101010101010100) begin
            $display("FAIL: Test case 5 failed, expected 0x55555554, got %b", d_out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule