`timescale 1ns/1ps

module tb_dff_const4;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
dff_const4 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;
    
    // Check initial state after reset
    if (q !== 1'b1) begin
        $display("FAIL: Initial state after reset is not 1");
        $finish;
    end
    
    // Apply clock cycles and check output
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after first clock cycle");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after second clock cycle");
        $finish;
    end
    
    // Assert reset again
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;
    
    // Check state after reset again
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after reset again");
        $finish;
    end
    
    // Final clock cycles
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after third clock cycle");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after fourth clock cycle");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule