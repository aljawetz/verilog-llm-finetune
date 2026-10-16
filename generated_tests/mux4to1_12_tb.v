`timescale 1ns/1ps

module tb_mux4to1;

    // Inputs
    reg I0;
    reg I1;
    reg I2;
    reg I3;
    reg S0;
    reg S1;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    mux4to1 uut (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .S0(S0),
        .S1(S1),
        .Y(Y)
    );

    initial begin
        // Initialize inputs
        I0 = 0; I1 = 0; I2 = 0; I3 = 0; S0 = 0; S1 = 0;

        // Test case 1: Select I0
        I0 = 1; I1 = 0; I2 = 0; I3 = 0; S0 = 0; S1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed, expected Y=1, got Y=%b", Y);

        // Test case 2: Select I1
        I0 = 0; I1 = 1; I2 = 0; I3 = 0; S0 = 1; S1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 2 failed, expected Y=1, got Y=%b", Y);

        // Test case 3: Select I2
        I0 = 0; I1 = 0; I2 = 1; I3 = 0; S0 = 0; S1 = 1;
        #10;
        if (Y !== 1) $display("FAIL: Test case 3 failed, expected Y=1, got Y=%b", Y);

        // Test case 4: Select I3
        I0 = 0; I1 = 0; I2 = 0; I3 = 1; S0 = 1; S1 = 1;
        #10;
        if (Y !== 1) $display("FAIL: Test case 4 failed, expected Y=1, got Y=%b", Y);

        // Test case 5: All inputs low
        I0 = 0; I1 = 0; I2 = 0; I3 = 0; S0 = 0; S1 = 0;
        #10;
        if (Y !== 0) $display("FAIL: Test case 5 failed, expected Y=0, got Y=%b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule