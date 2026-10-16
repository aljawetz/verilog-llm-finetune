`timescale 1ns/1ps

module tb_demux1to8;

  reg in;
  reg [2:0] sel;
  wire [7:0] y;

  // Instantiate the module under test
  demux1to8 uut (
      .in(in),
      .sel(sel),
      .y(y)
  );

  initial begin
    // Initialize inputs
    in = 0;
    sel = 3'b000;

    // Test all selector values
    #10 in = 1; sel = 3'b000; #10 check_output(8'b00000001);
    #10 sel = 3'b001; #10 check_output(8'b00000010);
    #10 sel = 3'b010; #10 check_output(8'b00000100);
    #10 sel = 3'b011; #10 check_output(8'b00001000);
    #10 sel = 3'b100; #10 check_output(8'b00010000);
    #10 sel = 3'b101; #10 check_output(8'b00100000);
    #10 sel = 3'b110; #10 check_output(8'b01000000);
    #10 sel = 3'b111; #10 check_output(8'b10000000);

    // Test with input low
    #10 in = 0; sel = 3'b000; #10 check_output(8'b00000000);
    #10 sel = 3'b001; #10 check_output(8'b00000000);
    #10 sel = 3'b010; #10 check_output(8'b00000000);
    #10 sel = 3'b011; #10 check_output(8'b00000000);
    #10 sel = 3'b100; #10 check_output(8'b00000000);
    #10 sel = 3'b101; #10 check_output(8'b00000000);
    #10 sel = 3'b110; #10 check_output(8'b00000000);
    #10 sel = 3'b111; #10 check_output(8'b00000000);

    $display("PASS");
    $finish;
  end

  task check_output(input [7:0] expected);
    if (y !== expected) begin
      $display("FAIL: Expected %b but got %b for sel = %b", expected, y, sel);
      $finish;
    end
  endtask

endmodule