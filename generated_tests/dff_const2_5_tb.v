`timescale 1ns/1ps

module tb_dff_const2;

reg clk;
reg reset;
wire q;

// Instantiate the module under test (uut)
dff_const2 uut (
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
    
    // Check output after reset
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not high after reset");
        $finish;
    end

    // Check output on clock edge
    #10; // Wait for next clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not high after clock edge");
        $finish;
    end

    // Further clock edges
    #10; // Wait for next clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not high after clock edge");
        $finish;
    end

    // Final check
    #10; // Wait for next clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not high after clock edge");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule