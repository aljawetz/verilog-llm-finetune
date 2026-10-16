`timescale 1ns/1ps

module tb_addsub;

  reg Su;
  reg Eu;
  reg [7:0] ina;
  reg [7:0] inb;
  wire [7:0] result;

  // Instantiate the module under test (uut)
  addsub uut (
    .Su(Su),
    .Eu(Eu),
    .ina(ina),
    .inb(inb),
    .result(result)
  );

  initial begin
    // Test case 1: Addition
    Su = 0; Eu = 1; ina = 8'd15; inb = 8'd10; #10;
    if (result !== 8'd25) begin
      $display("FAIL: Test case 1 failed (Addition)");
      $finish;
    end

    // Test case 2: Subtraction
    Su = 1; Eu = 1; ina = 8'd20; inb = 8'd5; #10;
    if (result !== 8'd15) begin
      $display("FAIL: Test case 2 failed (Subtraction)");
      $finish;
    end

    // Test case 3: High impedance state
    Su = 0; Eu = 0; ina = 8'd10; inb = 8'd5; #10;
    if (result !== 8'bz) begin
      $display("FAIL: Test case 3 failed (High Impedance)");
      $finish;
    end

    // Test case 4: Addition with zero
    Su = 0; Eu = 1; ina = 8'd0; inb = 8'd0; #10;
    if (result !== 8'd0) begin
      $display("FAIL: Test case 4 failed (Addition with zero)");
      $finish;
    end

    // Test case 5: Subtraction resulting in zero
    Su = 1; Eu = 1; ina = 8'd10; inb = 8'd10; #10;
    if (result !== 8'd0) begin
      $display("FAIL: Test case 5 failed (Subtraction resulting in zero)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule