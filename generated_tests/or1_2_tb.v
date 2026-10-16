`timescale 1ns/1ps

module tb_or1;

    // Inputs
    reg a;
    reg b;
    reg c;

    // Outputs
    wire d;

    // Instantiate the Unit Under Test (UUT)
    or1 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        // Test case 1: All inputs low
        a = 0; b = 0; c = 0;
        #10;
        if (d !== 0) begin
            $display("FAIL: Test case 1 failed, expected d=0, got d=%b", d);
            $finish;
        end

        // Test case 2: One input high
        a = 1; b = 0; c = 0;
        #10;
        if (d !== 1) begin
            $display("FAIL: Test case 2 failed, expected d=1, got d=%b", d);
            $finish;
        end

        // Test case 3: Two inputs high
        a = 1; b = 1; c = 0;
        #10;
        if (d !== 1) begin
            $display("FAIL: Test case 3 failed, expected d=1, got d=%b", d);
            $finish;
        end

        // Test case 4: All inputs high
        a = 1; b = 1; c = 1;
        #10;
        if (d !== 1) begin
            $display("FAIL: Test case 4 failed, expected d=1, got d=%b", d);
            $finish;
        end

        // Test case 5: Two inputs high, one low
        a = 0; b = 1; c = 1;
        #10;
        if (d !== 1) begin
            $display("FAIL: Test case 5 failed, expected d=1, got d=%b", d);
            $finish;
        end

        // Test case 6: Another combination
        a = 0; b = 0; c = 1;
        #10;
        if (d !== 1) begin
            $display("FAIL: Test case 6 failed, expected d=1, got d=%b", d);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule