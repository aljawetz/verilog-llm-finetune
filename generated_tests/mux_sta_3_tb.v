`timescale 1ns/1ps

module tb_mux_sta;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;
    reg [1:0] sel;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux_sta uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Initialize inputs
        a = 0; b = 0; c = 0; d = 0; sel = 2'b00;

        // Test case 1: Select a
        a = 1; b = 0; c = 0; d = 0; sel = 2'b00;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

        // Test case 2: Select b
        a = 0; b = 1; c = 0; d = 0; sel = 2'b01;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

        // Test case 3: Select c
        a = 0; b = 0; c = 1; d = 0; sel = 2'b10;
        #10;
        if (out !== 1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

        // Test case 4: Select d
        a = 0; b = 0; c = 0; d = 1; sel = 2'b11;
        #10;
        if (out !== 1) $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);

        // Test case 5: All inputs low
        a = 0; b = 0; c = 0; d = 0; sel = 2'b00;
        #10;
        if (out !== 0) $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);

        // Test case 6: All inputs high
        a = 1; b = 1; c = 1; d = 1; sel = 2'b00;
        #10;
        if (out !== 1) $display("FAIL: Test case 6 failed, expected out = 1, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule