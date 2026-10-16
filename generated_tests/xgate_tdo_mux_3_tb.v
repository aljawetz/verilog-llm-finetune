`timescale 1ns/1ps

module tb_xgate_tdo_mux;

  // Inputs
  reg sel_bypass;
  reg sel_bsd;
  reg sel_id;
  reg sel_udi_1;
  reg bypass_so;
  reg bsd_so;
  reg id_so;
  reg user1_so;
  reg ir_so;
  reg shift_dr;
  reg shift_ir;
  reg update_clk;
  reg jtag_reset_n;

  // Outputs
  wire jtag_tdo;
  wire jtag_tdo_en;

  // Instantiate the Unit Under Test (UUT)
  xgate_tdo_mux uut (
    .sel_bypass(sel_bypass),
    .sel_bsd(sel_bsd),
    .sel_id(sel_id),
    .sel_udi_1(sel_udi_1),
    .bypass_so(bypass_so),
    .bsd_so(bsd_so),
    .id_so(id_so),
    .user1_so(user1_so),
    .ir_so(ir_so),
    .shift_dr(shift_dr),
    .shift_ir(shift_ir),
    .update_clk(update_clk),
    .jtag_reset_n(jtag_reset_n),
    .jtag_tdo(jtag_tdo),
    .jtag_tdo_en(jtag_tdo_en)
  );

  // Clock generation
  initial begin
    update_clk = 0;
    forever #5 update_clk = ~update_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    jtag_reset_n = 0; // Assert reset
    sel_bypass = 0;
    sel_bsd = 0;
    sel_id = 0;
    sel_udi_1 = 0;
    bypass_so = 0;
    bsd_so = 0;
    id_so = 0;
    user1_so = 0;
    ir_so = 0;
    shift_dr = 0;
    shift_ir = 0;

    // Release reset
    #10 jtag_reset_n = 1;

    // Test case 1: Bypass selection
    sel_bypass = 1;
    bypass_so = 1;
    shift_dr = 1;
    #10;
    if (jtag_tdo !== 1) $display("FAIL: Test case 1 failed");
    if (jtag_tdo_en !== 1) $display("FAIL: Test case 1 enable failed");

    // Test case 2: BSD selection
    sel_bypass = 0;
    sel_bsd = 1;
    bsd_so = 1;
    #10;
    if (jtag_tdo !== 1) $display("FAIL: Test case 2 failed");
    if (jtag_tdo_en !== 1) $display("FAIL: Test case 2 enable failed");

    // Test case 3: ID selection
    sel_bsd = 0;
    sel_id = 1;
    id_so = 1;
    #10;
    if (jtag_tdo !== 1) $display("FAIL: Test case 3 failed");
    if (jtag_tdo_en !== 1) $display("FAIL: Test case 3 enable failed");

    // Test case 4: User1 selection
    sel_id = 0;
    sel_udi_1 = 1;
    user1_so = 1;
    #10;
    if (jtag_tdo !== 1) $display("FAIL: Test case 4 failed");
    if (jtag_tdo_en !== 1) $display("FAIL: Test case 4 enable failed");

    // Test case 5: IR selection
    sel_udi_1 = 0;
    shift_ir = 1;
    ir_so = 1;
    #10;
    if (jtag_tdo !== 1) $display("FAIL: Test case 5 failed");
    if (jtag_tdo_en !== 1) $display("FAIL: Test case 5 enable failed");

    // Test case 6: No selection
    sel_bypass = 0;
    sel_bsd = 0;
    sel_id = 0;
    sel_udi_1 = 0;
    shift_ir = 0;
    #10;
    if (jtag_tdo !== 0) $display("FAIL: Test case 6 failed");
    if (jtag_tdo_en !== 0) $display("FAIL: Test case 6 enable failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule