`timescale 1ns/1ps

module tb_top_module;

    reg [7:0] in;
    wire [7:0] out;

    // Instantiate the module under test
    top_module uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Input is 8'b00000000
        in = 8'b00000000;
        #10;
        if (out !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed, expected 00000000, got %b", out);
            $finish;
        end

        // Test case 2: Input is 8'b11111111
        in = 8'b11111111;
        #10;
        if (out !== 8'b11111111) begin
            $display("FAIL: Test case 2 failed, expected 11111111, got %b", out);
            $finish;
        end

        // Test case 3: Input is 8'b10101010
        in = 8'b10101010;
        #10;
        if (out !== 8'b01010101) begin
            $display("FAIL: Test case 3 failed, expected 01010101, got %b", out);
            $finish;
        end

        // Test case 4: Input is 8'b11001100
        in = 8'b11001100;
        #10;
        if (out !== 8'b00110011) begin
            $display("FAIL: Test case 4 failed, expected 00110011, got %b", out);
            $finish;
        end

        // Test case 5: Input is 8'b00001111
        in = 8'b00001111;
        #10;
        if (out !== 8'b11110000) begin
            $display("FAIL: Test case 5 failed, expected 11110000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule