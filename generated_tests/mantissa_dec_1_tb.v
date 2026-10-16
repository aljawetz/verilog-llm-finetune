`timescale 1ns/1ps

module tb_mantissa_dec;

  // Inputs
  reg [2:0] a2func;
  reg [2:0] a1func;
  reg [2:0] a0func;
  reg [2:0] cyc0_type;
  reg [7:0] fpu_state;
  reg [1:0] mconfunc;
  reg altb;
  reg expsame;
  reg ae_small;
  reg b1msb;
  reg eadd;
  reg morethree_taken;
  reg cyc0_rdy;
  reg cyc1_rdy;
  reg amsb;
  reg a1comp;
  reg a0comp;
  reg b1comp;
  reg b0comp;

  // Outputs
  wire [2:0] a0psel;
  wire [2:0] fp_out_sel;
  wire [2:0] a1sel;
  wire [1:0] b0sel_a;
  wire [1:0] b0sel_b;
  wire [1:0] b1sel;
  wire [1:0] a1psel;
  wire [1:0] a2sel;
  wire [1:0] cyc0_sel;
  wire b1psel;
  wire b1msbin;
  wire manzero;
  wire a_small;
  wire a1zzsel;
  wire b1_cyc0sel;
  wire [2:0] a0sel;

  // Instantiate the Unit Under Test (UUT)
  mantissa_dec uut (
    .b0sel_a(b0sel_a),
    .b0sel_b(b0sel_b),
    .a_small(a_small),
    .a1sel(a1sel),
    .a0sel(a0sel),
    .a0psel(a0psel),
    .altb(altb),
    .expsame(expsame),
    .ae_small(ae_small),
    .b1sel(b1sel),
    .a0func(a0func),
    .a1func(a1func),
    .fp_out_sel(fp_out_sel),
    .fpu_state(fpu_state),
    .b1msb(b1msb),
    .b1msbin(b1msbin),
    .b1psel(b1psel),
    .a1psel(a1psel),
    .a2sel(a2sel),
    .eadd(eadd),
    .a2func(a2func),
    .morethree_taken(morethree_taken),
    .cyc0_rdy(cyc0_rdy),
    .cyc0_type(cyc0_type),
    .cyc1_rdy(cyc1_rdy),
    .a1comp(a1comp),
    .a0comp(a0comp),
    .b1comp(b1comp),
    .b0comp(b0comp),
    .mconfunc(mconfunc),
    .amsb(amsb),
    .manzero(manzero),
    .a1zzsel(a1zzsel),
    .b1_cyc0sel(b1_cyc0sel),
    .cyc0_sel(cyc0_sel)
  );

  // Clock and Reset
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  initial begin
    // Initialize Inputs
    a2func = 3'b000;
    a1func = 3'b000;
    a0func = 3'b000;
    cyc0_type = 3'b000;
    fpu_state = 8'b00000000;
    mconfunc = 2'b00;
    altb = 0;
    expsame = 0;
    ae_small = 0;
    b1msb = 0;
    eadd = 0;
    morethree_taken = 0;
    cyc0_rdy = 0;
    cyc1_rdy = 0;
    amsb = 0;
    a1comp = 0;
    a0comp = 0;
    b1comp = 0;
    b0comp = 0;

    // Wait for global reset
    #10;

    // Test case 1
    a2func = 3'b001; a1func = 3'b000; a0func = 3'b000; cyc0_type = 3'b000; fpu_state = 8'b00000001; mconfunc = 2'b00;
    #10;
    if (fp_out_sel !== 3'b000) $display("FAIL: Test case 1 failed on fp_out_sel");

    // Test case 2
    a2func = 3'b010; a1func = 3'b001; a0func = 3'b010; cyc0_type = 3'b001; fpu_state = 8'b00000010; mconfunc = 2'b01;
    #10;
    if (fp_out_sel !== 3'b000) $display("FAIL: Test case 2 failed on fp_out_sel");

    // Test case 3
    a2func = 3'b011; a1func = 3'b010; a0func = 3'b011; cyc0_type = 3'b010; fpu_state = 8'b00000100; mconfunc = 2'b10;
    #10;
    if (fp_out_sel !== 3'b000) $display("FAIL: Test case 3 failed on fp_out_sel");

    // Test case 4
    a2func = 3'b100; a1func = 3'b011; a0func = 3'b100; cyc0_type = 3'b011; fpu_state = 8'b00001000; mconfunc = 2'b11;
    #10;
    if (fp_out_sel !== 3'b000) $display("FAIL: Test case 4 failed on fp_out_sel");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule