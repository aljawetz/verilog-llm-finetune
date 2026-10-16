`timescale 1ns/1ps

module tb_JK_flipflop;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the JK_flipflop module
    JK_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test case 1: Hold state (j=0, k=0)
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test case 2: Reset to 0 (j=0, k=1)
        j = 0; k = 1;
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test case 3: Set to 1 (j=1, k=0)
        j = 1; k = 0;
        #10; // Wait for clock
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 4: Toggle (j=1, k=1)
        j = 1; k = 1;
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        #10; // Wait for clock
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 5: Reset again
        reset = 1;
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule