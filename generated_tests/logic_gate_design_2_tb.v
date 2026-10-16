`timescale 1ns/1ps

module tb_logic_gate_design;

    reg a;
    reg b;
    wire x;
    wire y;
    wire z;

    // Instantiate the module under test (uut)
    logic_gate_design uut (
        .a(a),
        .b(b),
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (x !== 1 || y !== 1 || z !== 1) 
            $display("FAIL: Test case 1 failed (a=0, b=0)");
        
        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (x !== 1 || y !== 1 || z !== 0) 
            $display("FAIL: Test case 2 failed (a=0, b=1)");

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (x !== 0 || y !== 1 || z !== 0) 
            $display("FAIL: Test case 3 failed (a=1, b=0)");

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (x !== 0 || y !== 0 || z !== 0) 
            $display("FAIL: Test case 4 failed (a=1, b=1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule