`timescale 1ns/1ps

module tb_mux_16x1;

  reg [15:0] data_inputs;
  reg [3:0] select_line;
  wire output_data;

  // Instantiate the module under test (uut)
  mux_16x1 uut (
    .data_inputs(data_inputs),
    .select_line(select_line),
    .output_data(output_data)
  );

  initial begin
    // Test case 1: Select input 0
    data_inputs = 16'b1010101010101010; // Example data
    select_line = 4'b0000; // Select first input
    #10;
    if (output_data !== data_inputs[0]) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", data_inputs[0], output_data);
      $finish;
    end

    // Test case 2: Select input 1
    select_line = 4'b0001; // Select second input
    #10;
    if (output_data !== data_inputs[1]) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", data_inputs[1], output_data);
      $finish;
    end

    // Test case 3: Select input 2
    select_line = 4'b0010; // Select third input
    #10;
    if (output_data !== data_inputs[2]) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", data_inputs[2], output_data);
      $finish;
    end

    // Test case 4: Select input 3
    select_line = 4'b0011; // Select fourth input
    #10;
    if (output_data !== data_inputs[3]) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", data_inputs[3], output_data);
      $finish;
    end

    // Test case 5: Select input 15
    select_line = 4'b1111; // Select last input
    #10;
    if (output_data !== data_inputs[15]) begin
      $display("FAIL: Test case 5 failed, expected %b, got %b", data_inputs[15], output_data);
      $finish;
    end

    // Test case 6: Undefined input state
    select_line = 4'b1110; // Select second last input
    #10;
    if (output_data !== data_inputs[14]) begin
      $display("FAIL: Test case 6 failed, expected %b, got %b", data_inputs[14], output_data);
      $finish;
    end

    // Test case 7: Default case
    select_line = 4'bxxxx; // Undefined select line
    #10;
    if (output_data !== 1'b0) begin
      $display("FAIL: Test case 7 failed, expected 0, got %b", output_data);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule