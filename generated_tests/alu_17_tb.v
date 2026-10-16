`timescale 1ns/1ps

module tb_alu;

  reg [2:0] data_a;
  reg [2:0] data_b;
  reg [1:0] compute;
  reg en;
  wire [3:0] data_out;

  alu uut (
    .data_a(data_a),
    .data_b(data_b),
    .compute(compute),
    .en(en),
    .data_out(data_out)
  );

  initial begin
    // Test case 1: AND operation
    en = 1; data_a = 3'b101; data_b = 3'b110; compute = 2'b00;
    #10;
    if (data_out !== 4'b100) $display("FAIL: AND operation failed");

    // Test case 2: OR operation
    en = 1; data_a = 3'b101; data_b = 3'b110; compute = 2'b01;
    #10;
    if (data_out !== 4'b111) $display("FAIL: OR operation failed");

    // Test case 3: Addition operation
    en = 1; data_a = 3'b011; data_b = 3'b001; compute = 2'b10;
    #10;
    if (data_out !== 4'b100) $display("FAIL: Addition operation failed");

    // Test case 4: Inversion operation
    en = 1; data_a = 3'b101; compute = 2'b11;
    #10;
    if (data_out !== 4'b010) $display("FAIL: Inversion operation failed");

    // Test case 5: Disabled operations
    en = 0; data_a = 3'b111; data_b = 3'b000; compute = 2'b00;
    #10;
    if (data_out !== 4'b0000) $display("FAIL: Disabled AND operation failed");

    // Test case 6: Default case
    en = 1; data_a = 3'b000; data_b = 3'b000; compute = 2'bxx; // invalid compute
    #10;
    if (data_out !== 4'b0000) $display("FAIL: Default case failed");

    $display("PASS");
    $finish;
  end

endmodule