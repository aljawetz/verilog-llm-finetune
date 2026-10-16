`timescale 1ns/1ps

module tb_Log_add2;

  reg [29:0] coeffs_Log_in;
  reg [29:0] y_e_D2;
  wire [30:0] y_e;

  // Instantiate the module under test
  Log_add2 uut (
    .coeffs_Log_in(coeffs_Log_in),
    .y_e_D2(y_e_D2),
    .y_e(y_e)
  );

  initial begin
    // Test case 1: Simple addition
    coeffs_Log_in = 30'd5;
    y_e_D2 = 30'd10;
    #10;
    if (y_e !== 31'd15) begin
      $display("FAIL: Test case 1 failed, expected 15 but got %d", y_e);
      $finish;
    end

    // Test case 2: Adding zero
    coeffs_Log_in = 30'd0;
    y_e_D2 = 30'd20;
    #10;
    if (y_e !== 31'd20) begin
      $display("FAIL: Test case 2 failed, expected 20 but got %d", y_e);
      $finish;
    end

    // Test case 3: Maximum values
    coeffs_Log_in = 30'd1073741823; // 2^30 - 1
    y_e_D2 = 30'd1073741823; // 2^30 - 1
    #10;
    if (y_e !== 31'd2147483646) begin
      $display("FAIL: Test case 3 failed, expected 2147483646 but got %d", y_e);
      $finish;
    end

    // Test case 4: Mixed values
    coeffs_Log_in = 30'd123456;
    y_e_D2 = 30'd654321;
    #10;
    if (y_e !== 31'd777777) begin
      $display("FAIL: Test case 4 failed, expected 777777 but got %d", y_e);
      $finish;
    end

    // Test case 5: All zeros
    coeffs_Log_in = 30'd0;
    y_e_D2 = 30'd0;
    #10;
    if (y_e !== 31'd0) begin
      $display("FAIL: Test case 5 failed, expected 0 but got %d", y_e);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule