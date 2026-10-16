`timescale 1ns/1ps

module tb_NV_NVDLA_SDP_BRDMA_IG_pipe_p4;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [78:0] cv_int_rd_req_pd_d0;
  reg cv_int_rd_req_ready_d1;
  reg cv_int_rd_req_valid_d0;
  wire [78:0] cv_int_rd_req_pd_d1;
  wire cv_int_rd_req_ready_d0;
  wire cv_int_rd_req_valid_d1;

  // Instantiate the module under test
  NV_NVDLA_SDP_BRDMA_IG_pipe_p4 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .cv_int_rd_req_pd_d0(cv_int_rd_req_pd_d0),
    .cv_int_rd_req_ready_d1(cv_int_rd_req_ready_d1),
    .cv_int_rd_req_valid_d0(cv_int_rd_req_valid_d0),
    .cv_int_rd_req_pd_d1(cv_int_rd_req_pd_d1),
    .cv_int_rd_req_ready_d0(cv_int_rd_req_ready_d0),
    .cv_int_rd_req_valid_d1(cv_int_rd_req_valid_d1)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    cv_int_rd_req_ready_d1 = 0;
    cv_int_rd_req_valid_d0 = 0;
    cv_int_rd_req_pd_d0 = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test 1: Valid data transfer
    #10;
    cv_int_rd_req_pd_d0 = 79'h1; // Send data
    cv_int_rd_req_valid_d0 = 1; // Indicate valid data
    cv_int_rd_req_ready_d1 = 1; // Indicate ready to receive
    #10;

    if (cv_int_rd_req_valid_d1 !== 1 || cv_int_rd_req_pd_d1 !== 79'h1) begin
      $display("FAIL: Test 1 failed - Data not transferred correctly");
      $finish;
    end

    // Test 2: No valid data
    #10;
    cv_int_rd_req_valid_d0 = 0; // Indicate no valid data
    #10;

    if (cv_int_rd_req_valid_d1 !== 0) begin
      $display("FAIL: Test 2 failed - Valid signal should be low");
      $finish;
    end

    // Test 3: Reset functionality
    #10;
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Deassert reset

    if (cv_int_rd_req_valid_d1 !== 0) begin
      $display("FAIL: Test 3 failed - Valid signal should be low after reset");
      $finish;
    end

    // Test 4: Valid data transfer after reset
    #10;
    cv_int_rd_req_pd_d0 = 79'h2; // Send new data
    cv_int_rd_req_valid_d0 = 1; // Indicate valid data
    cv_int_rd_req_ready_d1 = 1; // Indicate ready to receive
    #10;

    if (cv_int_rd_req_valid_d1 !== 1 || cv_int_rd_req_pd_d1 !== 79'h2) begin
      $display("FAIL: Test 4 failed - Data not transferred correctly after reset");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule