`timescale 1ns/1ps

module tb_mux_2_1;

    // Inputs
    reg [1:0] I;
    reg S;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    mux_2_1 uut (
        .Y(Y),
        .I(I),
        .S(S)
    );

    initial begin
        // Test case 1: S = 0, I = 2'b00
        I = 2'b00; S = 0;
        #10;
        if (Y !== 1'b0) $display("FAIL: Test case 1 failed, expected Y=0, got Y=%b", Y);

        // Test case 2: S = 0, I = 2'b01
        I = 2'b01; S = 0;
        #10;
        if (Y !== 1'b1) $display("FAIL: Test case 2 failed, expected Y=1, got Y=%b", Y);

        // Test case 3: S = 1, I = 2'b10
        I = 2'b10; S = 1;
        #10;
        if (Y !== 1'b1) $display("FAIL: Test case 3 failed, expected Y=1, got Y=%b", Y);

        // Test case 4: S = 1, I = 2'b11
        I = 2'b11; S = 1;
        #10;
        if (Y !== 1'b1) $display("FAIL: Test case 4 failed, expected Y=1, got Y=%b", Y);

        // Test case 5: S = 0, I = 2'b10
        I = 2'b10; S = 0;
        #10;
        if (Y !== 1'b0) $display("FAIL: Test case 5 failed, expected Y=0, got Y=%b", Y);

        // Test case 6: S = 0, I = 2'b11
        I = 2'b11; S = 0;
        #10;
        if (Y !== 1'b1) $display("FAIL: Test case 6 failed, expected Y=1, got Y=%b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule