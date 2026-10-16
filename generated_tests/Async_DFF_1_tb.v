`timescale 1ns/1ps

module tb_Async_DFF;

reg clk;
reg D;
reg reset_n;
reg clear_n;
wire Q;

// Instantiate the module under test
Async_DFF uut (
    .clk(clk),
    .D(D),
    .reset_n(reset_n),
    .clear_n(clear_n),
    .Q(Q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    D = 0;
    reset_n = 0;
    clear_n = 1;

    // Apply reset
    #10;
    reset_n = 1; // Release reset

    // Test case 1: Check output after setting D
    D = 1; 
    #10;
    if (Q !== 1) begin
        $display("FAIL: Expected Q=1, got Q=%b", Q);
        $finish;
    end

    // Test case 2: Check output after clearing
    clear_n = 0; 
    #10;
    if (Q !== 1) begin
        $display("FAIL: Expected Q=1 after clear_n=0, got Q=%b", Q);
        $finish;
    end

    // Test case 3: Check output after clearing is released
    clear_n = 1; 
    #10;
    if (Q !== 1) begin
        $display("FAIL: Expected Q=1 after clear_n=1, got Q=%b", Q);
        $finish;
    end

    // Test case 4: Change D and check output
    D = 0; 
    #10;
    if (Q !== 0) begin
        $display("FAIL: Expected Q=0, got Q=%b", Q);
        $finish;
    end

    // Test case 5: Check reset functionality
    reset_n = 0; 
    #10;
    if (Q !== 0) begin
        $display("FAIL: Expected Q=0 after reset_n=0, got Q=%b", Q);
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule