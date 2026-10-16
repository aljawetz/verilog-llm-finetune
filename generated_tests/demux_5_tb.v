`timescale 1ns/1ps

module tb_demux;

  parameter DAT_WIDTH = 8;
  parameter SEL_WIDTH = 4;
  parameter NUM_OUTPUTS = 2**SEL_WIDTH;

  reg [DAT_WIDTH-1:0] demux_in;
  reg [SEL_WIDTH-1:0] sel_in;
  wire [(NUM_OUTPUTS*DAT_WIDTH)-1:0] demux_out;

  // Instantiate the demux module
  demux #(
    .DAT_WIDTH(DAT_WIDTH),
    .SEL_WIDTH(SEL_WIDTH)
  ) uut (
    .demux_in(demux_in),
    .sel_in(sel_in),
    .demux_out(demux_out)
  );

  initial begin
    // Initialize inputs
    demux_in = 8'b00000000;
    sel_in = 4'b0000;

    // Test case 1: Select output 0
    demux_in = 8'b10101010; // Input data
    sel_in = 4'b0000;       // Select output 0
    #10;
    if (demux_out[7:0] !== 8'b10101010) begin
      $display("FAIL: Output 0 did not match expected value");
      $finish;
    end

    // Test case 2: Select output 1
    demux_in = 8'b11001100; // Input data
    sel_in = 4'b0001;       // Select output 1
    #10;
    if (demux_out[15:8] !== 8'b11001100) begin
      $display("FAIL: Output 1 did not match expected value");
      $finish;
    end

    // Test case 3: Select output 2
    demux_in = 8'b11110000; // Input data
    sel_in = 4'b0010;       // Select output 2
    #10;
    if (demux_out[23:16] !== 8'b11110000) begin
      $display("FAIL: Output 2 did not match expected value");
      $finish;
    end

    // Test case 4: Select output 3
    demux_in = 8'b00001111; // Input data
    sel_in = 4'b0011;       // Select output 3
    #10;
    if (demux_out[31:24] !== 8'b00001111) begin
      $display("FAIL: Output 3 did not match expected value");
      $finish;
    end

    // Test case 5: Select output 4
    demux_in = 8'b11111111; // Input data
    sel_in = 4'b0100;       // Select output 4
    #10;
    if (demux_out[39:32] !== 8'b11111111) begin
      $display("FAIL: Output 4 did not match expected value");
      $finish;
    end

    // Test case 6: Select output 5
    demux_in = 8'b00000001; // Input data
    sel_in = 4'b0101;       // Select output 5
    #10;
    if (demux_out[47:40] !== 8'b00000001) begin
      $display("FAIL: Output 5 did not match expected value");
      $finish;
    end

    // Test case 7: Select output 6
    demux_in = 8'b10111100; // Input data
    sel_in = 4'b0110;       // Select output 6
    #10;
    if (demux_out[55:48] !== 8'b10111100) begin
      $display("FAIL: Output 6 did not match expected value");
      $finish;
    end

    // Test case 8: Select output 7
    demux_in = 8'b01010101; // Input data
    sel_in = 4'b0111;       // Select output 7
    #10;
    if (demux_out[63:56] !== 8'b01010101) begin
      $display("FAIL: Output 7 did not match expected value");
      $finish;
    end

    // Final check: Ensure all other outputs are zero
    #10;
    for (integer i = 0; i < NUM_OUTPUTS; i = i + 1) begin
      if (i != sel_in) begin
        if (demux_out[(i*DAT_WIDTH) +: DAT_WIDTH] !== 8'b0) begin
          $display("FAIL: Output %0d is not zero", i);
          $finish;
        end
      end
    end

    $display("PASS");
    $finish;
  end

endmodule