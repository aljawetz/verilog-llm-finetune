`timescale 1ns/1ps

module tb_demux1x4;

  reg [1:0] in;
  reg sel;
  wire o0, o1, o2, o3;

  // Instantiate the module under test (uut)
  demux1x4 uut (
    .in(in),
    .sel(sel),
    .o0(o0),
    .o1(o1),
    .o2(o2),
    .o3(o3)
  );

  initial begin
    // Test case 1: Select output 0
    in = 2'b00; sel = 1'b1; #10;
    if (o0 !== 1'b1 || o1 !== 1'b0 || o2 !== 1'b0 || o3 !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Select output 1
    in = 2'b01; sel = 1'b1; #10;
    if (o0 !== 1'b0 || o1 !== 1'b1 || o2 !== 1'b0 || o3 !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Select output 2
    in = 2'b10; sel = 1'b1; #10;
    if (o0 !== 1'b0 || o1 !== 1'b0 || o2 !== 1'b1 || o3 !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Select output 3
    in = 2'b11; sel = 1'b1; #10;
    if (o0 !== 1'b0 || o1 !== 1'b0 || o2 !== 1'b0 || o3 !== 1'b1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Check with sel = 0
    in = 2'b00; sel = 1'b0; #10;
    if (o0 !== 1'b0 || o1 !== 1'b0 || o2 !== 1'b0 || o3 !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Check with sel = 0 for other inputs
    in = 2'b01; sel = 1'b0; #10;
    if (o0 !== 1'b0 || o1 !== 1'b0 || o2 !== 1'b0 || o3 !== 1'b0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    in = 2'b10; sel = 1'b0; #10;
    if (o0 !== 1'b0 || o1 !== 1'b0 || o2 !== 1'b0 || o3 !== 1'b0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    in = 2'b11; sel = 1'b0; #10;
    if (o0 !== 1'b0 || o1 !== 1'b0 || o2 !== 1'b0 || o3 !== 1'b0) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule