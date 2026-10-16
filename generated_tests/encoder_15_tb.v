`timescale 1ns/1ps

module tb_encoder;

    // Inputs
    reg Y0;
    reg Y1;
    reg Y2;
    reg Y3;

    // Outputs
    wire A0;
    wire A1;

    // Instantiate the Unit Under Test (UUT)
    encoder uut (
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .A0(A0),
        .A1(A1)
    );

    initial begin
        // Initialize inputs
        Y0 = 0; Y1 = 0; Y2 = 0; Y3 = 0;

        // Test case 1: Y1 = 1, Y3 = 0
        Y1 = 1; Y3 = 0;
        #10;
        if (A0 !== 1'b1 || A1 !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: Y2 = 1, Y3 = 0
        Y1 = 0; Y2 = 1; Y3 = 0;
        #10;
        if (A0 !== 1'b0 || A1 !== 1'b1) $display("FAIL: Test case 2 failed");

        // Test case 3: Y3 = 1
        Y1 = 0; Y2 = 0; Y3 = 1;
        #10;
        if (A0 !== 1'b1 || A1 !== 1'b1) $display("FAIL: Test case 3 failed");

        // Test case 4: All inputs low
        Y0 = 0; Y1 = 0; Y2 = 0; Y3 = 0;
        #10;
        if (A0 !== 1'b0 || A1 !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: Y0 = 1, should not affect outputs
        Y0 = 1; Y1 = 0; Y2 = 0; Y3 = 0;
        #10;
        if (A0 !== 1'b0 || A1 !== 1'b0) $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule