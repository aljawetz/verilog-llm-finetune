`timescale 1ns/1ps

module tb_half_sub_structural;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire Do;
    wire Bo;

    // Instantiate the Unit Under Test (UUT)
    half_sub_structural uut (
        .a(a),
        .b(b),
        .Do(Do),
        .Bo(Bo)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (Do !== 0 || Bo !== 0) begin
            $display("FAIL: Test case 1 failed (a=0, b=0)");
            $finish;
        end

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (Do !== 1 || Bo !== 1) begin
            $display("FAIL: Test case 2 failed (a=0, b=1)");
            $finish;
        end

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (Do !== 1 || Bo !== 0) begin
            $display("FAIL: Test case 3 failed (a=1, b=0)");
            $finish;
        end

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (Do !== 0 || Bo !== 0) begin
            $display("FAIL: Test case 4 failed (a=1, b=1)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule