`timescale 1ns/1ps

module tb_Encoder4To2;
    reg [3:0] in;
    wire [1:0] out;

    // Instantiate the module under test
    Encoder4To2 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Input is 0001
        in = 4'b0001; #10;
        if (out !== 2'b00) begin
            $display("FAIL: Expected out = 00 for in = 0001, got out = %b", out);
            $finish;
        end

        // Test case 2: Input is 0010
        in = 4'b0010; #10;
        if (out !== 2'b01) begin
            $display("FAIL: Expected out = 01 for in = 0010, got out = %b", out);
            $finish;
        end

        // Test case 3: Input is 0100
        in = 4'b0100; #10;
        if (out !== 2'b10) begin
            $display("FAIL: Expected out = 10 for in = 0100, got out = %b", out);
            $finish;
        end

        // Test case 4: Input is 1000 (should default to 11)
        in = 4'b1000; #10;
        if (out !== 2'b11) begin
            $display("FAIL: Expected out = 11 for in = 1000, got out = %b", out);
            $finish;
        end

        // Test case 5: Input is 0000 (should also default to 11)
        in = 4'b0000; #10;
        if (out !== 2'b11) begin
            $display("FAIL: Expected out = 11 for in = 0000, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule