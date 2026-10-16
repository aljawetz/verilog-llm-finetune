`timescale 1ns/1ps

module tb_HLS_cdp_OCVT_pipe_p2;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [25:0] sub_dout;
  reg sub_in_pvld;
  reg sub_out_prdy;
  wire [25:0] sub_data_out;
  wire sub_in_prdy;
  wire sub_out_pvld;

  // Instantiate the Unit Under Test (UUT)
  HLS_cdp_OCVT_pipe_p2 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .sub_dout(sub_dout),
    .sub_in_pvld(sub_in_pvld),
    .sub_out_prdy(sub_out_prdy),
    .sub_data_out(sub_data_out),
    .sub_in_prdy(sub_in_prdy),
    .sub_out_pvld(sub_out_pvld)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    // Initialize signals
    nvdla_core_rstn = 0;
    sub_dout = 26'b0;
    sub_in_pvld = 0;
    sub_out_prdy = 1;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid input with ready output
    #10;
    sub_dout = 26'hA5A5A5; // Example data
    sub_in_pvld = 1; // Valid input
    #10;
    if (sub_in_prdy !== 1) begin
      $display("FAIL: sub_in_prdy should be 1 when valid input is present");
      $finish;
    end

    // Wait for output to be valid
    #10;
    if (sub_out_pvld !== 1) begin
      $display("FAIL: sub_out_pvld should be 1 after valid input is processed");
      $finish;
    end

    // Check output data
    #10;
    if (sub_data_out !== sub_dout) begin
      $display("FAIL: Output data does not match input data");
      $finish;
    end

    // Test case 2: Backpressure scenario
    #10;
    sub_out_prdy = 0; // Simulate backpressure
    #10;
    sub_in_pvld = 1; // Send another valid input
    #10;
    if (sub_in_prdy !== 0) begin
      $display("FAIL: sub_in_prdy should be 0 when backpressure is applied");
      $finish;
    end

    // Release backpressure
    #10;
    sub_out_prdy = 1; // Remove backpressure
    #10;
    if (sub_out_pvld !== 1) begin
      $display("FAIL: sub_out_pvld should be 1 after backpressure is released");
      $finish;
    end

    // Final check
    #10;
    if (sub_data_out !== sub_dout) begin
      $display("FAIL: Output data does not match input data after backpressure");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule