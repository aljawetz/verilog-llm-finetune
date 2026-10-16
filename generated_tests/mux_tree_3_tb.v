`timescale 1ns/1ps

module tb_mux_tree;

    reg sel;
    reg a;
    wire y;

    // Instantiate the module under test
    mux_tree uut (
        .sel(sel),
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, a = 0
        sel = 0; a = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 1 failed (sel=0, a=0, y=%b)", y);
            $finish;
        end

        // Test case 2: sel = 0, a = 1
        sel = 0; a = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 2 failed (sel=0, a=1, y=%b)", y);
            $finish;
        end

        // Test case 3: sel = 1, a = 0
        sel = 1; a = 0;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 3 failed (sel=1, a=0, y=%b)", y);
            $finish;
        end

        // Test case 4: sel = 1, a = 1
        sel = 1; a = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 4 failed (sel=1, a=1, y=%b)", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule