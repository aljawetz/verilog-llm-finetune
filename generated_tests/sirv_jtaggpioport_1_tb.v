`timescale 1ns/1ps

module tb_sirv_jtaggpioport;

  reg clock;
  reg reset;
  wire io_jtag_TCK;
  wire io_jtag_TMS;
  wire io_jtag_TDI;
  reg io_jtag_TDO;
  wire io_jtag_TRST;
  reg io_jtag_DRV_TDO;
  reg io_pins_TCK_i_ival;
  wire io_pins_TCK_o_oval;
  wire io_pins_TCK_o_oe;
  wire io_pins_TCK_o_ie;
  wire io_pins_TCK_o_pue;
  wire io_pins_TCK_o_ds;
  reg io_pins_TMS_i_ival;
  wire io_pins_TMS_o_oval;
  wire io_pins_TMS_o_oe;
  wire io_pins_TMS_o_ie;
  wire io_pins_TMS_o_pue;
  wire io_pins_TMS_o_ds;
  reg io_pins_TDI_i_ival;
  wire io_pins_TDI_o_oval;
  wire io_pins_TDI_o_oe;
  wire io_pins_TDI_o_ie;
  wire io_pins_TDI_o_pue;
  wire io_pins_TDI_o_ds;
  reg io_pins_TDO_i_ival;
  wire io_pins_TDO_o_oval;
  wire io_pins_TDO_o_oe;
  wire io_pins_TDO_o_ie;
  wire io_pins_TDO_o_pue;
  wire io_pins_TDO_o_ds;
  reg io_pins_TRST_n_i_ival;
  wire io_pins_TRST_n_o_oval;
  wire io_pins_TRST_n_o_oe;
  wire io_pins_TRST_n_o_ie;
  wire io_pins_TRST_n_o_pue;
  wire io_pins_TRST_n_o_ds;

  // Instantiate the Unit Under Test (UUT)
  sirv_jtaggpioport uut (
    .clock(clock),
    .reset(reset),
    .io_jtag_TCK(io_jtag_TCK),
    .io_jtag_TMS(io_jtag_TMS),
    .io_jtag_TDI(io_jtag_TDI),
    .io_jtag_TDO(io_jtag_TDO),
    .io_jtag_TRST(io_jtag_TRST),
    .io_jtag_DRV_TDO(io_jtag_DRV_TDO),
    .io_pins_TCK_i_ival(io_pins_TCK_i_ival),
    .io_pins_TCK_o_oval(io_pins_TCK_o_oval),
    .io_pins_TCK_o_oe(io_pins_TCK_o_oe),
    .io_pins_TCK_o_ie(io_pins_TCK_o_ie),
    .io_pins_TCK_o_pue(io_pins_TCK_o_pue),
    .io_pins_TCK_o_ds(io_pins_TCK_o_ds),
    .io_pins_TMS_i_ival(io_pins_TMS_i_ival),
    .io_pins_TMS_o_oval(io_pins_TMS_o_oval),
    .io_pins_TMS_o_oe(io_pins_TMS_o_oe),
    .io_pins_TMS_o_ie(io_pins_TMS_o_ie),
    .io_pins_TMS_o_pue(io_pins_TMS_o_pue),
    .io_pins_TMS_o_ds(io_pins_TMS_o_ds),
    .io_pins_TDI_i_ival(io_pins_TDI_i_ival),
    .io_pins_TDI_o_oval(io_pins_TDI_o_oval),
    .io_pins_TDI_o_oe(io_pins_TDI_o_oe),
    .io_pins_TDI_o_ie(io_pins_TDI_o_ie),
    .io_pins_TDI_o_pue(io_pins_TDI_o_pue),
    .io_pins_TDI_o_ds(io_pins_TDI_o_ds),
    .io_pins_TDO_i_ival(io_pins_TDO_i_ival),
    .io_pins_TDO_o_oval(io_pins_TDO_o_oval),
    .io_pins_TDO_o_oe(io_pins_TDO_o_oe),
    .io_pins_TDO_o_ie(io_pins_TDO_o_ie),
    .io_pins_TDO_o_pue(io_pins_TDO_o_pue),
    .io_pins_TDO_o_ds(io_pins_TDO_o_ds),
    .io_pins_TRST_n_i_ival(io_pins_TRST_n_i_ival),
    .io_pins_TRST_n_o_oval(io_pins_TRST_n_o_oval),
    .io_pins_TRST_n_o_oe(io_pins_TRST_n_o_oe),
    .io_pins_TRST_n_o_ie(io_pins_TRST_n_o_ie),
    .io_pins_TRST_n_o_pue(io_pins_TRST_n_o_pue),
    .io_pins_TRST_n_o_ds(io_pins_TRST_n_o_ds)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    io_jtag_TDO = 0;
    io_jtag_DRV_TDO = 0;
    io_pins_TCK_i_ival = 0;
    io_pins_TMS_i_ival = 0;
    io_pins_TDI_i_ival = 0;
    io_pins_TDO_i_ival = 0;
    io_pins_TRST_n_i_ival = 1;

    // Release reset
    #10 reset = 0;
    #10 reset = 1;

    // Test TCK
    io_pins_TCK_i_ival = 1;
    #10;
    if (io_jtag_TCK !== 1) $display("FAIL: io_jtag_TCK should be 1");
    
    io_pins_TCK_i_ival = 0;
    #10;
    if (io_jtag_TCK !== 0) $display("FAIL: io_jtag_TCK should be 0");

    // Test TMS
    io_pins_TMS_i_ival = 1;
    #10;
    if (io_jtag_TMS !== 1) $display("FAIL: io_jtag_TMS should be 1");

    io_pins_TMS_i_ival = 0;
    #10;
    if (io_jtag_TMS !== 0) $display("FAIL: io_jtag_TMS should be 0");

    // Test TDI
    io_pins_TDI_i_ival = 1;
    #10;
    if (io_jtag_TDI !== 1) $display("FAIL: io_jtag_TDI should be 1");

    io_pins_TDI_i_ival = 0;
    #10;
    if (io_jtag_TDI !== 0) $display("FAIL: io_jtag_TDI should be 0");

    // Test TRST
    io_pins_TRST_n_i_ival = 0;
    #10;
    if (io_jtag_TRST !== 1) $display("FAIL: io_jtag_TRST should be 1");

    io_pins_TRST_n_i_ival = 1;
    #10;
    if (io_jtag_TRST !== 0) $display("FAIL: io_jtag_TRST should be 0");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule