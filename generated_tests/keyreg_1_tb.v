`timescale 1ns/1ps

module tb_keyreg;

reg clk;
reg reset;
reg [3:0] key;
reg shift;
wire [3:0] key_buffer_ms_hr;
wire [3:0] key_buffer_ls_hr;
wire [3:0] key_buffer_ms_min;
wire [3:0] key_buffer_ls_min;

// Instantiate the module under test (uut)
keyreg uut (
    .clk(clk),
    .reset(reset),
    .key(key),
    .shift(shift),
    .key_buffer_ms_hr(key_buffer_ms_hr),
    .key_buffer_ls_hr(key_buffer_ls_hr),
    .key_buffer_ms_min(key_buffer_ms_min),
    .key_buffer_ls_min(key_buffer_ls_min)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    shift = 0;
    key = 4'b0000;
    #10;

    // Release reset
    reset = 0;
    #10;

    // Test 1: Shift with key = 4'b1010
    key = 4'b1010;
    shift = 1;
    #10;
    shift = 0;
    #10;

    // Check outputs after first shift
    if (key_buffer_ls_min !== 4'b1010) begin
        $display("FAIL: key_buffer_ls_min should be 1010");
        $finish;
    end
    if (key_buffer_ms_min !== 4'b0000) begin
        $display("FAIL: key_buffer_ms_min should be 0000");
        $finish;
    end
    if (key_buffer_ls_hr !== 4'b0000) begin
        $display("FAIL: key_buffer_ls_hr should be 0000");
        $finish;
    end
    if (key_buffer_ms_hr !== 4'b0000) begin
        $display("FAIL: key_buffer_ms_hr should be 0000");
        $finish;
    end

    // Test 2: Shift again with key = 4'b1100
    key = 4'b1100;
    shift = 1;
    #10;
    shift = 0;
    #10;

    // Check outputs after second shift
    if (key_buffer_ls_min !== 4'b1100) begin
        $display("FAIL: key_buffer_ls_min should be 1100");
        $finish;
    end
    if (key_buffer_ms_min !== 4'b1010) begin
        $display("FAIL: key_buffer_ms_min should be 1010");
        $finish;
    end
    if (key_buffer_ls_hr !== 4'b0000) begin
        $display("FAIL: key_buffer_ls_hr should be 0000");
        $finish;
    end
    if (key_buffer_ms_hr !== 4'b0000) begin
        $display("FAIL: key_buffer_ms_hr should be 0000");
        $finish;
    end

    // Test 3: Shift again
    key = 4'b0011;
    shift = 1;
    #10;
    shift = 0;
    #10;

    // Check outputs after third shift
    if (key_buffer_ls_min !== 4'b0011) begin
        $display("FAIL: key_buffer_ls_min should be 0011");
        $finish;
    end
    if (key_buffer_ms_min !== 4'b1100) begin
        $display("FAIL: key_buffer_ms_min should be 1100");
        $finish;
    end
    if (key_buffer_ls_hr !== 4'b1010) begin
        $display("FAIL: key_buffer_ls_hr should be 1010");
        $finish;
    end
    if (key_buffer_ms_hr !== 4'b0000) begin
        $display("FAIL: key_buffer_ms_hr should be 0000");
        $finish;
    end

    // Test 4: Reset the registers
    reset = 1;
    #10;
    reset = 0;
    #10;

    // Check outputs after reset
    if (key_buffer_ls_min !== 4'b0000) begin
        $display("FAIL: key_buffer_ls_min should be 0000 after reset");
        $finish;
    end
    if (key_buffer_ms_min !== 4'b0000) begin
        $display("FAIL: key_buffer_ms_min should be 0000 after reset");
        $finish;
    end
    if (key_buffer_ls_hr !== 4'b0000) begin
        $display("FAIL: key_buffer_ls_hr should be 0000 after reset");
        $finish;
    end
    if (key_buffer_ms_hr !== 4'b0000) begin
        $display("FAIL: key_buffer_ms_hr should be 0000 after reset");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule