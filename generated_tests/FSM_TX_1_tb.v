`timescale 1ns/1ps

module tb_FSM_TX;

  reg Data_Valid;
  reg ser_done;
  reg PAR_EN;
  reg clk;
  reg RST;
  wire ser_en;
  wire [1:0] mux_sel;
  wire busy;

  // Instantiate the FSM_TX module
  FSM_TX uut (
    .Data_Valid(Data_Valid),
    .ser_done(ser_done),
    .PAR_EN(PAR_EN),
    .clk(clk),
    .RST(RST),
    .ser_en(ser_en),
    .mux_sel(mux_sel),
    .busy(busy)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    RST = 0;
    Data_Valid = 0;
    ser_done = 0;
    PAR_EN = 0;

    // Reset the FSM
    #10 RST = 1;

    // Test case 1: Transition from IDLE to START
    #10 Data_Valid = 1; // Set Data_Valid to trigger state change
    #10 if (uut.current_state !== 3'b001) $display("FAIL: Expected state START after Data_Valid");
    
    // Test case 2: Transition from START to DATA
    #10 Data_Valid = 0; // Clear Data_Valid
    #10 if (uut.current_state !== 3'b010) $display("FAIL: Expected state DATA after START");

    // Test case 3: Transition from DATA to STOP without PAR_EN
    #10 ser_done = 1; // Indicate data transmission done
    #10 if (uut.current_state !== 3'b100) $display("FAIL: Expected state STOP after ser_done without PAR_EN");

    // Test case 4: Transition from STOP to IDLE
    #10 if (uut.current_state !== 3'b000) $display("FAIL: Expected state IDLE after STOP");

    // Test case 5: Test with PAR_EN
    #10 Data_Valid = 1; // Set Data_Valid again
    #10 if (uut.current_state !== 3'b001) $display("FAIL: Expected state START after Data_Valid");
    #10 Data_Valid = 0; // Clear Data_Valid
    #10 ser_done = 1; // Indicate data transmission done
    PAR_EN = 1; // Enable parity
    #10 if (uut.current_state !== 3'b011) $display("FAIL: Expected state PARITY after ser_done with PAR_EN");

    // Test case 6: Transition from PARITY to STOP
    #10 if (uut.current_state !== 3'b100) $display("FAIL: Expected state STOP after PARITY");

    // Final checks
    #10 if (uut.busy !== 1'b0) $display("FAIL: Expected busy to be 0 after STOP");
    #10 if (uut.ser_en !== 1'b0) $display("FAIL: Expected ser_en to be 0 after STOP");
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule