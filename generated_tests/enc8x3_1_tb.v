`timescale 1ns/1ps

module tb_enc8x3;

    reg [7:0] in;
    wire [2:0] out;
    wire valid;

    // Instantiate the module under test
    enc8x3 uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        // Test case 1: Only the highest bit is active
        in = 8'b10000000; // Expect out = 3'b111, valid = 1
        #10;
        if (out !== 3'b111 || valid !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Middle bit is active
        in = 8'b00100000; // Expect out = 3'b101, valid = 1
        #10;
        if (out !== 3'b101 || valid !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Lower bit is active
        in = 8'b00000010; // Expect out = 3'b001, valid = 1
        #10;
        if (out !== 3'b001 || valid !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: No bits are active
        in = 8'b00000000; // Expect out = 3'b000, valid = 0
        #10;
        if (out !== 3'b000 || valid !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Multiple bits active, highest priority
        in = 8'b01100000; // Expect out = 3'b110, valid = 1
        #10;
        if (out !== 3'b110 || valid !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: All bits active
        in = 8'b11111111; // Expect out = 3'b111, valid = 1
        #10;
        if (out !== 3'b111 || valid !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule