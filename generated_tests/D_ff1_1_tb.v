`timescale 1ns/1ps

module tb_D_ff1;

reg clk;
reg rst;
reg D;
wire q;
wire qbar;

// Instantiate the D_ff1 module
D_ff1 uut (
    .D(D),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1; D = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    if (q !== 0 || qbar !== 0) begin
        $display("FAIL: Reset did not set outputs to zero");
        $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test D input functionality
    D = 1; 
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: D input did not set outputs correctly");
        $finish;
    end

    D = 0; 
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: D input did not set outputs correctly");
        $finish;
    end

    // Test reset functionality again
    rst = 1; 
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 0) begin
        $display("FAIL: Reset did not set outputs to zero");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule