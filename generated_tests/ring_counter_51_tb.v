`timescale 1ns/1ps

module tb_ring_counter;

  // Parameters
  parameter N = 4;

  // Inputs
  reg clk;
  reg rst;

  // Outputs
  wire [N-1:0] q;

  // Instantiate the Unit Under Test (UUT)
  ring_counter #(N) uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for a clock cycle
    rst = 0;

    // Check initial state
    if (q !== 4'b1000) begin
      $display("FAIL: Initial state is incorrect, got %b", q);
      $finish;
    end

    // Run the counter for 8 cycles
    repeat (8) begin
      #10; // Wait for a clock cycle
      // Check the output
      case (q)
        4'b1000: ; // Correct state
        4'b0100: ; // Correct state
        4'b0010: ; // Correct state
        4'b0001: ; // Correct state
        default: begin
          $display("FAIL: Unexpected state %b", q);
          $finish;
        end
      endcase
    end

    // Assert final state after 8 cycles
    if (q !== 4'b1000) begin
      $display("FAIL: Final state is incorrect, got %b", q);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule