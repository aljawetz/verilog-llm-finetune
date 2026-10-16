`timescale 1ns/1ps

module tb_top_module;

    reg [7:0] in;
    wire [31:0] out;

    // Instantiate the module under test (uut)
    top_module uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Positive value
        in = 8'b00000001; // 1 in decimal
        #10;
        if (out !== 32'b00000000000000000000000000000001) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Zero value
        in = 8'b00000000; // 0 in decimal
        #10;
        if (out !== 32'b00000000000000000000000000000000) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Negative value (sign bit is 1)
        in = 8'b11111111; // -1 in decimal
        #10;
        if (out !== 32'b11111111111111111111111111111111) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Mid-range positive value
        in = 8'b01111111; // 127 in decimal
        #10;
        if (out !== 32'b00000000000000000000000001111111) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Mid-range negative value
        in = 8'b10000000; // -128 in decimal
        #10;
        if (out !== 32'b11111111111111111111111110000000) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule