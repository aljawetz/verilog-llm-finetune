`timescale 1ns/1ps

module tb_mux;

  parameter WIDTH = 8;
  reg [WIDTH-1:0] in0, in1, in2, in3, in4, in5, in6, in7;
  reg [2:0] op;
  wire [WIDTH-1:0] y;

  // Instantiate the module under test
  mux #(WIDTH) uut (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .op(op),
    .y(y)
  );

  initial begin
    // Initialize inputs
    in0 = 8'h00; in1 = 8'h11; in2 = 8'h22; in3 = 8'h33;
    in4 = 8'h44; in5 = 8'h55; in6 = 8'h66; in7 = 8'h77;

    // Test each selector
    op = 3'b000; #10; if (y !== in0) $display("FAIL: Expected %h, got %h for op=%b", in0, y, op);
    op = 3'b001; #10; if (y !== in1) $display("FAIL: Expected %h, got %h for op=%b", in1, y, op);
    op = 3'b010; #10; if (y !== in2) $display("FAIL: Expected %h, got %h for op=%b", in2, y, op);
    op = 3'b011; #10; if (y !== in3) $display("FAIL: Expected %h, got %h for op=%b", in3, y, op);
    op = 3'b100; #10; if (y !== in4) $display("FAIL: Expected %h, got %h for op=%b", in4, y, op);
    op = 3'b101; #10; if (y !== in5) $display("FAIL: Expected %h, got %h for op=%b", in5, y, op);
    op = 3'b110; #10; if (y !== in6) $display("FAIL: Expected %h, got %h for op=%b", in6, y, op);
    op = 3'b111; #10; if (y !== in7) $display("FAIL: Expected %h, got %h for op=%b", in7, y, op);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule