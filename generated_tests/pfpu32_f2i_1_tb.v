`timescale 1ns/1ps

module tb_pfpu32_f2i;

  // Parameters
  reg clk;
  reg rst;
  reg flush_i;
  reg adv_i;
  reg start_i;
  reg signa_i;
  reg [9:0] exp10a_i;
  reg [23:0] fract24a_i;
  reg snan_i;
  reg qnan_i;
  
  wire f2i_rdy_o;
  wire f2i_sign_o;
  wire [23:0] f2i_int24_o;
  wire [4:0] f2i_shr_o;
  wire [3:0] f2i_shl_o;
  wire f2i_ovf_o;
  wire f2i_snan_o;

  // Instantiate the Unit Under Test (UUT)
  pfpu32_f2i uut (
    .clk(clk),
    .rst(rst),
    .flush_i(flush_i),
    .adv_i(adv_i),
    .start_i(start_i),
    .signa_i(signa_i),
    .exp10a_i(exp10a_i),
    .fract24a_i(fract24a_i),
    .snan_i(snan_i),
    .qnan_i(qnan_i),
    .f2i_rdy_o(f2i_rdy_o),
    .f2i_sign_o(f2i_sign_o),
    .f2i_int24_o(f2i_int24_o),
    .f2i_shr_o(f2i_shr_o),
    .f2i_shl_o(f2i_shl_o),
    .f2i_ovf_o(f2i_ovf_o),
    .f2i_snan_o(f2i_snan_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    flush_i = 0;
    adv_i = 0;
    start_i = 0;
    signa_i = 0;
    exp10a_i = 10'd0;
    fract24a_i = 24'd0;
    snan_i = 0;
    qnan_i = 0;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: Normal conversion
    start_i = 1;
    exp10a_i = 10'd150; // exponent
    fract24a_i = 24'd8388608; // 1.0 in mantissa
    snan_i = 0;
    qnan_i = 0;
    adv_i = 1; // advance the pipeline
    #10;
    adv_i = 0; // stop advancing

    // Check outputs
    #10;
    if (f2i_rdy_o !== 1'b1) begin
      $display("FAIL: f2i_rdy_o should be 1 when conversion starts");
      $finish;
    end
    if (f2i_sign_o !== 1'b0) begin
      $display("FAIL: f2i_sign_o should be 0 for positive input");
      $finish;
    end
    if (f2i_int24_o !== 24'd8388608) begin
      $display("FAIL: f2i_int24_o should be 8388608");
      $finish;
    end
    if (f2i_shr_o !== 5'd0) begin
      $display("FAIL: f2i_shr_o should be 0");
      $finish;
    end
    if (f2i_shl_o !== 4'd0) begin
      $display("FAIL: f2i_shl_o should be 0");
      $finish;
    end
    if (f2i_ovf_o !== 1'b0) begin
      $display("FAIL: f2i_ovf_o should be 0");
      $finish;
    end
    if (f2i_snan_o !== 1'b0) begin
      $display("FAIL: f2i_snan_o should be 0");
      $finish;
    end

    // Test case 2: Signaling NaN
    start_i = 1;
    exp10a_i = 10'd150;
    fract24a_i = 24'd0; // NaN
    snan_i = 1;
    qnan_i = 0;
    adv_i = 1; // advance the pipeline
    #10;
    adv_i = 0; // stop advancing

    // Check outputs
    #10;
    if (f2i_rdy_o !== 1'b1) begin
      $display("FAIL: f2i_rdy_o should be 1 when conversion starts");
      $finish;
    end
    if (f2i_sign_o !== 1'b0) begin
      $display("FAIL: f2i_sign_o should be 0 for NaN input");
      $finish;
    end
    if (f2i_int24_o !== 24'd0) begin
      $display("FAIL: f2i_int24_o should be 0 for NaN");
      $finish;
    end
    if (f2i_shr_o !== 5'd0) begin
      $display("FAIL: f2i_shr_o should be 0 for NaN");
      $finish;
    end
    if (f2i_shl_o !== 4'd0) begin
      $display("FAIL: f2i_shl_o should be 0 for NaN");
      $finish;
    end
    if (f2i_ovf_o !== 1'b0) begin
      $display("FAIL: f2i_ovf_o should be 0 for NaN");
      $finish;
    end
    if (f2i_snan_o !== 1'b1) begin
      $display("FAIL: f2i_snan_o should be 1 for signaling NaN");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule