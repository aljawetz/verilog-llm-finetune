`timescale 1ns/1ps

module tb_Behavior_Modelling_Case;

    // Inputs
    reg x1;
    reg x2;
    reg s;

    // Outputs
    wire f;

    // Instantiate the Unit Under Test (UUT)
    Behavior_Modelling_Case uut (
        .x1(x1), 
        .x2(x2), 
        .s(s), 
        .f(f)
    );

    initial begin
        // Initialize Inputs
        x1 = 0;
        x2 = 0;
        s = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: s = 0, expect f = x1
        x1 = 1; x2 = 0; s = 0; #10;
        if (f !== x1) begin
            $display("FAIL: Test case 1 failed, expected f = %b, got f = %b", x1, f);
            $finish;
        end

        // Test case 2: s = 1, expect f = x2
        x1 = 0; x2 = 1; s = 1; #10;
        if (f !== x2) begin
            $display("FAIL: Test case 2 failed, expected f = %b, got f = %b", x2, f);
            $finish;
        end

        // Test case 3: s = 0, expect f = x1
        x1 = 1; x2 = 1; s = 0; #10;
        if (f !== x1) begin
            $display("FAIL: Test case 3 failed, expected f = %b, got f = %b", x1, f);
            $finish;
        end

        // Test case 4: s = 1, expect f = x2
        x1 = 0; x2 = 0; s = 1; #10;
        if (f !== x2) begin
            $display("FAIL: Test case 4 failed, expected f = %b, got f = %b", x2, f);
            $finish;
        end

        // Test case 5: s = 0, expect f = x1
        x1 = 1; x2 = 0; s = 0; #10;
        if (f !== x1) begin
            $display("FAIL: Test case 5 failed, expected f = %b, got f = %b", x1, f);
            $finish;
        end

        // Test case 6: s = 1, expect f = x2
        x1 = 0; x2 = 1; s = 1; #10;
        if (f !== x2) begin
            $display("FAIL: Test case 6 failed, expected f = %b, got f = %b", x2, f);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule