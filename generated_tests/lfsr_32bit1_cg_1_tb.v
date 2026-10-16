`timescale 1ns/1ps

module tb_lfsr_32bit1_cg;

reg clk;
reg rst;
wire [31:0] out1;

// Instantiate the module under test
lfsr_32bit1_cg uut (
    .clk(clk),
    .rst(rst),
    .out1(out1)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Reset the LFSR
    rst = 1;
    #10; // Hold reset for 10ns
    rst = 0;
    
    // Check initial value after reset
    if (out1 !== 32'h6E8DABC5) begin
        $display("FAIL: Initial value after reset is incorrect");
        $finish;
    end

    // Run the LFSR for a few clock cycles and check values
    #10; // Wait for 1 clock cycle
    if (out1 === 32'h6E8DABC5) begin
        $display("FAIL: LFSR did not shift after 1 clock cycle");
        $finish;
    end

    // Run for more cycles and check for expected behavior
    repeat (10) begin
        #10; // Wait for 1 clock cycle
        // Check if the output is changing (not a simple check, just a placeholder)
        if (out1 === 32'h6E8DABC5) begin
            $display("FAIL: LFSR output is stuck at initial value");
            $finish;
        end
    end

    // Final check to ensure the output is not the same as the initial value
    if (out1 === 32'h6E8DABC5) begin
        $display("FAIL: LFSR output is stuck at initial value after multiple shifts");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule