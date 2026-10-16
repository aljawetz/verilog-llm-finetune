`timescale 1ns/1ps

module tb_D_FF_PEC;

reg D;
reg clk;
wire Q;

// Instantiate the module under test
D_FF_PEC uut (
    .D(D),
    .clk(clk),
    .Q(Q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize D
    D = 0;

    // Wait for the first clock edge
    #10;
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after first clock edge");
        $finish;
    end

    // Set D to 1 and wait for the next clock edge
    D = 1;
    #10;
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 after second clock edge");
        $finish;
    end

    // Set D to 0 and wait for the next clock edge
    D = 0;
    #10;
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after third clock edge");
        $finish;
    end

    // Set D to 1 again and wait for the next clock edge
    D = 1;
    #10;
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 after fourth clock edge");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule