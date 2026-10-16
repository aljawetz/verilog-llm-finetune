`timescale 1ns/1ps

module tb_gfadder;

    reg [4:0] in1, in2;
    wire [4:0] out;

    // Instantiate the module under test (uut)
    gfadder uut (
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    initial begin
        // Test case 1: 00000 + 00000 = 00000
        in1 = 5'b00000; in2 = 5'b00000;
        #10;
        if (out !== 5'b00000) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 11111 + 11111 = 00000
        in1 = 5'b11111; in2 = 5'b11111;
        #10;
        if (out !== 5'b00000) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 10101 + 01010 = 11111
        in1 = 5'b10101; in2 = 5'b01010;
        #10;
        if (out !== 5'b11111) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 11000 + 00111 = 11111
        in1 = 5'b11000; in2 = 5'b00111;
        #10;
        if (out !== 5'b11111) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 01101 + 10010 = 11111
        in1 = 5'b01101; in2 = 5'b10010;
        #10;
        if (out !== 5'b11111) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 00001 + 11111 = 11110
        in1 = 5'b00001; in2 = 5'b11111;
        #10;
        if (out !== 5'b11110) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule