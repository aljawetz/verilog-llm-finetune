`timescale 1ns/1ps

module tb_MATLAB_Function;

  reg signed [17:0] threshold;
  reg signed [17:0] DataBuff_0;
  reg signed [17:0] DataBuff_1;
  reg signed [17:0] DataBuff_2;
  reg signed [17:0] DataBuff_3;
  reg signed [17:0] DataBuff_4;
  reg signed [17:0] DataBuff_5;
  reg signed [17:0] DataBuff_6;
  reg signed [17:0] DataBuff_7;
  reg signed [17:0] DataBuff_8;
  reg signed [17:0] DataBuff_9;
  reg signed [17:0] DataBuff_10;
  wire signed [17:0] MidSample;
  wire detected;

  // Instantiate the module under test
  MATLAB_Function uut (
    .threshold(threshold),
    .DataBuff_0(DataBuff_0),
    .DataBuff_1(DataBuff_1),
    .DataBuff_2(DataBuff_2),
    .DataBuff_3(DataBuff_3),
    .DataBuff_4(DataBuff_4),
    .DataBuff_5(DataBuff_5),
    .DataBuff_6(DataBuff_6),
    .DataBuff_7(DataBuff_7),
    .DataBuff_8(DataBuff_8),
    .DataBuff_9(DataBuff_9),
    .DataBuff_10(DataBuff_10),
    .MidSample(MidSample),
    .detected(detected)
  );

  initial begin
    // Test Case 1: Local max detected
    threshold = 10;
    DataBuff_0 = 5;
    DataBuff_1 = 7;
    DataBuff_2 = 9;
    DataBuff_3 = 12;
    DataBuff_4 = 15;
    DataBuff_5 = 20; // MidSample
    DataBuff_6 = 15;
    DataBuff_7 = 10;
    DataBuff_8 = 5;
    DataBuff_9 = 3;
    DataBuff_10 = 1;

    #10; // Wait for the module to process
    if (MidSample !== 20 || detected !== 1) begin
      $display("FAIL: Test Case 1 failed");
      $finish;
    end

    // Test Case 2: No local max detected
    threshold = 15;
    DataBuff_0 = 5;
    DataBuff_1 = 7;
    DataBuff_2 = 9;
    DataBuff_3 = 12;
    DataBuff_4 = 15;
    DataBuff_5 = 10; // MidSample
    DataBuff_6 = 15;
    DataBuff_7 = 10;
    DataBuff_8 = 5;
    DataBuff_9 = 3;
    DataBuff_10 = 1;

    #10; // Wait for the module to process
    if (MidSample !== 10 || detected !== 0) begin
      $display("FAIL: Test Case 2 failed");
      $finish;
    end

    // Test Case 3: MidSample equal to threshold
    threshold = 20;
    DataBuff_0 = 5;
    DataBuff_1 = 7;
    DataBuff_2 = 9;
    DataBuff_3 = 12;
    DataBuff_4 = 15;
    DataBuff_5 = 20; // MidSample
    DataBuff_6 = 25;
    DataBuff_7 = 30;
    DataBuff_8 = 35;
    DataBuff_9 = 40;
    DataBuff_10 = 45;

    #10; // Wait for the module to process
    if (MidSample !== 20 || detected !== 0) begin
      $display("FAIL: Test Case 3 failed");
      $finish;
    end

    // Test Case 4: All values below threshold
    threshold = 50;
    DataBuff_0 = 5;
    DataBuff_1 = 7;
    DataBuff_2 = 9;
    DataBuff_3 = 12;
    DataBuff_4 = 15;
    DataBuff_5 = 20; // MidSample
    DataBuff_6 = 25;
    DataBuff_7 = 30;
    DataBuff_8 = 35;
    DataBuff_9 = 40;
    DataBuff_10 = 45;

    #10; // Wait for the module to process
    if (MidSample !== 20 || detected !== 0) begin
      $display("FAIL: Test Case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule