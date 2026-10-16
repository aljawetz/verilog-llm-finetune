`timescale 1ns/1ps

module tb_dff_const3;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
dff_const3 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;

    // Apply reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial conditions after reset
    if (q !== 1'b1) begin
        $display("FAIL: Initial q is not 1 after reset");
        $finish;
    end

    // Wait for one clock cycle
    #10;

    // Check q after first clock edge
    if (q !== 1'b0) begin
        $display("FAIL: q is not 0 after first clock edge");
        $finish;
    end

    // Wait for second clock cycle
    #10;

    // Check q after second clock edge
    if (q !== 1'b1) begin
        $display("FAIL: q is not 1 after second clock edge");
        $finish;
    end

    // Wait for third clock cycle
    #10;

    // Check q after third clock edge
    if (q !== 1'b1) begin
        $display("FAIL: q is not 1 after third clock edge");
        $finish;
    end

    // Wait for fourth clock cycle
    #10;

    // Check q after fourth clock edge
    if (q !== 1'b1) begin
        $display("FAIL: q is not 1 after fourth clock edge");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule