`timescale 1ns/1ps

module tb_jFIFO;
  reg clock;
  reg reset;
  reg wn;
  reg rn;
  reg [7:0] DATAIN;
  wire [7:0] DATAOUT;
  wire full;
  wire empty;

  // Instantiate the jFIFO module
  jFIFO uut (
    .DATAOUT(DATAOUT),
    .full(full),
    .empty(empty),
    .clock(clock),
    .reset(reset),
    .wn(wn),
    .rn(rn),
    .DATAIN(DATAIN)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    wn = 0;
    rn = 0;
    DATAIN = 8'b0;

    // Release reset
    #10 reset = 0;

    // Test 1: Check empty and full signals
    if (!empty) $display("FAIL: Expected empty to be 1 after reset");
    if (full) $display("FAIL: Expected full to be 0 after reset");

    // Test 2: Write data into FIFO
    wn = 1; DATAIN = 8'hAA; #10; // Write 0xAA
    wn = 0; #10; // Wait for clock edge
    if (DATAOUT !== 8'b0) $display("FAIL: Expected DATAOUT to be 0 after first write");

    wn = 1; DATAIN = 8'hBB; #10; // Write 0xBB
    wn = 0; #10; // Wait for clock edge
    if (DATAOUT !== 8'b0) $display("FAIL: Expected DATAOUT to be 0 after second write");

    // Test 3: Read data from FIFO
    rn = 1; #10; // Read
    if (DATAOUT !== 8'hAA) $display("FAIL: Expected DATAOUT to be 0xAA after first read");
    rn = 0; #10; // Wait for clock edge

    rn = 1; #10; // Read
    if (DATAOUT !== 8'hBB) $display("FAIL: Expected DATAOUT to be 0xBB after second read");
    rn = 0; #10; // Wait for clock edge

    // Test 4: Check empty signal after reads
    if (!empty) $display("FAIL: Expected empty to be 1 after all reads");

    // Test 5: Fill FIFO to full
    wn = 1; DATAIN = 8'hCC; #10; // Write 0xCC
    wn = 0; #10; // Wait for clock edge
    wn = 1; DATAIN = 8'hDD; #10; // Write 0xDD
    wn = 0; #10; // Wait for clock edge
    wn = 1; DATAIN = 8'hEE; #10; // Write 0xEE
    wn = 0; #10; // Wait for clock edge
    wn = 1; DATAIN = 8'hFF; #10; // Write 0xFF
    wn = 0; #10; // Wait for clock edge

    // Read all data
    rn = 1; #10; // Read
    if (DATAOUT !== 8'hCC) $display("FAIL: Expected DATAOUT to be 0xCC");
    rn = 0; #10; // Wait for clock edge

    rn = 1; #10; // Read
    if (DATAOUT !== 8'hDD) $display("FAIL: Expected DATAOUT to be 0xDD");
    rn = 0; #10; // Wait for clock edge

    rn = 1; #10; // Read
    if (DATAOUT !== 8'hEE) $display("FAIL: Expected DATAOUT to be 0xEE");
    rn = 0; #10; // Wait for clock edge

    rn = 1; #10; // Read
    if (DATAOUT !== 8'hFF) $display("FAIL: Expected DATAOUT to be 0xFF");
    rn = 0; #10; // Wait for clock edge

    // Test 6: Check full signal
    if (full) $display("FAIL: Expected full to be 0 after reads");

    // Finish simulation
    $display("PASS");
    $finish;
  end
endmodule