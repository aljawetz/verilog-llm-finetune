`timescale 1ns/1ps

module tb_counter;

reg clk;
reg reset;
reg one_minute;
reg load_new_c;
reg [3:0] new_current_time_ms_hr;
reg [3:0] new_current_time_ms_min;
reg [3:0] new_current_time_ls_hr;
reg [3:0] new_current_time_ls_min;

wire [3:0] current_time_ms_hr;
wire [3:0] current_time_ms_min;
wire [3:0] current_time_ls_hr;
wire [3:0] current_time_ls_min;

counter uut (
    .clk(clk),
    .reset(reset),
    .one_minute(one_minute),
    .load_new_c(load_new_c),
    .new_current_time_ms_hr(new_current_time_ms_hr),
    .new_current_time_ms_min(new_current_time_ms_min),
    .new_current_time_ls_hr(new_current_time_ls_hr),
    .new_current_time_ls_min(new_current_time_ls_min),
    .current_time_ms_hr(current_time_ms_hr),
    .current_time_ms_min(current_time_ms_min),
    .current_time_ls_hr(current_time_ls_hr),
    .current_time_ls_min(current_time_ls_min)
);

initial begin
    clk = 0;
    reset = 1;
    one_minute = 0;
    load_new_c = 0;
    new_current_time_ms_hr = 0;
    new_current_time_ms_min = 0;
    new_current_time_ls_hr = 0;
    new_current_time_ls_min = 0;

    #10 reset = 0; // Release reset
    #10;

    // Test case 1: Load new time
    load_new_c = 1;
    new_current_time_ms_hr = 4'd1;
    new_current_time_ms_min = 4'd2;
    new_current_time_ls_hr = 4'd3;
    new_current_time_ls_min = 4'd4;
    #10 load_new_c = 0;

    // Check loaded values
    if (current_time_ms_hr !== 4'd1 || current_time_ms_min !== 4'd2 || 
        current_time_ls_hr !== 4'd3 || current_time_ls_min !== 4'd4) begin
        $display("FAIL: Loaded values are incorrect");
        $finish;
    end

    // Test case 2: Increment time
    one_minute = 1; #10 one_minute = 0; // Simulate one minute pulse
    if (current_time_ms_hr !== 4'd1 || current_time_ms_min !== 4'd2 || 
        current_time_ls_hr !== 4'd3 || current_time_ls_min !== 4'd5) begin
        $display("FAIL: Time increment failed");
        $finish;
    end

    // Test case 3: Rollover logic
    new_current_time_ms_hr = 4'd2;
    new_current_time_ms_min = 4'd5;
    new_current_time_ls_hr = 4'd3;
    new_current_time_ls_min = 4'd9;
    load_new_c = 1; #10 load_new_c = 0;

    // Check loaded values
    if (current_time_ms_hr !== 4'd2 || current_time_ms_min !== 4'd5 || 
        current_time_ls_hr !== 4'd3 || current_time_ls_min !== 4'd9) begin
        $display("FAIL: Loaded values for rollover are incorrect");
        $finish;
    end

    // Simulate rollover
    one_minute = 1; #10 one_minute = 0; // Simulate one minute pulse
    if (current_time_ms_hr !== 4'd0 || current_time_ms_min !== 4'd0 || 
        current_time_ls_hr !== 4'd0 || current_time_ls_min !== 4'd0) begin
        $display("FAIL: Rollover failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule