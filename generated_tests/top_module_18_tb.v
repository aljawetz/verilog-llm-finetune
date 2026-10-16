`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg a;
    reg b;
    reg c;

    // Outputs
    wire w;
    wire x;
    wire y;
    wire z;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .a(a), 
        .b(b), 
        .c(c), 
        .w(w), 
        .x(x), 
        .y(y), 
        .z(z)
    );

    initial begin
        // Test case 1: All inputs low
        a = 0; b = 0; c = 0;
        #10;
        if (w !== 0 || x !== 0 || y !== 0 || z !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a high, b low, c low
        a = 1; b = 0; c = 0;
        #10;
        if (w !== 1 || x !== 0 || y !== 0 || z !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a low, b high, c low
        a = 0; b = 1; c = 0;
        #10;
        if (w !== 0 || x !== 1 || y !== 1 || z !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a low, b low, c high
        a = 0; b = 0; c = 1;
        #10;
        if (w !== 0 || x !== 0 || y !== 0 || z !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: All inputs high
        a = 1; b = 1; c = 1;
        #10;
        if (w !== 1 || x !== 1 || y !== 1 || z !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule