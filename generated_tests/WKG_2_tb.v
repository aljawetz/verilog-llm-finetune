`timescale 1ns/1ps

module tb_WKG;

  // Parameters
  reg         i_op;
  reg         i_wf_post_pre;
  reg [31:0]  i_mk3to0;
  reg [31:0]  i_mk15to12;
  wire [7:0] o_wk3_7;
  wire [7:0] o_wk2_6;
  wire [7:0] o_wk1_5;
  wire [7:0] o_wk0_4;

  // Instantiate the Unit Under Test (UUT)
  WKG uut (
    .i_op(i_op),
    .i_wf_post_pre(i_wf_post_pre),
    .i_mk3to0(i_mk3to0),
    .i_mk15to12(i_mk15to12),
    .o_wk3_7(o_wk3_7),
    .o_wk2_6(o_wk2_6),
    .o_wk1_5(o_wk1_5),
    .o_wk0_4(o_wk0_4)
  );

  initial begin
    // Initialize inputs
    i_op = 0;
    i_wf_post_pre = 0;
    i_mk3to0 = 32'hA5A5A5A5; // Example data
    i_mk15to12 = 32'h5A5A5A5A; // Example data

    // Test case 1: w_out_sel = 0
    #10;
    i_op = 0;
    i_wf_post_pre = 0;
    #10;
    if (o_wk3_7 !== 8'h5A || o_wk2_6 !== 8'h5A || o_wk1_5 !== 8'h5A || o_wk0_4 !== 8'h5A) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: w_out_sel = 1
    #10;
    i_op = 1;
    i_wf_post_pre = 0;
    #10;
    if (o_wk3_7 !== 8'hA5 || o_wk2_6 !== 8'hA5 || o_wk1_5 !== 8'hA5 || o_wk0_4 !== 8'hA5) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: w_out_sel = 1 with different inputs
    #10;
    i_op = 0;
    i_wf_post_pre = 1;
    #10;
    if (o_wk3_7 !== 8'hA5 || o_wk2_6 !== 8'hA5 || o_wk1_5 !== 8'hA5 || o_wk0_4 !== 8'hA5) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: w_out_sel = 0 with different inputs
    #10;
    i_op = 1;
    i_wf_post_pre = 1;
    #10;
    if (o_wk3_7 !== 8'h5A || o_wk2_6 !== 8'h5A || o_wk1_5 !== 8'h5A || o_wk0_4 !== 8'h5A) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule