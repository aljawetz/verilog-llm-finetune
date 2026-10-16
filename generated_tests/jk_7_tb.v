`timescale 1ns/1ps

module tb_jk;

reg j, k, clk, rst;
wire q;

// Instantiate the JK flip-flop
jk uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize inputs
    j = 0; k = 0; rst = 1; // Reset state
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test case 1: J=0, K=0 (Q should remain unchanged)
    #10;
    j = 0; k = 0;
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected Q=0, got Q=%b", q);
        $finish;
    end

    // Test case 2: J=0, K=1 (Q should reset to 0)
    #10;
    j = 0; k = 1;
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected Q=0, got Q=%b", q);
        $finish;
    end

    // Test case 3: J=1, K=0 (Q should set to 1)
    #10;
    j = 1; k = 0;
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected Q=1, got Q=%b", q);
        $finish;
    end

    // Test case 4: J=0, K=1 (Q should reset to 0)
    #10;
    j = 0; k = 1;
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected Q=0, got Q=%b", q);
        $finish;
    end

    // Test case 5: J=1, K=1 (Q should toggle)
    #10;
    j = 1; k = 1;
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected Q=1, got Q=%b", q);
        $finish;
    end

    #10; // Wait for the next clock edge
    if (q !== 0) begin
        $display("FAIL: Expected Q=0 after toggle, got Q=%b", q);
        $finish;
    end

    // Test case 6: Asynchronous reset
    #10;
    rst = 1; // Assert reset
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected Q=0 after reset, got Q=%b", q);
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule