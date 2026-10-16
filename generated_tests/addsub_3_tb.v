`timescale 1ns/1ps

module tb_addsub;

  // Parameters
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
    // Test Case 1: Addition when Eu is high and Su is low
    Eu = 1; Su = 0; ina = 8'd10; inb = 8'd5; 
    #10;
    if (result !== 8'd15) begin
      $display("FAIL: Test Case 1 failed, expected 15 but got %d", result);
      $finish;
    end

    // Test Case 2: Subtraction when Eu is high and Su is high
    Eu = 1; Su = 1; ina = 8'd10; inb = 8'd5; 
    #10;
    if (result !== 8'd5) begin
      $display("FAIL: Test Case 2 failed, expected 5 but got %d", result);
      $finish;
    end

    // Test Case 3: High impedance when Eu is low
    Eu = 0; Su = 0; ina = 8'd10; inb = 8'd5; 
    #10;
    if (result !== 8'bz) begin
      $display("FAIL: Test Case 3 failed, expected high impedance but got %d", result);
      $finish;
    end

    // Test Case 4: High impedance when Eu is low and Su is high
    Eu = 0; Su = 1; ina = 8'd10; inb = 8'd5; 
    #10;
    if (result !== 8'bz) begin
      $display("FAIL: Test Case 4 failed, expected high impedance but got %d", result);
      $finish;
    end

    // Test Case 5: Addition with maximum values
    Eu = 1; Su = 0; ina = 8'd255; inb = 8'd1; 
    #10;
    if (result !== 8'd0) begin
      $display("FAIL: Test Case 5 failed, expected 0 but got %d", result);
      $finish;
    end

    // Test Case 6: Subtraction with minimum values
    Eu = 1; Su = 1; ina = 8'd0; inb = 8'd1; 
    #10;
    if (result !== 8'd255) begin
      $display("FAIL: Test Case 6 failed, expected 255 but got %d", result);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule