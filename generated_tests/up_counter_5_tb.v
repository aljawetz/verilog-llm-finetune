`timescale 1ns/1ps

module tb_up_counter;

// Inputs
reg clk;
reg reset;

// Outputs
wire [3:0] counter;

// Instantiate the Unit Under Test (UUT)
up_counter uut (
    .clk(clk),
    .reset(reset),
    .counter(counter)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize Inputs
    clk = 0;
    reset = 0;

    // Wait for global reset to finish
    #10;
    
    // Test 1: Reset the counter
    reset = 1;
    #10;
    reset = 0;
    
    // Check if counter is reset to 0
    if (counter !== 4'd0) begin
        $display("FAIL: Counter did not reset to 0");
        $finish;
    end

    // Test 2: Count up from 0 to 5
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd1) begin
        $display("FAIL: Counter did not count to 1");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd2) begin
        $display("FAIL: Counter did not count to 2");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd3) begin
        $display("FAIL: Counter did not count to 3");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd4) begin
        $display("FAIL: Counter did not count to 4");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd5) begin
        $display("FAIL: Counter did not count to 5");
        $finish;
    end

    // Test 3: Assert reset again
    reset = 1;
    #10;
    reset = 0;

    // Check if counter is reset to 0
    if (counter !== 4'd0) begin
        $display("FAIL: Counter did not reset to 0 after second reset");
        $finish;
    end

    // Test 4: Count up to 10
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd1) begin
        $display("FAIL: Counter did not count to 1 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd2) begin
        $display("FAIL: Counter did not count to 2 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd3) begin
        $display("FAIL: Counter did not count to 3 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd4) begin
        $display("FAIL: Counter did not count to 4 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd5) begin
        $display("FAIL: Counter did not count to 5 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd6) begin
        $display("FAIL: Counter did not count to 6 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd7) begin
        $display("FAIL: Counter did not count to 7 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd8) begin
        $display("FAIL: Counter did not count to 8 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd9) begin
        $display("FAIL: Counter did not count to 9 after reset");
        $finish;
    end
    
    #10; // Wait for 1 clock cycle
    if (counter !== 4'd10) begin
        $display("FAIL: Counter did not count to 10 after reset");
        $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
end

endmodule