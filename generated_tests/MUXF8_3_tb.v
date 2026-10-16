`timescale 1ns/1ps

module tb_MUXF8;

    // Inputs
    reg I0;
    reg I1;
    reg S;

    // Output
    wire O;

    // Instantiate the Unit Under Test (UUT)
    MUXF8 uut (
        .O(O),
        .I0(I0),
        .I1(I1),
        .S(S)
    );

    initial begin
        // Initialize Inputs
        I0 = 0;
        I1 = 0;
        S = 0;

        // Test case 1: S = 0, expect O = I0
        I0 = 1; I1 = 0; S = 0;
        #10;
        if (O !== I0) begin
            $display("FAIL: Test case 1 failed, expected O = %b, got O = %b", I0, O);
            $finish;
        end

        // Test case 2: S = 1, expect O = I1
        I0 = 0; I1 = 1; S = 1;
        #10;
        if (O !== I1) begin
            $display("FAIL: Test case 2 failed, expected O = %b, got O = %b", I1, O);
            $finish;
        end

        // Test case 3: S = 0, expect O = I0
        I0 = 0; I1 = 1; S = 0;
        #10;
        if (O !== I0) begin
            $display("FAIL: Test case 3 failed, expected O = %b, got O = %b", I0, O);
            $finish;
        end

        // Test case 4: S = 1, expect O = I1
        I0 = 1; I1 = 0; S = 1;
        #10;
        if (O !== I1) begin
            $display("FAIL: Test case 4 failed, expected O = %b, got O = %b", I1, O);
            $finish;
        end

        // Test case 5: S = 0, expect O = I0
        I0 = 1; I1 = 1; S = 0;
        #10;
        if (O !== I0) begin
            $display("FAIL: Test case 5 failed, expected O = %b, got O = %b", I0, O);
            $finish;
        end

        // Test case 6: S = 1, expect O = I1
        I0 = 0; I1 = 1; S = 1;
        #10;
        if (O !== I1) begin
            $display("FAIL: Test case 6 failed, expected O = %b, got O = %b", I1, O);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule