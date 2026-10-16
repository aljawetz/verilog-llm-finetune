`timescale 1ns/1ps

module tb_jkff;

    reg clk;
    reg rst_n;
    reg j;
    reg k;
    wire q;

    // Instantiate the module under test (uut)
    jkff uut (
        .clk(clk),
        .rst_n(rst_n),
        .j(j),
        .k(k),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0; // Active low reset
        j = 0;
        k = 0;
        #10; // Wait for 10ns

        // Release reset
        rst_n = 1;
        #10;

        // Test case 1: J=0, K=0 (Q should remain unchanged)
        j = 0; k = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", q);
            $finish;
        end

        // Test case 2: J=0, K=1 (Q should reset to 0)
        j = 0; k = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", q);
            $finish;
        end

        // Test case 3: J=1, K=0 (Q should set to 1)
        j = 1; k = 0;
        #10;
        if (q !== 1) begin
            $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", q);
            $finish;
        end

        // Test case 4: J=1, K=1 (Q should toggle)
        j = 1; k = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", q);
            $finish;
        end
        #10;
        if (q !== 1) begin
            $display("FAIL: Test case 4 failed, expected Q=1, got Q=%b", q);
            $finish;
        end

        // Test case 5: J=0, K=0 (Q should remain unchanged)
        j = 0; k = 0;
        #10;
        if (q !== 1) begin
            $display("FAIL: Test case 5 failed, expected Q=1, got Q=%b", q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule