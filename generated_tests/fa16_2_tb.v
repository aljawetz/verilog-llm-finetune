`timescale 1ns/1ps

module tb_fa16;
    reg [15:0] a, b;
    reg ci;
    wire [15:0] s;
    wire co;

    // Instantiate the module under test (uut)
    fa16 uut (
        .a(a),
        .b(b),
        .ci(ci),
        .s(s),
        .co(co)
    );

    initial begin
        // Test case 1: Simple addition without carry
        a = 16'h0001; b = 16'h0001; ci = 0; #10;
        if (s !== 16'h0002 || co !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: Addition with carry
        a = 16'hFFFF; b = 16'h0001; ci = 0; #10;
        if (s !== 16'h0000 || co !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: Addition with carry-in
        a = 16'h0001; b = 16'h0001; ci = 1; #10;
        if (s !== 16'h0003 || co !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: Large numbers with carry
        a = 16'h7FFF; b = 16'h7FFF; ci = 0; #10;
        if (s !== 16'hFFFF || co !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: All bits set
        a = 16'hFFFF; b = 16'hFFFF; ci = 1; #10;
        if (s !== 16'hFFFF || co !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: Zero addition
        a = 16'h0000; b = 16'h0000; ci = 0; #10;
        if (s !== 16'h0000 || co !== 0) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule