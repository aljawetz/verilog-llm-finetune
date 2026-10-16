`timescale 1ns/1ps

module tb_top_module;

    reg c;
    reg d;
    wire [3:0] mux_in;

    // Instantiate the module under test
    top_module uut (
        .c(c),
        .d(d),
        .mux_in(mux_in)
    );

    initial begin
        // Test case 1: c = 0, d = 0
        c = 0; d = 0;
        #10;
        if (mux_in !== 4'b1000) $display("FAIL: Test case 1 failed (c=0, d=0)");
        
        // Test case 2: c = 0, d = 1
        c = 0; d = 1;
        #10;
        if (mux_in !== 4'b1001) $display("FAIL: Test case 2 failed (c=0, d=1)");
        
        // Test case 3: c = 1, d = 0
        c = 1; d = 0;
        #10;
        if (mux_in !== 4'b1010) $display("FAIL: Test case 3 failed (c=1, d=0)");
        
        // Test case 4: c = 1, d = 1
        c = 1; d = 1;
        #10;
        if (mux_in !== 4'b1111) $display("FAIL: Test case 4 failed (c=1, d=1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule