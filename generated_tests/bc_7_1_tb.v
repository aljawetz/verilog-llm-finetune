`timescale 1ns/1ps

module tb_bc_7;

  reg capture_clk;
  reg update_clk;
  reg capture_en;
  reg update_en;
  reg shift_dr;
  reg mode;
  reg si;
  reg pin_input;
  reg control_out;
  reg output_data;
  reg reset_n;
  wire data_out;
  wire so;

  // Instantiate the module under test (uut)
  bc_7 uut (
    .capture_clk(capture_clk),
    .update_clk(update_clk),
    .capture_en(capture_en),
    .update_en(update_en),
    .shift_dr(shift_dr),
    .mode(mode),
    .si(si),
    .pin_input(pin_input),
    .control_out(control_out),
    .output_data(output_data),
    .reset_n(reset_n),
    .data_out(data_out),
    .so(so)
  );

  // Clock generation
  initial begin
    capture_clk = 0;
    update_clk = 0;
    forever begin
      #5 capture_clk = ~capture_clk; // 100MHz capture clock
      #10 update_clk = ~update_clk;   // 50MHz update clock
    end
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset_n = 0;
    capture_en = 0;
    update_en = 0;
    shift_dr = 0;
    mode = 0;
    si = 0;
    pin_input = 0;
    control_out = 0;
    output_data = 0;

    // Release reset
    #15 reset_n = 1;

    // Test case 1: Check reset functionality
    #10;
    if (so !== 0 || data_out !== 0) begin
      $display("FAIL: Reset did not clear outputs");
      $finish;
    end

    // Test case 2: Capture mode with pin_input
    #10;
    capture_en = 1;
    pin_input = 1;
    shift_dr = 0; // Parallel capture mode
    #10;
    if (so !== 1) begin
      $display("FAIL: so not capturing pin_input correctly");
      $finish;
    end

    // Test case 3: Shift mode with serial input
    #10;
    shift_dr = 1; // Shift mode
    si = 1; // Serial input
    #10;
    if (so !== 1) begin
      $display("FAIL: so not shifting serial input correctly");
      $finish;
    end

    // Test case 4: Update holding register
    #10;
    update_en = 1;
    #10;
    if (uut.data_reg !== 1) begin
      $display("FAIL: Holding register not updated correctly");
      $finish;
    end

    // Test case 5: Check data_out in mission mode
    #10;
    mode = 0; // Mission mode
    output_data = 1;
    #10;
    if (data_out !== 1) begin
      $display("FAIL: data_out not reflecting output_data in mission mode");
      $finish;
    end

    // Test case 6: Check data_out in test mode
    #10;
    mode = 1; // Test mode
    #10;
    if (data_out !== 1) begin
      $display("FAIL: data_out not reflecting holding register in test mode");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule