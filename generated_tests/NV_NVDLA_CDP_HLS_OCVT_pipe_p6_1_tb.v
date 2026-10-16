`timescale 1ns/1ps

module tb_NV_NVDLA_CDP_HLS_OCVT_pipe_p6;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg mul_out_pvld;
  reg sat_dout;
  reg [15:0] tru_dout;
  reg tru_out_prdy;
  wire mul_out_prdy;
  wire sat_data_out;
  wire [15:0] tru_data_out;
  wire tru_out_pvld;

  // Instantiate the module under test
  NV_NVDLA_CDP_HLS_OCVT_pipe_p6 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .mul_out_pvld(mul_out_pvld),
    .sat_dout(sat_dout),
    .tru_dout(tru_dout),
    .tru_out_prdy(tru_out_prdy),
    .mul_out_prdy(mul_out_prdy),
    .sat_data_out(sat_data_out),
    .tru_data_out(tru_data_out),
    .tru_out_pvld(tru_out_pvld)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    mul_out_pvld = 0;
    sat_dout = 0;
    tru_dout = 16'h0;
    tru_out_prdy = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Basic valid/ready handshake
    #10;
    mul_out_pvld = 1; // Assert valid
    sat_dout = 1;     // Set sat_dout
    tru_dout = 16'hABCD; // Set tru_dout
    tru_out_prdy = 1; // Ready to receive
    #10;

    // Check outputs
    if (mul_out_prdy !== 1) begin
      $display("FAIL: mul_out_prdy should be 1");
      $finish;
    end
    if (sat_data_out !== 1) begin
      $display("FAIL: sat_data_out should be 1");
      $finish;
    end
    if (tru_data_out !== 16'hABCD) begin
      $display("FAIL: tru_data_out should be 16'hABCD");
      $finish;
    end
    if (tru_out_pvld !== 1) begin
      $display("FAIL: tru_out_pvld should be 1");
      $finish;
    end

    // Test case 2: Valid not ready
    #10;
    mul_out_pvld = 1; // Assert valid
    tru_out_prdy = 0; // Not ready
    #10;

    // Check outputs
    if (mul_out_prdy !== 0) begin
      $display("FAIL: mul_out_prdy should be 0 when not ready");
      $finish;
    end

    // Test case 3: Reset behavior
    #10;
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Final check after reset
    if (mul_out_prdy !== 1) begin
      $display("FAIL: mul_out_prdy should be 1 after reset");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule