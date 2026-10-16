`timescale 1ns/1ps

module tb_mux_8x1;

  reg [7:0] data_inputs;
  reg [2:0] select_line;
  wire output_data;

  // Instantiate the module under test (uut)
  mux_8x1 uut (
    .data_inputs(data_inputs),
    .select_line(select_line),
    .output_data(output_data)
  );

  initial begin
    // Test case 1: Select input 0
    data_inputs = 8'b10101010; // Input data
    select_line = 3'b000;      // Select line for input 0
    #10;
    if (output_data !== data_inputs[0]) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", data_inputs[0], output_data);
      $finish;
    end

    // Test case 2: Select input 1
    select_line = 3'b001;      // Select line for input 1
    #10;
    if (output_data !== data_inputs[1]) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", data_inputs[1], output_data);
      $finish;
    end

    // Test case 3: Select input 2
    select_line = 3'b010;      // Select line for input 2
    #10;
    if (output_data !== data_inputs[2]) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", data_inputs[2], output_data);
      $finish;
    end

    // Test case 4: Select input 3
    select_line = 3'b011;      // Select line for input 3
    #10;
    if (output_data !== data_inputs[3]) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", data_inputs[3], output_data);
      $finish;
    end

    // Test case 5: Select input 4
    select_line = 3'b100;      // Select line for input 4
    #10;
    if (output_data !== data_inputs[4]) begin
      $display("FAIL: Test case 5 failed, expected %b, got %b", data_inputs[4], output_data);
      $finish;
    end

    // Test case 6: Select input 5
    select_line = 3'b101;      // Select line for input 5
    #10;
    if (output_data !== data_inputs[5]) begin
      $display("FAIL: Test case 6 failed, expected %b, got %b", data_inputs[5], output_data);
      $finish;
    end

    // Test case 7: Select input 6
    select_line = 3'b110;      // Select line for input 6
    #10;
    if (output_data !== data_inputs[6]) begin
      $display("FAIL: Test case 7 failed, expected %b, got %b", data_inputs[6], output_data);
      $finish;
    end

    // Test case 8: Select input 7
    select_line = 3'b111;      // Select line for input 7
    #10;
    if (output_data !== data_inputs[7]) begin
      $display("FAIL: Test case 8 failed, expected %b, got %b", data_inputs[7], output_data);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule