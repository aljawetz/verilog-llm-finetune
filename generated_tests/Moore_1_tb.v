`timescale 1ns/1ps

module tb_Moore;

  reg clk;
  reg rst;
  reg data_in;
  wire data_out;
  wire [5:0] state;
  wire [5:0] next_state;

  // Instantiate the module under test
  Moore uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out),
    .state(state),
    .next_state(next_state)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    data_in = 0;
    #10; // Wait for a clock cycle
    rst = 0;

    // Test sequence
    // Test state transitions
    // Initial state should be S0
    if (state !== 6'b000000) begin
      $display("FAIL: Initial state is not S0");
      $finish;
    end

    // Transition to S1
    data_in = 1; #10;
    if (state !== 6'b000001) begin
      $display("FAIL: State did not transition to S1");
      $finish;
    end

    // Transition to S2
    data_in = 1; #10;
    if (state !== 6'b000010) begin
      $display("FAIL: State did not transition to S2");
      $finish;
    end

    // Transition to S3
    data_in = 0; #10;
    if (state !== 6'b000011) begin
      $display("FAIL: State did not transition to S3");
      $finish;
    end

    // Transition to S4
    data_in = 1; #10;
    if (state !== 6'b000100) begin
      $display("FAIL: State did not transition to S4");
      $finish;
    end

    // Transition to S5
    data_in = 1; #10;
    if (state !== 6'b000101) begin
      $display("FAIL: State did not transition to S5");
      $finish;
    end

    // Check output at S5
    if (data_out !== 1) begin
      $display("FAIL: Output is not asserted at S5");
      $finish;
    end

    // Transition back to S2
    data_in = 1; #10;
    if (state !== 6'b000010) begin
      $display("FAIL: State did not transition back to S2");
      $finish;
    end

    // Transition to S3
    data_in = 0; #10;
    if (state !== 6'b000011) begin
      $display("FAIL: State did not transition back to S3");
      $finish;
    end

    // Reset the FSM
    rst = 1; #10;
    rst = 0; #10;
    if (state !== 6'b000000) begin
      $display("FAIL: State is not reset to S0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule