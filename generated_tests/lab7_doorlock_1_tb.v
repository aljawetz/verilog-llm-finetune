`timescale 1ns/1ps

module tb_lab7_doorlock;

reg i_clk;
reg i_rstn;
reg i_data;
reg i_start;
wire o_data;

// Instantiate the module under test
lab7_doorlock uut (
    .i_clk(i_clk),
    .i_rstn(i_rstn),
    .i_data(i_data),
    .i_start(i_start),
    .o_data(o_data)
);

// Clock generation
initial begin
    i_clk = 0;
    forever #5 i_clk = ~i_clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    i_rstn = 0;
    i_data = 0;
    i_start = 0;

    // Apply reset
    #10;
    i_rstn = 1; // Release reset

    // Test sequence 1: Valid key sequence
    i_start = 1; // Start the FSM
    #10;
    i_data = 1; // S0 -> S1
    #10;
    i_data = 0; // S1 -> S2
    #10;
    i_data = 1; // S2 -> S3
    #10;
    i_data = 1; // S3 -> S4
    #10;

    // Check output after valid sequence
    if (o_data !== 1'b1) begin
        $display("FAIL: Output should be 1 after valid sequence");
        $finish;
    end

    // Wait for the output to remain high for 100 clock cycles
    #1000; // 100 clock cycles

    // Check output after 100 cycles
    if (o_data !== 1'b0) begin
        $display("FAIL: Output should be 0 after 100 cycles");
        $finish;
    end

    // Test sequence 2: Invalid key sequence
    #10;
    i_data = 1; // S0 -> S1
    #10;
    i_data = 0; // S1 -> S2
    #10;
    i_data = 0; // S2 -> S0 (invalid sequence)
    #10;

    // Check output should be low
    if (o_data !== 1'b0) begin
        $display("FAIL: Output should be 0 after invalid sequence");
        $finish;
    end

    // Test sequence 3: Start signal
    #10;
    i_start = 0; // Stop the FSM
    #10;
    i_start = 1; // Restart the FSM
    #10;
    i_data = 1; // S0 -> S1
    #10;
    i_data = 1; // S1 -> S5
    #10;

    // Check output should be low
    if (o_data !== 1'b0) begin
        $display("FAIL: Output should be 0 after starting with invalid sequence");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule