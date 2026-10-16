`timescale 1ns/1ps

module tb_JK_flipflop;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the JK flip-flop
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
        // Initialize inputs
        j = 0; k = 0; reset = 1; // Start with reset
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test hold state (J=0, K=0)
        j = 0; k = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test clear state (J=0, K=1)
        j = 0; k = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test set state (J=1, K=0)
        j = 1; k = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test toggle state (J=1, K=1)
        j = 1; k = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        #10; // Wait for next clock edge
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test reset functionality
        reset = 1; // Assert reset
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule