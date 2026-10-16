`timescale 1ns/1ps

module tb_cyclic_lamp;

  reg clock;
  wire [2:0] light;
  
  // Instantiate the module under test (uut)
  cyclic_lamp uut (
    .clock(clock),
    .light(light)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Wait for a few clock cycles to observe the initial state
    #10;
    
    // Check the initial state
    if (light !== 3'b100) begin
      $display("FAIL: Initial light state is not RED");
      $finish;
    end

    // Wait for one clock cycle and check the state
    #10;
    if (light !== 3'b010) begin
      $display("FAIL: After 1 clock cycle, light state is not GREEN");
      $finish;
    end

    // Wait for one clock cycle and check the state
    #10;
    if (light !== 3'b001) begin
      $display("FAIL: After 2 clock cycles, light state is not YELLOW");
      $finish;
    end

    // Wait for one clock cycle and check the state
    #10;
    if (light !== 3'b100) begin
      $display("FAIL: After 3 clock cycles, light state is not RED");
      $finish;
    end

    // Continue checking for a few more cycles to ensure it cycles correctly
    #10;
    if (light !== 3'b010) begin
      $display("FAIL: After 4 clock cycles, light state is not GREEN");
      $finish;
    end

    #10;
    if (light !== 3'b001) begin
      $display("FAIL: After 5 clock cycles, light state is not YELLOW");
      $finish;
    end

    #10;
    if (light !== 3'b100) begin
      $display("FAIL: After 6 clock cycles, light state is not RED");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule