`timescale 1ns/1ps

module tb_linear_regression_prediction;

    reg i_clock;
    reg i_reset;
    reg [31:0] i_samples_x_in;
    reg i_samples_x_vld;
    reg [31:0] i_theta0_out;
    reg [31:0] i_theta1_out;
    reg i_theta1_out_vld;
    wire o_predict_out_vld;
    wire [31:0] o_predict_out;

    // Instantiate the module under test (uut)
    linear_regression_prediction uut (
        .i_clock(i_clock),
        .i_reset(i_reset),
        .i_samples_x_in(i_samples_x_in),
        .i_samples_x_vld(i_samples_x_vld),
        .i_theta0_out(i_theta0_out),
        .i_theta1_out(i_theta1_out),
        .i_theta1_out_vld(i_theta1_out_vld),
        .o_predict_out_vld(o_predict_out_vld),
        .o_predict_out(o_predict_out)
    );

    // Clock generation
    initial begin
        i_clock = 0;
        forever #5 i_clock = ~i_clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        i_reset = 1;
        i_samples_x_in = 32'd0;
        i_samples_x_vld = 1'b0;
        i_theta0_out = 32'd0;
        i_theta1_out = 32'd0;
        i_theta1_out_vld = 1'b0;

        // Apply reset
        #10;
        i_reset = 0; // Assert reset
        #10;
        i_reset = 1; // Deassert reset

        // Test case 1: Valid inputs
        i_samples_x_in = 32'd5; // Sample input
        i_samples_x_vld = 1'b1; // Valid sample
        i_theta0_out = 32'd2; // Theta0
        i_theta1_out = 32'd3; // Theta1
        i_theta1_out_vld = 1'b1; // Valid theta1

        #10; // Wait for a clock cycle

        // Check output
        if (o_predict_out_vld !== 1'b1) begin
            $display("FAIL: Output valid signal not asserted");
            $finish;
        end
        if (o_predict_out !== (5 * 3 + 2)) begin
            $display("FAIL: Incorrect prediction output");
            $finish;
        end

        // Test case 2: Invalid sample valid
        i_samples_x_vld = 1'b0; // Invalid sample
        #10; // Wait for a clock cycle

        if (o_predict_out_vld !== 1'b0) begin
            $display("FAIL: Output valid signal should not be asserted");
            $finish;
        end

        // Test case 3: Invalid theta1 valid
        i_samples_x_vld = 1'b1; // Valid sample
        i_theta1_out_vld = 1'b0; // Invalid theta1
        #10; // Wait for a clock cycle

        if (o_predict_out_vld !== 1'b0) begin
            $display("FAIL: Output valid signal should not be asserted");
            $finish;
        end

        // Test case 4: Reset functionality
        i_reset = 0; // Assert reset
        #10;
        i_reset = 1; // Deassert reset

        // Check outputs after reset
        if (o_predict_out_vld !== 1'b0) begin
            $display("FAIL: Output valid signal should be low after reset");
            $finish;
        end
        if (o_predict_out !== 32'd0) begin
            $display("FAIL: Output should be zero after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule