`timescale 1ns/1ps

module tb_and1;

    // Inputs
    reg p;
    reg b;

    // Output
    wire bout;

    // Instantiate the Unit Under Test (UUT)
    and1 uut (
        .p(p),
        .b(b),
        .bout(bout)
    );

    initial begin
        // Test case 1: p = 0, b = 0
        p = 0; b = 0;
        #10;
        if (bout !== 0) begin
            $display("FAIL: Test case 1 failed, expected bout = 0, got bout = %b", bout);
            $finish;
        end

        // Test case 2: p = 0, b = 1
        p = 0; b = 1;
        #10;
        if (bout !== 0) begin
            $display("FAIL: Test case 2 failed, expected bout = 0, got bout = %b", bout);
            $finish;
        end

        // Test case 3: p = 1, b = 0
        p = 1; b = 0;
        #10;
        if (bout !== 0) begin
            $display("FAIL: Test case 3 failed, expected bout = 0, got bout = %b", bout);
            $finish;
        end

        // Test case 4: p = 1, b = 1
        p = 1; b = 1;
        #10;
        if (bout !== 1) begin
            $display("FAIL: Test case 4 failed, expected bout = 1, got bout = %b", bout);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule