`timescale 1ns/1ps

module tb_gfadder;

    reg [0:4] in1;
    reg [0:4] in2;
    wire [0:4] out;

    // Instantiate the module under test (uut)
    gfadder uut (
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    initial begin
        // Test case 1: Simple addition
        in1 = 5'b00001; // 1
        in2 = 5'b00001; // 1
        #10;
        if (out !== 5'b00000) begin
            $display("FAIL: Test case 1 failed, expected 00000, got %b", out);
            $finish;
        end

        // Test case 2: Different inputs
        in1 = 5'b00011; // 3
        in2 = 5'b00010; // 2
        #10;
        if (out !== 5'b00001) begin
            $display("FAIL: Test case 2 failed, expected 00001, got %b", out);
            $finish;
        end

        // Test case 3: All bits set
        in1 = 5'b11111; // 31
        in2 = 5'b11111; // 31
        #10;
        if (out !== 5'b00000) begin
            $display("FAIL: Test case 3 failed, expected 00000, got %b", out);
            $finish;
        end

        // Test case 4: Mixed inputs
        in1 = 5'b10101; // 21
        in2 = 5'b01010; // 10
        #10;
        if (out !== 5'b11111) begin
            $display("FAIL: Test case 4 failed, expected 11111, got %b", out);
            $finish;
        end

        // Test case 5: Zero inputs
        in1 = 5'b00000; // 0
        in2 = 5'b00000; // 0
        #10;
        if (out !== 5'b00000) begin
            $display("FAIL: Test case 5 failed, expected 00000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule