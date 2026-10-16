`timescale 1ns/1ps

module tb_demux_generate;

  // Inputs
  reg [2:0] sel;
  reg i;

  // Outputs
  wire o0, o1, o2, o3, o4, o5, o6, o7;

  // Instantiate the Unit Under Test (UUT)
  demux_generate uut (
    .o0(o0), .o1(o1), .o2(o2), .o3(o3), .o4(o4), .o5(o5), .o6(o6), .o7(o7),
    .sel(sel), .i(i)
  );

  initial begin
    // Initialize Inputs
    sel = 3'b000;
    i = 0;

    // Test case 1: Select output 0
    i = 1;
    sel = 3'b000;
    #10;
    if (o0 !== 1 || o1 !== 0 || o2 !== 0 || o3 !== 0 || o4 !== 0 || o5 !== 0 || o6 !== 0 || o7 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Select output 1
    i = 1;
    sel = 3'b001;
    #10;
    if (o0 !== 0 || o1 !== 1 || o2 !== 0 || o3 !== 0 || o4 !== 0 || o5 !== 0 || o6 !== 0 || o7 !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Select output 2
    i = 1;
    sel = 3'b010;
    #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 1 || o3 !== 0 || o4 !== 0 || o5 !== 0 || o6 !== 0 || o7 !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Select output 3
    i = 1;
    sel = 3'b011;
    #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 1 || o4 !== 0 || o5 !== 0 || o6 !== 0 || o7 !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Select output 4
    i = 1;
    sel = 3'b100;
    #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 0 || o4 !== 1 || o5 !== 0 || o6 !== 0 || o7 !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Select output 5
    i = 1;
    sel = 3'b101;
    #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 0 || o4 !== 0 || o5 !== 1 || o6 !== 0 || o7 !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: Select output 6
    i = 1;
    sel = 3'b110;
    #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 0 || o4 !== 0 || o5 !== 0 || o6 !== 1 || o7 !== 0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: Select output 7
    i = 1;
    sel = 3'b111;
    #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 0 || o4 !== 0 || o5 !== 0 || o6 !== 0 || o7 !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule