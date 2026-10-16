`timescale 1ns/1ps

module tb_HS;
    reg x;
    reg y;
    wire d;
    wire b;

    // Instantiate the Half Subtractor
    HS uut (
        .x(x),
        .y(y),
        .d(d),
        .b(b)
    );

    initial begin
        // Test case 1: x = 0, y = 0
        x = 0; y = 0;
        #10;
        if (d !== 0 || b !== 0) begin
            $display("FAIL: Test case 1 failed (x=0, y=0)");
            $finish;
        end

        // Test case 2: x = 0, y = 1
        x = 0; y = 1;
        #10;
        if (d !== 1 || b !== 1) begin
            $display("FAIL: Test case 2 failed (x=0, y=1)");
            $finish;
        end

        // Test case 3: x = 1, y = 0
        x = 1; y = 0;
        #10;
        if (d !== 1 || b !== 0) begin
            $display("FAIL: Test case 3 failed (x=1, y=0)");
            $finish;
        end

        // Test case 4: x = 1, y = 1
        x = 1; y = 1;
        #10;
        if (d !== 0 || b !== 0) begin
            $display("FAIL: Test case 4 failed (x=1, y=1)");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule