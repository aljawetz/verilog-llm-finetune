`timescale 1ns/1ps

module tb_partial_case_assign;

    // Inputs
    reg i0;
    reg i1;
    reg i2;
    reg [1:0] sel;

    // Outputs
    wire y;
    wire x;

    // Instantiate the Unit Under Test (UUT)
    partial_case_assign uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .sel(sel),
        .y(y),
        .x(x)
    );

    initial begin
        // Initialize inputs
        i0 = 0; i1 = 0; i2 = 0; sel = 2'b00;
        
        // Test case 1: sel = 00
        i0 = 1; i1 = 0; i2 = 0; sel = 2'b00; #10;
        if (y !== 1 || x !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: sel = 01
        i0 = 0; i1 = 1; i2 = 0; sel = 2'b01; #10;
        if (y !== 1 || x !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: sel = 10
        i0 = 0; i1 = 0; i2 = 1; sel = 2'b10; #10;
        if (y !== 1 || x !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: sel = 11
        i0 = 0; i1 = 1; i2 = 1; sel = 2'b11; #10;
        if (y !== 1 || x !== 1) $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule