`timescale 1ns/1ps

module tb_top_module;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] s;
    wire overflow;

    // Instantiate the module under test (uut)
    top_module uut (
        .a(a),
        .b(b),
        .s(s),
        .overflow(overflow)
    );

    initial begin
        // Test case 1: Simple addition without overflow
        a = 8'h1A; // 26
        b = 8'h05; // 5
        #10;
        if (s !== 8'h1F || overflow !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: Addition resulting in overflow
        a = 8'hFF; // 255
        b = 8'h01; // 1
        #10;
        if (s !== 8'h00 || overflow !== 1'b1) $display("FAIL: Test case 2 failed");

        // Test case 3: Zero addition
        a = 8'h00; // 0
        b = 8'h00; // 0
        #10;
        if (s !== 8'h00 || overflow !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: Negative number addition (two's complement)
        a = 8'h80; // -128
        b = 8'h80; // -128
        #10;
        if (s !== 8'h00 || overflow !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: Positive and negative number
        a = 8'h7F; // 127
        b = 8'h01; // 1
        #10;
        if (s !== 8'h80 || overflow !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: Maximum positive addition
        a = 8'h7F; // 127
        b = 8'h7F; // 127
        #10;
        if (s !== 8'hFE || overflow !== 1'b1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule