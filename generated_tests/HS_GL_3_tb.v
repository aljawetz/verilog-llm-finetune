`timescale 1ns/1ps

module tb_HS_GL;
  reg ip1;
  reg ip2;
  wire borrow;
  wire difference;

  // Instantiate the module under test (uut)
  HS_GL uut (
    .ip1(ip1),
    .ip2(ip2),
    .borrow(borrow),
    .difference(difference)
  );

  initial begin
    // Test case 1: ip1 = 0, ip2 = 0
    ip1 = 0; ip2 = 0;
    #10;
    if (borrow !== 0 || difference !== 0) begin
      $display("FAIL: Test case 1 failed (ip1=0, ip2=0)");
      $finish;
    end

    // Test case 2: ip1 = 0, ip2 = 1
    ip1 = 0; ip2 = 1;
    #10;
    if (borrow !== 1 || difference !== 1) begin
      $display("FAIL: Test case 2 failed (ip1=0, ip2=1)");
      $finish;
    end

    // Test case 3: ip1 = 1, ip2 = 0
    ip1 = 1; ip2 = 0;
    #10;
    if (borrow !== 0 || difference !== 1) begin
      $display("FAIL: Test case 3 failed (ip1=1, ip2=0)");
      $finish;
    end

    // Test case 4: ip1 = 1, ip2 = 1
    ip1 = 1; ip2 = 1;
    #10;
    if (borrow !== 0 || difference !== 0) begin
      $display("FAIL: Test case 4 failed (ip1=1, ip2=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule