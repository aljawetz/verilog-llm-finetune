`timescale 1ns/1ps

module tb_gen_17_1_mux;

  parameter PA_DATA = 32;
  parameter PA_SEL = 9;

  reg clk;
  reg rst_b;
  reg [PA_SEL-1:0] sel;
  reg [PA_DATA-1:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
  reg [PA_DATA-1:0] reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15;
  reg [PA_DATA-1:0] pc;
  wire [PA_DATA-1:0] mux_out;

  // Instantiate the module under test
  gen_17_1_mux uut (
    .clk(clk),
    .rst_b(rst_b),
    .sel(sel),
    .reg0(reg0),
    .reg1(reg1),
    .reg2(reg2),
    .reg3(reg3),
    .reg4(reg4),
    .reg5(reg5),
    .reg6(reg6),
    .reg7(reg7),
    .reg8(reg8),
    .reg9(reg9),
    .reg10(reg10),
    .reg11(reg11),
    .reg12(reg12),
    .reg13(reg13),
    .reg14(reg14),
    .reg15(reg15),
    .pc(pc),
    .mux_out(mux_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_b = 0;
    sel = 0;
    reg0 = 32'hAAAA_AAAA;
    reg1 = 32'hBBBB_BBBB;
    reg2 = 32'hCCCC_CCCC;
    reg3 = 32'hDDDD_DDDD;
    reg4 = 32'hEEEE_EEEE;
    reg5 = 32'hFFFF_FFFF;
    reg6 = 32'h1111_1111;
    reg7 = 32'h2222_2222;
    reg8 = 32'h3333_3333;
    reg9 = 32'h4444_4444;
    reg10 = 32'h5555_5555;
    reg11 = 32'h6666_6666;
    reg12 = 32'h7777_7777;
    reg13 = 32'h8888_8888;
    reg14 = 32'h9999_9999;
    reg15 = 32'h0000_0000;
    pc = 32'hFFFFFFFF;

    // Release reset
    #10;
    rst_b = 1;

    // Test each register selection
    sel = 9'h000; #10; if (mux_out !== reg0) $display("FAIL: mux_out should be reg0");
    sel = 9'h001; #10; if (mux_out !== reg1) $display("FAIL: mux_out should be reg1");
    sel = 9'h002; #10; if (mux_out !== reg2) $display("FAIL: mux_out should be reg2");
    sel = 9'h003; #10; if (mux_out !== reg3) $display("FAIL: mux_out should be reg3");
    sel = 9'h004; #10; if (mux_out !== reg4) $display("FAIL: mux_out should be reg4");
    sel = 9'h005; #10; if (mux_out !== reg5) $display("FAIL: mux_out should be reg5");
    sel = 9'h006; #10; if (mux_out !== reg6) $display("FAIL: mux_out should be reg6");
    sel = 9'h007; #10; if (mux_out !== reg7) $display("FAIL: mux_out should be reg7");
    sel = 9'h008; #10; if (mux_out !== reg8) $display("FAIL: mux_out should be reg8");
    sel = 9'h009; #10; if (mux_out !== reg9) $display("FAIL: mux_out should be reg9");
    sel = 9'h00A; #10; if (mux_out !== reg10) $display("FAIL: mux_out should be reg10");
    sel = 9'h00B; #10; if (mux_out !== reg11) $display("FAIL: mux_out should be reg11");
    sel = 9'h00C; #10; if (mux_out !== reg12) $display("FAIL: mux_out should be reg12");
    sel = 9'h00D; #10; if (mux_out !== reg13) $display("FAIL: mux_out should be reg13");
    sel = 9'h00E; #10; if (mux_out !== reg14) $display("FAIL: mux_out should be reg14");
    sel = 9'h00F; #10; if (mux_out !== reg15) $display("FAIL: mux_out should be reg15");
    sel = 9'h0FF; #10; if (mux_out !== pc) $display("FAIL: mux_out should be pc");
    sel = 9'h100; #10; if (mux_out !== 32'd0) $display("FAIL: mux_out should be 0");
    
    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule