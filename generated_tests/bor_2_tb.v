`timescale 1ns/1ps

module tb_bor;

    // Inputs
    reg a;
    reg b;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    bor uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test case 1: Both inputs low
        a = 0; b = 0;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);
            $finish;
        end

        // Test case 2: Input a high
        a = 1; b = 0;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 3: Input b high
        a = 0; b = 1;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 4: Both inputs high
        a = 1; b = 1;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 5: Both inputs low again
        a = 0; b = 0;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule