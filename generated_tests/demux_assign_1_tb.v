`timescale 1ns/1ps

module tb_demux_assign;

  parameter DAT_WIDTH = 8;
  parameter SEL_WIDTH = 4;
  parameter NUM_OUTPUTS = 2**SEL_WIDTH;

  reg [DAT_WIDTH-1:0] demux_in;
  reg [SEL_WIDTH-1:0] sel_in;
  wire [(NUM_OUTPUTS*DAT_WIDTH)-1:0] demux_out;

  // Instantiate the module under test
  demux_assign #(
    .DAT_WIDTH(DAT_WIDTH),
    .SEL_WIDTH(SEL_WIDTH)
  ) uut (
    .demux_in(demux_in),
    .sel_in(sel_in),
    .demux_out(demux_out)
  );

  initial begin
    // Test case 1: Select output 0
    demux_in = 8'b10101010; // Input data
    sel_in = 4'b0000;      // Select output 0
    #10;
    if (demux_out[7:0] !== 8'b10101010) begin
      $display("FAIL: Test case 1 failed for output 0");
      $finish;
    end
    for (integer i = 1; i < NUM_OUTPUTS; i = i + 1) begin
      if (demux_out[i*DAT_WIDTH +: DAT_WIDTH] !== 8'b00000000) begin
        $display("FAIL: Test case 1 failed for output %0d", i);
        $finish;
      end
    end

    // Test case 2: Select output 1
    demux_in = 8'b11001100; // Input data
    sel_in = 4'b0001;      // Select output 1
    #10;
    if (demux_out[15:8] !== 8'b11001100) begin
      $display("FAIL: Test case 2 failed for output 1");
      $finish;
    end
    for (integer i = 0; i < NUM_OUTPUTS; i = i + 1) begin
      if (i != 1 && demux_out[i*DAT_WIDTH +: DAT_WIDTH] !== 8'b00000000) begin
        $display("FAIL: Test case 2 failed for output %0d", i);
        $finish;
      end
    end

    // Test case 3: Select output 2
    demux_in = 8'b11110000; // Input data
    sel_in = 4'b0010;      // Select output 2
    #10;
    if (demux_out[23:16] !== 8'b11110000) begin
      $display("FAIL: Test case 3 failed for output 2");
      $finish;
    end
    for (integer i = 0; i < NUM_OUTPUTS; i = i + 1) begin
      if (i != 2 && demux_out[i*DAT_WIDTH +: DAT_WIDTH] !== 8'b00000000) begin
        $display("FAIL: Test case 3 failed for output %0d", i);
        $finish;
      end
    end

    // Test case 4: Select output 3
    demux_in = 8'b00001111; // Input data
    sel_in = 4'b0011;      // Select output 3
    #10;
    if (demux_out[31:24] !== 8'b00001111) begin
      $display("FAIL: Test case 4 failed for output 3");
      $finish;
    end
    for (integer i = 0; i < NUM_OUTPUTS; i = i + 1) begin
      if (i != 3 && demux_out[i*DAT_WIDTH +: DAT_WIDTH] !== 8'b00000000) begin
        $display("FAIL: Test case 4 failed for output %0d", i);
        $finish;
      end
    end

    $display("PASS");
    $finish;
  end

endmodule