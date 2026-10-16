`timescale 1ns/1ps

module tb_fibGen;

reg clk;
reg rst;
wire [31:0] sequence;

// Instantiate the module under test
fibGen uut (
    .clk(clk),
    .rst(rst),
    .sequence(sequence)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;
    
    // Wait for the first few Fibonacci numbers
    #10; // Wait for 1 clock cycle
    if (sequence !== 1) begin
        $display("FAIL: Expected sequence = 1, got %d", sequence);
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (sequence !== 1) begin
        $display("FAIL: Expected sequence = 1, got %d", sequence);
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (sequence !== 2) begin
        $display("FAIL: Expected sequence = 2, got %d", sequence);
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (sequence !== 3) begin
        $display("FAIL: Expected sequence = 3, got %d", sequence);
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (sequence !== 5) begin
        $display("FAIL: Expected sequence = 5, got %d", sequence);
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (sequence !== 8) begin
        $display("FAIL: Expected sequence = 8, got %d", sequence);
        $finish;
    end
    
    // Reset the module
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;
    
    // Check the sequence after reset
    #10; // Wait for 1 clock cycle
    if (sequence !== 1) begin
        $display("FAIL: Expected sequence = 1 after reset, got %d", sequence);
        $finish;
    end
    
    // Continue checking the Fibonacci sequence
    #10; // Wait for 1 clock cycle
    if (sequence !== 1) begin
        $display("FAIL: Expected sequence = 1, got %d", sequence);
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (sequence !== 2) begin
        $display("FAIL: Expected sequence = 2, got %d", sequence);
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (sequence !== 3) begin
        $display("FAIL: Expected sequence = 3, got %d", sequence);
        $finish;
    end
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule