`timescale 1ns/1ps

module tb_logic_gate_design;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire x;
    wire y;
    wire z;

    // Instantiate the Unit Under Test (UUT)
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
        if (x !== 1'b1 || y !== 1'b1 || z !== 1'b1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (x !== 1'b1 || y !== 1'b1 || z !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (x !== 1'b0 || y !== 1'b1 || z !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (x !== 1'b0 || y !== 1'b0 || z !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule