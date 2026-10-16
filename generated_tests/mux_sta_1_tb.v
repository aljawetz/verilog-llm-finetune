`timescale 1ns/1ps

module tb_mux_sta;

    reg a;
    reg b;
    reg c;
    reg d;
    reg [1:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_sta uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select input a
        a = 1; b = 0; c = 0; d = 0; sel = 2'b00;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed");

        // Test case 2: Select input b
        a = 0; b = 1; c = 0; d = 0; sel = 2'b01;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: Select input c
        a = 0; b = 0; c = 1; d = 0; sel = 2'b10;
        #10;
        if (out !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: Select input d
        a = 0; b = 0; c = 0; d = 1; sel = 2'b11;
        #10;
        if (out !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: All inputs low, select input a
        a = 0; b = 0; c = 0; d = 0; sel = 2'b00;
        #10;
        if (out !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: All inputs low, select input b
        a = 0; b = 0; c = 0; d = 0; sel = 2'b01;
        #10;
        if (out !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: All inputs low, select input c
        a = 0; b = 0; c = 0; d = 0; sel = 2'b10;
        #10;
        if (out !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: All inputs low, select input d
        a = 0; b = 0; c = 0; d = 0; sel = 2'b11;
        #10;
        if (out !== 0) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule