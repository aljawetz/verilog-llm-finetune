`timescale 1ns/1ps

module tb_good_mux;

    // Inputs
    reg i0;
    reg i1;
    reg sel;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    good_mux uut (
        .i0(i0),
        .i1(i1),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, expect y = i0
        i0 = 0; i1 = 1; sel = 0;
        #10;
        if (y !== i0) $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", i0, y);

        // Test case 2: sel = 1, expect y = i1
        i0 = 0; i1 = 1; sel = 1;
        #10;
        if (y !== i1) $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", i1, y);

        // Test case 3: sel = 0, expect y = i0
        i0 = 1; i1 = 0; sel = 0;
        #10;
        if (y !== i0) $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", i0, y);

        // Test case 4: sel = 1, expect y = i1
        i0 = 1; i1 = 0; sel = 1;
        #10;
        if (y !== i1) $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", i1, y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule