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

    // Test case 1: Check JTAG TCK output
    io_pins_TCK_i_ival = 1;
    #10;
    if (io_jtag_TCK !== 1) begin
      $display("FAIL: JTAG TCK output mismatch");
      $finish;
    end

    // Test case 2: Check JTAG TMS output
    io_pins_TMS_i_ival = 1;
    #10;
    if (io_jtag_TMS !== 1) begin
      $display("FAIL: JTAG TMS output mismatch");
      $finish;
    end

    // Test case 3: Check JTAG TDI output
    io_pins_TDI_i_ival = 1;
    #10;
    if (io_jtag_TDI !== 1) begin
      $display("FAIL: JTAG TDI output mismatch");
      $finish;
    end

    // Test case 4: Check JTAG TRST output
    io_pins_TRST_n_i_ival = 0; // TRST active low
    #10;
    if (io_jtag_TRST !== 1) begin
      $display("FAIL: JTAG TRST output mismatch");
      $finish;
    end

    // Test case 5: Check TDO output from JTAG
    io_jtag_TDO = 1;
    #10;
    if (io_pins_TDO_o_oval !== 1) begin
      $display("FAIL: TDO output mismatch");
      $finish;
    end

    // Test case 6: Check TDO OE signal
    io_jtag_DRV_TDO = 1;
    #10;
    if (io_pins_TDO_o_oe !== 1) begin
      $display("FAIL: TDO OE signal mismatch");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule