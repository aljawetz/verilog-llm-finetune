`timescale 1ns/1ps

module tb_mux4to1;

    reg [3:0] i;
    reg [1:0] s;
    wire out;

    // Instantiate the module under test (uut)
    mux4to1 uut (
        .i(i),
        .s(s),
        .out(out)
    );

    initial begin
        // Test case 1: Select input 0
        i = 4'b1010; // Inputs: 10
        s = 2'b00;   // Select input 0
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 1 failed, expected out=1, got out=%b", out);

        // Test case 2: Select input 1
        s = 2'b01;   // Select input 1
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 2 failed, expected out=0, got out=%b", out);

        // Test case 3: Select input 2
        s = 2'b10;   // Select input 2
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 3 failed, expected out=1, got out=%b", out);

        // Test case 4: Select input 3
        s = 2'b11;   // Select input 3
        #10;
        if (out !== 1'b0) $display("FAIL: Test case 4 failed, expected out=0, got out=%b", out);

        // Test case 5: Check default high-impedance state
        s = 2'bxx;   // Invalid select
        #10;
        if (out !== 1'bz) $display("FAIL: Test case 5 failed, expected out=z, got out=%b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule