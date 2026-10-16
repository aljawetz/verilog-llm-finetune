`timescale 1ns/1ps

module tb_mux_tree;

    // Inputs
    reg sel;
    reg a;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux_tree uut (
        .sel(sel),
        .a(a),
        .y(y)
    );

    initial begin
        // Initialize Inputs
        sel = 0;
        a = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: sel = 0, a = 0 => y should be 0
        sel = 0; a = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 1 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 2: sel = 0, a = 1 => y should be 1
        sel = 0; a = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 2 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 3: sel = 1, a = 0 => y should be 1
        sel = 1; a = 0;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 3 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 4: sel = 1, a = 1 => y should be 1
        sel = 1; a = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule