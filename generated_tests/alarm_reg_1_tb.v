`timescale 1ns/1ps

module tb_alarm_reg;

reg clk;
reg reset;
reg load_new_a;
reg [3:0] new_alarm_ms_hr;
reg [3:0] new_alarm_ls_hr;
reg [3:0] new_alarm_ms_min;
reg [3:0] new_alarm_ls_min;

wire [3:0] alarm_time_ms_hr;
wire [3:0] alarm_time_ls_hr;
wire [3:0] alarm_time_ms_min;
wire [3:0] alarm_time_ls_min;

alarm_reg uut (
    .clk(clk),
    .reset(reset),
    .load_new_a(load_new_a),
    .new_alarm_ms_hr(new_alarm_ms_hr),
    .new_alarm_ls_hr(new_alarm_ls_hr),
    .new_alarm_ms_min(new_alarm_ms_min),
    .new_alarm_ls_min(new_alarm_ls_min),
    .alarm_time_ms_hr(alarm_time_ms_hr),
    .alarm_time_ls_hr(alarm_time_ls_hr),
    .alarm_time_ms_min(alarm_time_ms_min),
    .alarm_time_ls_min(alarm_time_ls_min)
);

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    load_new_a = 0;
    new_alarm_ms_hr = 0;
    new_alarm_ls_hr = 0;
    new_alarm_ms_min = 0;
    new_alarm_ls_min = 0;

    // Apply reset
    reset = 1;
    #10;
    reset = 0;

    // Check initial state after reset
    if (alarm_time_ms_hr !== 4'b0000 || alarm_time_ls_hr !== 4'b0000 || 
        alarm_time_ms_min !== 4'b0000 || alarm_time_ls_min !== 4'b0000) begin
        $display("FAIL: Initial state after reset is incorrect");
        $finish;
    end

    // Load new alarm values
    new_alarm_ms_hr = 4'b1010; // 10
    new_alarm_ls_hr = 4'b0101; // 5
    new_alarm_ms_min = 4'b0011; // 3
    new_alarm_ls_min = 4'b0001; // 1
    load_new_a = 1;

    // Clock pulse
    #10;
    clk = 1;
    #10;
    clk = 0;
    load_new_a = 0;

    // Check updated values
    if (alarm_time_ms_hr !== 4'b1010 || alarm_time_ls_hr !== 4'b0101 || 
        alarm_time_ms_min !== 4'b0011 || alarm_time_ls_min !== 4'b0001) begin
        $display("FAIL: Updated values are incorrect");
        $finish;
    end

    // Reset again
    reset = 1;
    #10;
    reset = 0;

    // Check state after reset
    if (alarm_time_ms_hr !== 4'b0000 || alarm_time_ls_hr !== 4'b0000 || 
        alarm_time_ms_min !== 4'b0000 || alarm_time_ls_min !== 4'b0000) begin
        $display("FAIL: State after reset is incorrect");
        $finish;
    end

    // Load new values again
    new_alarm_ms_hr = 4'b1111; // 15
    new_alarm_ls_hr = 4'b0000; // 0
    new_alarm_ms_min = 4'b0110; // 6
    new_alarm_ls_min = 4'b1001; // 9
    load_new_a = 1;

    // Clock pulse
    #10;
    clk = 1;
    #10;
    clk = 0;
    load_new_a = 0;

    // Check updated values
    if (alarm_time_ms_hr !== 4'b1111 || alarm_time_ls_hr !== 4'b0000 || 
        alarm_time_ms_min !== 4'b0110 || alarm_time_ls_min !== 4'b1001) begin
        $display("FAIL: Updated values are incorrect after second load");
        $finish;
    end

    $display("PASS");
    $finish;
end

always begin
    #5 clk = ~clk; // Generate clock with a period of 10 time units
end

endmodule