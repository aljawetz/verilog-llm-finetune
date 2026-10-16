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
    // Test case 1: Peak detection
    threshold = 10;
    DataBuff_0 = 5;
    DataBuff_1 = 6;
    DataBuff_2 = 7;
    DataBuff_3 = 8;
    DataBuff_4 = 9;
    DataBuff_5 = 15; // This should be detected as a peak
    DataBuff_6 = 9;
    DataBuff_7 = 8;
    DataBuff_8 = 7;
    DataBuff_9 = 6;
    DataBuff_10 = 5;

    #10; // Wait for the module to process
    if (MidSample !== 15 || detected !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: No peak detection
    threshold = 10;
    DataBuff_0 = 5;
    DataBuff_1 = 6;
    DataBuff_2 = 7;
    DataBuff_3 = 8;
    DataBuff_4 = 9;
    DataBuff_5 = 8; // Not a peak
    DataBuff_6 = 9;
    DataBuff_7 = 8;
    DataBuff_8 = 7;
    DataBuff_9 = 6;
    DataBuff_10 = 5;

    #10; // Wait for the module to process
    if (MidSample !== 8 || detected !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Peak with threshold
    threshold = 14;
    DataBuff_0 = 5;
    DataBuff_1 = 6;
    DataBuff_2 = 7;
    DataBuff_3 = 8;
    DataBuff_4 = 9;
    DataBuff_5 = 15; // This should be detected as a peak
    DataBuff_6 = 9;
    DataBuff_7 = 8;
    DataBuff_8 = 7;
    DataBuff_9 = 6;
    DataBuff_10 = 5;

    #10; // Wait for the module to process
    if (MidSample !== 15 || detected !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Peak below threshold
    threshold = 20;
    DataBuff_0 = 5;
    DataBuff_1 = 6;
    DataBuff_2 = 7;
    DataBuff_3 = 8;
    DataBuff_4 = 9;
    DataBuff_5 = 15; // This should NOT be detected as a peak
    DataBuff_6 = 9;
    DataBuff_7 = 8;
    DataBuff_8 = 7;
    DataBuff_9 = 6;
    DataBuff_10 = 5;

    #10; // Wait for the module to process
    if (MidSample !== 15 || detected !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule