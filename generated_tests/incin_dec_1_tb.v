`timescale 1ns/1ps

module tb_incin_dec;

  reg [2:0] incinfunc;
  reg lsround;
  reg rsround;
  reg incin;
  wire nxincin;

  // Instantiate the module under test (uut)
  incin_dec uut (
    .nxincin(nxincin),
    .incinfunc(incinfunc),
    .lsround(lsround),
    .rsround(rsround),
    .incin(incin)
  );

  initial begin
    // Test case 1: incinfunc = 3'b001
    incinfunc = 3'b001; lsround = 0; rsround = 0; incin = 0;
    #10;
    if (nxincin !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected nxincin = 1");
      $finish;
    end

    // Test case 2: incinfunc = 3'b01x (rsround = 1)
    incinfunc = 3'b010; lsround = 0; rsround = 1; incin = 0;
    #10;
    if (nxincin !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected nxincin = 1");
      $finish;
    end

    // Test case 3: incinfunc = 3'b01x (rsround = 0)
    incinfunc = 3'b011; lsround = 0; rsround = 0; incin = 0;
    #10;
    if (nxincin !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected nxincin = 0");
      $finish;
    end

    // Test case 4: incinfunc = 3'b10x (lsround = 1)
    incinfunc = 3'b100; lsround = 1; rsround = 0; incin = 0;
    #10;
    if (nxincin !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected nxincin = 1");
      $finish;
    end

    // Test case 5: incinfunc = 3'b10x (lsround = 0)
    incinfunc = 3'b101; lsround = 0; rsround = 0; incin = 0;
    #10;
    if (nxincin !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected nxincin = 0");
      $finish;
    end

    // Test case 6: incinfunc = 3'b110 (incin = 1)
    incinfunc = 3'b110; lsround = 0; rsround = 0; incin = 1;
    #10;
    if (nxincin !== 1'b1) begin
      $display("FAIL: Test case 6 failed, expected nxincin = 1");
      $finish;
    end

    // Test case 7: incinfunc = 3'b110 (incin = 0)
    incinfunc = 3'b110; lsround = 0; rsround = 0; incin = 0;
    #10;
    if (nxincin !== 1'b0) begin
      $display("FAIL: Test case 7 failed, expected nxincin = 0");
      $finish;
    end

    // Test case 8: incinfunc = default case
    incinfunc = 3'b000; lsround = 0; rsround = 0; incin = 0;
    #10;
    if (nxincin !== 1'b0) begin
      $display("FAIL: Test case 8 failed, expected nxincin = 0");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule