`timescale 1ns/1ps

module tb_addsub;

  reg Su;
  reg Eu;
  reg [7:0] ina;
  reg [7:0] inb;
  wire [7:0] result;

  // Instantiate the module under test
  addsub uut (
    .Su(Su),
    .Eu(Eu),
    .ina(ina),
    .inb(inb),
    .result(result)
  );

  initial begin
    // Test case 1: Addition when Eu is high and Su is low
    Eu = 1; Su = 0; ina = 8'd15; inb = 8'd10; 
    #10;
    if (result !== 8'd25) $display("FAIL: Test case 1 failed, expected 25 but got %d", result);

    // Test case 2: Subtraction when Eu is high and Su is high
    Eu = 1; Su = 1; ina = 8'd20; inb = 8'd5; 
    #10;
    if (result !== 8'd15) $display("FAIL: Test case 2 failed, expected 15 but got %d", result);

    // Test case 3: High impedance when Eu is low
    Eu = 0; Su = 0; ina = 8'd30; inb = 8'd10; 
    #10;
    if (result !== 8'bz) $display("FAIL: Test case 3 failed, expected high impedance but got %d", result);

    // Test case 4: High impedance when Eu is low and Su is high
    Eu = 0; Su = 1; ina = 8'd40; inb = 8'd20; 
    #10;
    if (result !== 8'bz) $display("FAIL: Test case 4 failed, expected high impedance but got %d", result);

    // Test case 5: Addition with zero
    Eu = 1; Su = 0; ina = 8'd0; inb = 8'd0; 
    #10;
    if (result !== 8'd0) $display("FAIL: Test case 5 failed, expected 0 but got %d", result);

    // Test case 6: Subtraction resulting in zero
    Eu = 1; Su = 1; ina = 8'd10; inb = 8'd10; 
    #10;
    if (result !== 8'd0) $display("FAIL: Test case 6 failed, expected 0 but got %d", result);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule