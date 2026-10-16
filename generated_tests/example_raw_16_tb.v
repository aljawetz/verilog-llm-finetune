`timescale 1ns/1ps

module tb_example_raw;

    reg [255:0] a;
    wire [255:0] s;

    // Instantiate the module under test (uut)
    example_raw uut (
        .a(a),
        .s(s)
    );

    initial begin
        // Test case 1: All bits set to 0
        a = 256'b0;
        #10;
        if (s !== 256'b0) begin
            $display("FAIL: Test case 1 failed, expected s = 0, got s = %b", s);
            $finish;
        end

        // Test case 2: All bits set to 1
        a = 256'b1111111111111111111111111111111111111111111111111111111111111111;
        #10;
        if (s !== 256'b1111111111111111111111111111111111111111111111111111111111111111) begin
            $display("FAIL: Test case 2 failed, expected s = 1, got s = %b", s);
            $finish;
        end

        // Test case 3: Alternating bits
        a = 256'b1010101010101010101010101010101010101010101010101010101010101010;
        #10;
        if (s !== 256'b1010101010101010101010101010101010101010101010101010101010101010) begin
            $display("FAIL: Test case 3 failed, expected s = 10101010..., got s = %b", s);
            $finish;
        end

        // Test case 4: Random pattern
        a = 256'b1100110011001100110011001100110011001100110011001100110011001100;
        #10;
        if (s !== 256'b1100110011001100110011001100110011001100110011001100110011001100) begin
            $display("FAIL: Test case 4 failed, expected s = 11001100..., got s = %b", s);
            $finish;
        end

        // Test case 5: Incrementing pattern
        a = 256'h00000000000000000000000000000000000000000000000000000000000000FF; // Last byte set
        #10;
        if (s !== 256'h00000000000000000000000000000000000000000000000000000000000000FF) begin
            $display("FAIL: Test case 5 failed, expected s = 00...00FF, got s = %b", s);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule